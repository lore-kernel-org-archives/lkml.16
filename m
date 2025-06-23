Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6549C46BF
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 02:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750644300; cv=fail; b=UfL/pKAMTNpkJbBrGXJ89rn/eVmgmqqo1HF4WUuNn9uh9RDL+RCIh8k7YBXDVt7LAXtW9ZPHUFPU+S+mR+Bd3U/Ri4zES+M5nW0CEj4/ZQ24IoSCwSk1qEaSsIP/G4zeyto94J/EYTc/H9XI6pOpIdf/i09pJLEk5OaiVOZmXXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750644300; c=relaxed/simple;
	bh=qHKW9FczeoGyWyLMxZehtDi0aP2gfeRk8pR3y/mrZMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qHI1eEJpcQbINbAz6s6JJ16IyTu4sWNTZmPOw33BCJhvndVv0RP0XGdktIrJvNmHh7K4FR0QHy2s34/d6zzv8t2fgir8ZplcT1RJCNcIiaXuUnm7Bh4CWeqaNWWiMNDhxyX4CWRcwaHQfdSEr6oxMzQvqhmWO8iRE9bepLh2Udo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=K2Va7Oaj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VF9HN341; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="K2Va7Oaj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VF9HN341"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N0QnPq009388;
	Mon, 23 Jun 2025 02:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=965mLz7Ot+JqmcRJQFJ1pSgrgc2fVJV1etrKZpGZQ1U=; b=
	K2Va7OajH4d9s0aF6MV5XjaIzNzRdii8KcPV7W2NoAB+MXIxNnoTsrMV6D4hZ2Z3
	4sdXrXf5RSVOTtzaYjVvCRXWS6WBu7L5JMI84n148dSoeU6v/RktiN9JIuknSku5
	L6uYPxv1aS2XyMmBMSE647weY5WHy9egmXP0+CgEl0wdCjiXcR2sq3E5QCAAIlnV
	YHfb+gOL8QHs6S7wlNldpipY68DCP/qj61WEY+Nm2Qnqv0VGPrextL3ji0Ekgg32
	Lu2exjs+r/IhXJS63GVKsGs+Yxw0pGlumqWOrFyuwXa1MA9p+AvXfbDJCKdsnE7G
	rscx+H34dgEKK+ONFr454Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8mspgv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 02:04:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55N0r5PU025759;
	Mon, 23 Jun 2025 02:04:23 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2070.outbound.protection.outlook.com [40.107.92.70])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehvu9fn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 02:04:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V6Sj5VG/EQc7kyVqaFrZZJrvmWr68t7Xz9BtT7x2UmKZlEc9JIdi1hxRtU3pMnlgHFYUPEJw1xdx8VZnOIpbF3HdT9A0Eyd/J2QHSeYcf3z8DoKlM5wNGaLPFj5fbVeooa5t0kr1ncZhEdeuiVO+UUeu7pcJy0kx7pWq+UruJ6SZa/BS01byulyN5JBntCtJnYBtC0JiyuT2lj6ACHE5XMU7xaqWPlVWjj2wJDlg9LUY//dfKUj9U2tfyU5RLgODAVa/dJZslmMOyuw/f94fq9FayySRw5Zuao9J5lgK6UMjBuLRqWJl6sgls5lB2zxAfbrFH/rHn4rCl+TQ/zb+jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=965mLz7Ot+JqmcRJQFJ1pSgrgc2fVJV1etrKZpGZQ1U=;
 b=onz6R+ZMK7QVgivtW7Pfp9IGzK2BD5gDPCb+d8LsqWyYsy9LyjpvwWYpZEHAUm9IacHTwlE19snPNY61izdgrhn8kYBW4Ksn/J185AmfR/WoMUEsptBNtv6YuEH3IY3uzqhstxfri99WDmkJIxhXWAd+gr3rC1PzW9SMGXYpju8xgSdT2Fl3NAbRjzrctSYj3qrSjdCFTGa/BPDMWTB5/D4+09rT50OB+rZvayyrzvbphQR3LYwFZzsPjuen12ivpox2CSQVVozEbOLdhco45zC6BtM1t0JH20V2bwa222utwasfFUs1y0PSPqVOa/pyQFAFZJd8DqauiUyy4LGXng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=965mLz7Ot+JqmcRJQFJ1pSgrgc2fVJV1etrKZpGZQ1U=;
 b=VF9HN341bt7qMj2sso5FzfhueDygsDcaRGzooQcAyretwfroDP0o6mwY44MlkH3dmFW+yMy0Rrx3w6++//+N67H1vr3CDAaiKcQJQ1Gk4DIzCHxeD0CkKEr6jCWn/0/5eBXNUlsIJSbYf7O4koTSRgEIQbh7VDDcg7M0JvoQAoM=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by DM3PPF1731B5308.namprd10.prod.outlook.com (2603:10b6:f:fc00::c0c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 23 Jun
 2025 02:04:21 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%6]) with mapi id 15.20.8857.025; Mon, 23 Jun 2025
 02:04:21 +0000
Date: Mon, 23 Jun 2025 11:04:13 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: David Wang <00107082@163.com>, oliver.sang@intel.com, urezki@gmail.com,
        ahuang12@lenovo.com, akpm@linux-foundation.org, bhe@redhat.com,
        hch@infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        lkp@intel.com, mjguzik@gmail.com, oe-lkp@lists.linux.dev,
        kent.overstreet@linux.dev
Subject: Re: CONFIG_TEST_VMALLOC=y conflict/race with alloc_tag_init
Message-ID: <aFi2HYlEhTXtuM1X@harry>
References: <202506181351.bba867dd-lkp@intel.com>
 <20250620100258.595495-1-00107082@163.com>
 <CAJuCfpFLKR7CqAHG+QjHt4wCLgWmP7dD+f5D8Jx6gHUoXSe1AA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpFLKR7CqAHG+QjHt4wCLgWmP7dD+f5D8Jx6gHUoXSe1AA@mail.gmail.com>
X-ClientProxiedBy: SL2P216CA0104.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:3::19) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|DM3PPF1731B5308:EE_
X-MS-Office365-Filtering-Correlation-Id: b0874284-6ce5-4ad4-ecd4-08ddb1fa447e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TVdwWTJqVS9YYjFnd1hRWklwd0xxelkzbFVzcFRjZkR0M2lVREc5ZEh5OVpR?=
 =?utf-8?B?dStrMUdXTkJLeVNLQWtQeGJJbWVyWjhqdlhyMEFicnFkUjNNOEY0YUhlbHoz?=
 =?utf-8?B?b2dlcnlqNGkzaGI1WFNXb0RJSEZNangxaEExdW8zbEpoZzZ3SXpFZUN0N2l2?=
 =?utf-8?B?SlJSbGpFU1dLNXVSejQ1NW80ZkEzUE0xbzA4MmRVMGxHaXB4OWp0N1Vrbm1L?=
 =?utf-8?B?SGVpUGVSUmVLYUxhakVHOWRHVW5VRVJTbnJodmJkeXVFbmM3KzFMVWpRaUYv?=
 =?utf-8?B?SVYzcGxkd0JIc21SeVhTU1FRMGZZZUpKQXpjWHY3MTNmeGdVK2doRFlNbmpl?=
 =?utf-8?B?bmw5czUrdFFvVTAwa0Z6Vml1MXNSNmRzV0pqYTVYeHQrbnI2WEN4T1N1QTk2?=
 =?utf-8?B?cjhzYUVnRldwUWV4UXY3elZuUWs5TGhDNG9YSkxDUVIwcTJKelZ6S1Q4d1g4?=
 =?utf-8?B?NWl3RDJPNGs3NTdUaTNlb2hITHVybHF4clJuai8wYUxvRE95MEpXSDFXYkRT?=
 =?utf-8?B?TWxtbWpZSmNlMzNWdExMMjBucU9aTi9FMk5LUGNteU1FUlRBRjhWNjdIbFlp?=
 =?utf-8?B?L3pSVTNtYzhTU0Q4M0Zwb2xDNjI5UlMvQThkcjNmN2N1NUhOR3huQitTOExp?=
 =?utf-8?B?U2pIczZGaUFyTUtmY0V5b3JZa2d6YUZIMlQxOFhILytUeWtyN2ZhUFFzL3Z4?=
 =?utf-8?B?a2huM0lQVTMrSnROdGVGMlkyekhSMjM1ZWk5WDFNWjRDMHpOOTFGdEtFMTdW?=
 =?utf-8?B?M01yVmtmbzgzK0cyblVoMGp4RnRQVWwxa3hocm5DZkpWTTVwRUZiTVlQRTla?=
 =?utf-8?B?dUhGd3g4elpqc2Z4KzFTVWtVWHUwT3ZjMTBHb3NtWEpwNmtEb2lPdjVLdE5p?=
 =?utf-8?B?ejRVYmpST1pXN2I0OWNyL0IvbXF2dnN3QnpkTUtwS0kwcVpwM1BKYzRJeldL?=
 =?utf-8?B?WHpkYkljSTVLdytSanorSnhyNmg2QTNPY2J6VU50dXdSTnRQNlFydkdaL25u?=
 =?utf-8?B?WEJYQ2ZpZktKb01PaXl3TWZ0U3VjZmwvWDdYTUUxeEQ4bkQrUExqSXArNkVT?=
 =?utf-8?B?VW44MElqZENodmNDdmgyYUpkcnNMSStaVldOdlNLZW13Zkl1R2V0MUl2TndX?=
 =?utf-8?B?NGxmY0NhbHdldFhFVDhhblpMN1pXdURFMElnOUVtS0svZFlJeWxxZFdWTEpP?=
 =?utf-8?B?SGpBczg4SXdBUjNiSmJOeWRvWDB4OEdyWEFzeERWZlE2TEtWRVZIWEpyb3Ft?=
 =?utf-8?B?WXdXY0tSWHdjTmdlWFlsVXcyeHpWbTI3RzNtbGZaajhkWnpyUmVBU2JzdTJR?=
 =?utf-8?B?dXBWeXBUK1l2QnB4aFl4ZEg3MTNJcVlMdkt0eHVwUmZQVEtic0gzMWFNSldK?=
 =?utf-8?B?R2Jycnp2SEhRWjRIVWNVK0VKNHVpejFMTzJUUW93dWttandERUt4V01PSXdv?=
 =?utf-8?B?Rkpnc2ZSb0gxMjQvbEtsNjRXekJiMHpQOS9HejlIczJ1aiszeGRaQkdnKzF0?=
 =?utf-8?B?Szc1SHBUY3Z2cjk3MVNESUJEV0R1V1k4SDlnVDZQTWZyWllrVUhUQ0VHQzBL?=
 =?utf-8?B?dXR6R1pTZGs5QzdhUDJheVloMGZwQzBLVVVFeU1NMkFORHpXQ3R6RmpjTlZk?=
 =?utf-8?B?MDdsYlBqSlBaQmpyUWhuVmhtUVFhWEtWOGtaVGJrakZUVkVUQTdjRHdnaUNh?=
 =?utf-8?B?ZEFUZEV5cnhieGZnSmtBOE83VTU5NStmZXVsMkYxM1pOZytuWHJHSzI2enM0?=
 =?utf-8?B?dEZ4ZTdPU29kaXhTRUdHd1dkeGFDZHl3YXhVL2tNNVY1a251dEc0VjcvaXNF?=
 =?utf-8?B?bXhhcm5sbVlrcmpJbFpVWCtxZVJLUzJld2pmMmFKTkV1RkRaN2lWQnJaSmhr?=
 =?utf-8?B?TUt0TFQ1NzdhelYwSnU1eGpjZURFenNyb2ZTQmsxc3NKV21paHkxdWhuVFhs?=
 =?utf-8?Q?JJIqCV6KGkE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWl2YUFmNWNDelZIVW92VUlkZkdEaGhZNjFzelhpSnJoRlc2dHArclpkZ0xH?=
 =?utf-8?B?YmtYU1VTYlduMko5WHJLdEFhc3lOVS9ROWtoV29aKzQzeDZVRGVySHRRR0Uz?=
 =?utf-8?B?dFpvc0tKRk9kZGl6QURmQmNRSmt6b1dNTzBSNW8yNGRodUFxVVJWSW1yUjF4?=
 =?utf-8?B?NDlYTy8xTXBxbzZNN2dnaFJsVG5mRkM1bGdNV0VHWUFFL3dwRytTai81c0dS?=
 =?utf-8?B?T2o4bWdMOXdoNktJMFVFUlVrTThEUzVsTGduRVpqWElFS0dvM01MVmlPekpo?=
 =?utf-8?B?YXVlVTFvUzBKM0ZqU1VMMFQ1R0t2eC9tMFBvOGhFUXhiVkxXSUp2NktjaFdR?=
 =?utf-8?B?dGMzR290djQvelBxdUU2WmgyQkhXQzNjNS9HckUxMjFhM1U3L2V3d3R5VmNJ?=
 =?utf-8?B?NXk1YVRwOGtHc3JLaDV4czErNUExcUlxUThWV1lYczdHNEFHUEVWV0lIa3Ba?=
 =?utf-8?B?VkVWck1yQ0dKVE9RWkIyRUpkVVJUMWN4UXhnSk52M0xSS010bmhONkN0Wmlz?=
 =?utf-8?B?S1V1Zlltd2xvZXYxZ2IxY2p6LytmOGMyN1FkSW9pVnVmcExUOHZtLzdzRnZF?=
 =?utf-8?B?eFlrLzFIVEV5OFhaVURSRjcxVHY5VXF4MHJGaDhwZHpOOFJXeU5nWE45Ymtu?=
 =?utf-8?B?MGNsamtRYk5mRlErSlFMREMxdWIzanlhK2VIMVBPMDBMZnFSTXhSL1VOQ1J1?=
 =?utf-8?B?c0MxQ0FEZDIxaEJNREpjUm1YM1RWYmIrUmtKdk1aRWlJQzhhSnU3NzhHRE5F?=
 =?utf-8?B?Z1EySkpEUHVhUWFWemhHSDI3alQ2Rmg2bk8wTThKMmFkZXdrLzNEY1pST2Fq?=
 =?utf-8?B?TDZiYk84eUJ3aGtvSHVxZVVYSHFzSlk2ck42Ynhia2lXa3ZEWURpVVZLUURz?=
 =?utf-8?B?aWovMU9xKzJ3YjB0T05VYzJrWFVGMS9qa3BEZnFSUmc2L25DTVRmSXFmam5l?=
 =?utf-8?B?UFhJM3gzZllZN0JXcGo3WW1iMEZ5Tmt1bm9qZ2N5eksxTlE5dmlrRE5UZ3JZ?=
 =?utf-8?B?MWR4NDlvU21XSkMyRTk4VDRZYUpPU3BCWmFhYi9uUmtwYjdteWZVR24vWW1D?=
 =?utf-8?B?aDAxdHVOMGtrS0tpME5MZm1ndTNnZWhxRkEzYjZ4NXZJS0F5YmowR0Y4YzBm?=
 =?utf-8?B?QUFTUUVEOXRlM0tjN0NBNEpHbExYNDJvVGRZZHd4S2JsbFllTll2dnc4QTJm?=
 =?utf-8?B?eE5uRVc4K0NnZmwrZG92K2hDR051VTZkWG04VEZSbEJFbW9JM2svMmN1Ymlw?=
 =?utf-8?B?bnZuZ2VwY2FuYmdJRXYwcXg0L3pTcnJSRFZBckkwb2tGZEs2N3prZXdGWStn?=
 =?utf-8?B?czY5VEpreWtTYUwyc216V0F1RVcxa3YxWnBud1dJZlZHem11UmdrSUpzRzh2?=
 =?utf-8?B?ZHlyek9hemlGQlBSeVIwRVZTajZrVHFGbnFXMEVEMi9UMUpGanFHb0JXNHVw?=
 =?utf-8?B?QmdQSmIzek55L3RySFl5Y1Jadll5WHJCTi9RTlA4RUtGd2RFWSt4Z3FyZDk3?=
 =?utf-8?B?NVVwdkRrNUI3OGV3eGU3bmxFN0ROYkg4NSt5Ym5wNTNScVB4ZStZUk9OdEtQ?=
 =?utf-8?B?SVNGaHV6WjQ3TWl6d2VNVXhGdHJjNU93eU1UTFRzNDBNV3pjQkpCdWIxdlhW?=
 =?utf-8?B?TnRySXJTbVhUczZnUUpISkpjMzhIMW5FNlJ6VStESlNNcXpWcWdxMEZ5YjRv?=
 =?utf-8?B?bDJIdFAwNUZ6ZjJrdnhhVk9XWW0zbW03RGFZOXpqNGpzVTFCNnY4azBrR3Zj?=
 =?utf-8?B?dUZPa2Y2czFMT0I3SDBJRlBxSUFuZWQrenF4aFhmRUZYL2VXVGJHYWR6OS9Y?=
 =?utf-8?B?VDNDNlpmS2VIOEI4Uk40dEJ0dENpWk1hcTcrNzFoMThTU2NKelJKa3ZSRzNQ?=
 =?utf-8?B?KzFYc1poNHBhMldONmtYSE03VVdicVYxLzB3RjZMRFE4UG4yVGdIVm1uU0h3?=
 =?utf-8?B?MVViY3VNZkFmWVFaMjlEcDUvbjB3U0FyM1VzSHlGVzQ3aHExRHRGeE9wejM0?=
 =?utf-8?B?ZFJ0NDZiT3Z3SUhhVFIxdytEZ2JkQk5YK1VxZ3pZbFFrcmlmWjRqc1ZaWU54?=
 =?utf-8?B?OFBZTzdTVlAzUDBxVzFvUUN0L2o5QnRIT3pJSFNwWklYdUhqZjM1L1YydDN6?=
 =?utf-8?Q?3J/ESvN1MhgHHfRF26jMSzt5L?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RxK/SVLbVACPITJkQqcyv+bVTnx9dbx45EqBdp1Bo1LHMUpPQ7u7uKIp+7Q/Bl09K50TOCUt/VopWJ5w+rwbj6VGo4AEWBciOvRSq4j+k0SAm1GxXiMKxBwJDCpGQJQLKS1VzOVvaY8ByH5fNQUyQ4C1GQXs25LBiqxm1+xiL5QHoIQmMLGP0GYohBB3E0dhhU/wVBH9SyymcT++/xlwc9fDbqQvLYBUpWdLs+wxA/JLQAfh0KVock63vfVLSM6UZU/PZukhAoFwK7b7+BcG6KmfQHJjk8xFLbVz4s+vGcyNVfB7oxFm3JrAUR+54UWfeFUEcZSJ34SycUd1BnCmB7QQQdLkbjR+u+45cxMjA0nDsZIaeJpyZ2jFsHGfg6xCYIRgq8HVfOCgn5VFX1aL97xu26utysAmj9nCp/8b9s2Dz6Yz7U913aQ3PoH+Y232ld8XUQ1y/ZcdqMRFEGShqwsGFf6ad41LswFpx1I27jcxKa2ice53MMn2PORbmqyPZEeUBz6VdErEAiC2eLUgJoRErC7lH/zW03xDDI6AKWfbgpr4+DW7TURMr9U1FhqEwRsMHNlVbez4Kh7XTxUZbOdOV95D8ZvqonSHTyOLuQM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0874284-6ce5-4ad4-ecd4-08ddb1fa447e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 02:04:20.8713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IOM+pLw4wizn3f68vw2/VoV9QPq4U3IGMorpf54H7+wOxv8gb4Q+Qr7K67CArj66wd2Fr127IOPY6FGtUNQtZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1731B5308
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_01,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506230011
X-Authority-Analysis: v=2.4 cv=IcWHWXqa c=1 sm=1 tr=0 ts=6858b628 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=yPCof4ZbAAAA:8 a=Byx-y9mGAAAA:8 a=KAL3vqp3-lEJoIAIEoMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:14714
X-Proofpoint-ORIG-GUID: poNSn_ZD1IF-4QIVHdxlX9PFllZqNJqu
X-Proofpoint-GUID: poNSn_ZD1IF-4QIVHdxlX9PFllZqNJqu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDAxMSBTYWx0ZWRfXy6SjmrTgwxXW ouGQ/a5rXihQsJhmTdX712EVO/m7WfYm6orKedWuF3UHoXpUFFzO8/6ZnctHcZB0XFOFHpeOdRm lCOaG7M57Yr7PtuulPU7OiC/jxtVsg8jjnk3DXBcjF/Z3OnQxqMY6KfmeP3xpeQphNOwDTIJ69B
 TYg/7Rk50s3Dlu5PFPFq64KDXyYgr8pPoQcksD1pTSQi10B4xwLwnO3moHylLiE13AVoVp6eWMR iSovlfMwdqbZ8xyWzL5mEKwXzZVFbz7XpXaDSvG1REiJ75ZZ+KWl+aPawK6/YrxEdnRhHSUksQ6 EP5xfwcog1/AG35aI34js2tvtrA9kV65r/2xH+pSjrxUW3+uAG3lW0+MX4LIr0PMFctimS5e7r+
 KRBtPYByMSkf2rK9QTEbo+LT5C25OkTe08iI637Bwo4gdHgcOUcW6OdXKKgaVjvKwzaiWlC7

On Sun, Jun 22, 2025 at 03:50:44PM -0700, Suren Baghdasaryan wrote:
> On Fri, Jun 20, 2025 at 3:03 AM David Wang <00107082@163.com> wrote:
> >
> > On Wed, Jun 18, 2025 at 02:25:37PM +0800, kernel test robot wrote:
> > >
> > > Hello,
> > >
> > > for this change, we reported
> > > "[linux-next:master] [lib/test_vmalloc.c]  7fc85b92db: Mem-Info"
> > > in
> > > https://urldefense.com/v3/__https://lore.kernel.org/all/202505071555.e757f1e0-lkp@intel.com/__;!!ACWV5N9M2RV99hQ!LY3bHD8lW73pDdoyiPE87NlpBt6nrJCqoSCm7mxOX2M5tOiT__0NF9Hs2Qm0otnk8D6kx9-OrbpZWVI$ 
> > >
> > > at that time, we made some tests with x86_64 config which runs well.
> > >
> > > now we noticed the commit is in mainline now.
> >
> > > the config still has expected diff with parent:
> > >
> > > --- /pkg/linux/x86_64-randconfig-161-20250614/gcc-12/7a73348e5d4715b5565a53f21c01ea7b54e46cbd/.config   2025-06-17 14:40:29.481052101 +0800
> > > +++ /pkg/linux/x86_64-randconfig-161-20250614/gcc-12/2d76e79315e403aab595d4c8830b7a46c19f0f3b/.config   2025-06-17 14:41:18.448543738 +0800
> > > @@ -7551,7 +7551,7 @@ CONFIG_TEST_IDA=m
> > >  CONFIG_TEST_MISC_MINOR=m
> > >  # CONFIG_TEST_LKM is not set
> > >  CONFIG_TEST_BITOPS=m
> > > -CONFIG_TEST_VMALLOC=m
> > > +CONFIG_TEST_VMALLOC=y
> > >  # CONFIG_TEST_BPF is not set
> > >  CONFIG_FIND_BIT_BENCHMARK=m
> > >  # CONFIG_TEST_FIRMWARE is not set
> > >
> > >
> > > then we noticed similar random issue with x86_64 randconfig this time.
> > >
> > > 7a73348e5d4715b5 2d76e79315e403aab595d4c8830
> > > ---------------- ---------------------------
> > >        fail:runs  %reproduction    fail:runs
> > >            |             |             |
> > >            :199         34%          67:200   dmesg.KASAN:null-ptr-deref_in_range[#-#]
> > >            :199         34%          67:200   dmesg.Kernel_panic-not_syncing:Fatal_exception
> > >            :199         34%          67:200   dmesg.Mem-Info
> > >            :199         34%          67:200   dmesg.Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]SMP_KASAN
> > >            :199         34%          67:200   dmesg.RIP:down_read_trylock
> > >
> > > we don't have enough knowledge to understand the relationship between code
> > > change and the random issues. just report what we obsverved in our tests FYI.
> > >
> >
> > I think this is caused by a race between vmalloc_test_init and alloc_tag_init.
> >
> > vmalloc_test actually depends on alloc_tag via alloc_tag_top_users, because when
> > memory allocation fails show_mem() would invoke alloc_tag_top_users.
> >
> > With following configuration:
> >
> > CONFIG_TEST_VMALLOC=y
> > CONFIG_MEM_ALLOC_PROFILING=y
> > CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT=y
> > CONFIG_MEM_ALLOC_PROFILING_DEBUG=y
> >
> > If vmalloc_test_init starts before alloc_tag_init, show_mem() would cause
> > a NULL deference because alloc_tag_cttype was not init yet.
> >
> > I add some debug to confirm this theory
> > diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> > index d48b80f3f007..9b8e7501010f 100644
> > --- a/lib/alloc_tag.c
> > +++ b/lib/alloc_tag.c
> > @@ -133,6 +133,8 @@ size_t alloc_tag_top_users(struct codetag_bytes *tags, size_t count, bool can_sl
> >         struct codetag *ct;
> >         struct codetag_bytes n;
> >         unsigned int i, nr = 0;
> > +       pr_info("memory profiling alloc top %d: %llx\n", mem_profiling_support, (long long)alloc_tag_cttype);
> > +       return 0;
> >
> >         if (can_sleep)
> >                 codetag_lock_module_list(alloc_tag_cttype, true);
> > @@ -831,6 +833,7 @@ static int __init alloc_tag_init(void)
> >                 shutdown_mem_profiling(true);
> >                 return PTR_ERR(alloc_tag_cttype);
> >         }
> > +       pr_info("memory profiling ready %d: %llx\n", mem_profiling_support, (long long)alloc_tag_cttype);
> >
> >         return 0;
> >  }
> >
> > When bootup the kernel, the log shows:
> >
> > $ sudo dmesg -T | grep profiling
> > [Fri Jun 20 17:29:35 2025] memory profiling alloc top 1: 0  <--- alloc_tag_cttype == NULL
> > [Fri Jun 20 17:30:24 2025] memory profiling ready 1: ffff9b1641aa06c0
> >
> >
> > vmalloc_test_init should happened after alloc_tag_init if CONFIG_TEST_VMALLOC=y,
> > or mem_show() should check whether alloc_tag is done initialized when calling
> > alloc_tag_top_users
> 
> Thanks for reporting!
> So, IIUC https://lore.kernel.org/all/20250620195305.1115151-1-harry.yoo@oracle.com/
> will address this issue as well. Is that correct?

Yes, I verified that it addresses this issue.

> >
> > David
> >

-- 
Cheers,
Harry / Hyeonggon
