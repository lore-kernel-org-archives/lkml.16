Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1E4126C05
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 00:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.149.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751677201; cv=fail; b=WMmeVBUY0SKQpFV1fbwQjqElLYwFVS/JNjhJm1PY1zgwxuvj0am1pa2bRUJcWkOMlRoMkxvJVYEWR7ZDdGIVWRwtU0YTyTaSsTCOcWTegMoIqm/C+EkTXqgryUhG1stfPgSKVwurWWZ0NKKvf8QAcvTMVH0CH5i7bCU0HDCs/hQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751677201; c=relaxed/simple;
	bh=xDmgnxgLe552/pXdBR5wzGnhDNTGOfQ+r77evFPNCWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fZpF0xSEWKSUTOSnariIftqR82iQFPVM2Ej0P+0P23GsWU12VyARGguNS9nuuePcXHfUZddF3358uVz1zSAIXW7SC229QlNA6n54WPffWPK3WfyK5vnEuhtSUdvDXejZck5yzfy0RetxDnlY6ltPY8gzvAmgTwPYxPNYV/skBfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=silabs.com; spf=pass smtp.mailfrom=silabs.com; dkim=pass (2048-bit key) header.d=silabs.com header.i=@silabs.com header.b=gI0oLc9o; dkim=pass (1024-bit key) header.d=silabs.com header.i=@silabs.com header.b=VPjoFap6; arc=fail smtp.client-ip=148.163.149.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=silabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=silabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=silabs.com header.i=@silabs.com header.b="gI0oLc9o";
	dkim=pass (1024-bit key) header.d=silabs.com header.i=@silabs.com header.b="VPjoFap6"
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564No2mI017370;
	Fri, 4 Jul 2025 19:40:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=/suzptPQQhpdB33961Lc8ADWizMVaJZi9ivZd/di7AM=; b=gI0oLc9o10yk
	sQKfJ0SXQLzqmxuUOtYQXVxi5E3aXTEx3hQbtXztlpXqcdD5f4PCqZevk5FSniCp
	nU0D3MmQqkkgrm5o5R9ByXKKFGj73XCuodfNIqPALoEQiQ7jtGqfy88i/r8oPD2i
	fscItuDKGb531oUoacqMPyg25HfPS5y8tJ8i3JSzFZTHITYJnJyL0guC6XQk5Itd
	ARqKifZLJd9daFhoPH0bh2vd+Rs0lHnTIzgYinLklQXIlOgKc6W8MaLzIiOKiBzJ
	A5fP1Rd+R53jQyRx0wxFnnW5NXj2F0C+u/ECR5A4kFMSWv4H0jiuzT6/oi7pTFfD
	lz5SJAFMvA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2109.outbound.protection.outlook.com [40.107.244.109])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 47p8pvhb7y-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 19:40:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eWbgRjHjuZNkDWU9ZlsdbsvgZrEdKvTAxETBh/RTwldD7roeneT04FIBJgRVQ6tpk+WU13dTNt+v7Jxb1CcMAcqSHAFGknXxGcpiiSiNJ5YFznHE9k7jgognhEWS0UKn5rCcCOoexyz/yuVrEf9jwOl0U7A4YEZ55MdZzgZk3EyrDdoi8moymKsX9i5zFbkwuLNY3IUlpZltNjzxbYOHhbTYlcbyDNT5DD4v7Zbrfkph+0GaEhp6VwKsTyh9RRAHRbP6idLKDjszlndU56c0Z0orVuOV6NOjzIy6Jfv1VOmD1MP3njLZzWfSogjIFLHbt2eEEBBvolctMwdqYCm0aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/suzptPQQhpdB33961Lc8ADWizMVaJZi9ivZd/di7AM=;
 b=QUHg0/n17wCIJnO0ASWtqxztDLM41txFitmglvvjRU/Vbx8aU4CtbkiBH3e7afC1zLN1ZEa65ai0R/vvD6hOojq6iI1oBI/Av4WPAjD8a2LSGqbegqjPLHKaIWPg1iyiE4dUQCPAWgcziyNND56X/YxOp5UqWzzXZhehDRFUKVdRaUw5iXnRLmVfJuKHi/X+UsD7ppAeQd9/zIILy6ya/2M/rtZUCNZjezGQ41qU/g59yiFZziRJNHUka1Xu3TcPg5t8TZSt/0KghxM3IPv4NqzVmQNdiLScC33LDwwnQl1l0gx3cKdgkO4QsINo2cNLX19R8LyC+E3ilPhjKqBA1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/suzptPQQhpdB33961Lc8ADWizMVaJZi9ivZd/di7AM=;
 b=VPjoFap6eEnsjVyEL8P0b+KmWl8bogB+17AZEedLCFdgc/vy2tRmIQ1WB9Bx9UBqaNegDLXwzTNw3mRV3JFuOOJt8C5fz54qWxyjIALgGuSW37IuRxcUQIZy+7yHNoeyXv0NBIbMVUy1DlQlbw0NDdcDWTCeNSF0OZrtXD0oB5M=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SA2PR11MB5068.namprd11.prod.outlook.com (2603:10b6:806:116::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Sat, 5 Jul
 2025 00:40:54 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a%4]) with mapi id 15.20.8880.034; Sat, 5 Jul 2025
 00:40:53 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org
Cc: linux-kernel@vger.kernel.org, linux-devel@silabs.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
        =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
Subject: [RFC 5/6] greybus: match device with bundle ID
Date: Fri,  4 Jul 2025 20:40:35 -0400
Message-ID: <20250705004036.3828-6-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250705004036.3828-1-damien.riegel@silabs.com>
References: <20250705004036.3828-1-damien.riegel@silabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::26) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SA2PR11MB5068:EE_
X-MS-Office365-Filtering-Correlation-Id: e38fca8d-0152-4650-2f9b-08ddbb5c992a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OUhNTVFxZUYyeUJRV1RVcU93VENBaU5xcVlnalZEQjIxb3NjdUZTTlVCNGI3?=
 =?utf-8?B?ekx5anFHTmJ1UTkyb3hLeGpUZ2Q0dWlHN29maE1DRHFrU0NLeG5WZFdrQ0VF?=
 =?utf-8?B?ZXJTRGRXMUkxWndnUVBIUlVLU2l3SEozZlBPend4VHRGZ3RGbFNSbU8zUlJR?=
 =?utf-8?B?UTdINGJ3azYwanF0bEhFejA3aXpJdEtVZkpDWkhxcCtXQjQ3NXZQRERrR0Jt?=
 =?utf-8?B?YWZIVHBIcmxMbFAxZk9IRUpzU1REckRzZ2VsMWl1SVI3K0hVWnNqSk1oV1ZM?=
 =?utf-8?B?ckhHNmhTTmd6ejVYdUZ0Y0hrbVl6VlR5VGtYMkk5WnZBY3RoUjdGQTU2bHZY?=
 =?utf-8?B?WjZrQkN1UG5PMCtyTzgvRyt4c2Naa0c4RFFnZEk5T2Iyc0R6bmZoMEltSzN5?=
 =?utf-8?B?a3dJS09wai9rNzhETHNTWnRFSXB1TW9Yd1pKZDRwWHBYcHBnZG1CTVM3R1dE?=
 =?utf-8?B?ZW9OZDgrSnYxS0xJMS8zUDdQTS9UVkFXNkZsZTYxUFdlWnRxTExKMjUwQlRK?=
 =?utf-8?B?SGdmUjhFYXphU3ZvbjQ1T1hDV0ZHT2V6b2JtTFBXQU1OM0JmeTRYdmNFdEF1?=
 =?utf-8?B?cUZtM1oxT3J5Q0FtamVieTlPd1BTU1g5NDBYNjk5a1dmSDJFbndseEVMNlNm?=
 =?utf-8?B?VjBoc2V0djFvejdValZMdC90eGNyeGtzTzZpTEhxbUdNVi9mZ1NEaHJyRzNG?=
 =?utf-8?B?d3lsRXNzWmNENnNVUkF6YXUzcG5NOHJGVU9Lc3czdXp5ZGVKSk9yWEhMS3NV?=
 =?utf-8?B?ekNWOWxFdkdKZW1veEZpdkkyTEtpeTcxWnNDVGVaeXM1eFN0cmdmY1pQTUIz?=
 =?utf-8?B?bFFXZ1dNSDJBRzZFMVh0WXIyS2lnTEpJRnlYNkt4OWRqVXVZTGkzTHFrT1ls?=
 =?utf-8?B?dmtzNkNQSUdNRDBiUXZ5eHdlYU52b3E3WUk3QXE1bjErU0JXenA3bTZvLzhr?=
 =?utf-8?B?N3ZteUpBUkcxdHMrVUN2aTcxWFordnovbU9kMjFrUDNmSE96T0tVRUcvOWU2?=
 =?utf-8?B?QVVlam9DUERxT29pbnZMQmpWeTBQK0Q0K3RFQzVacHozcnJPOVZCT25VeUtq?=
 =?utf-8?B?SzUxeFU3MWpaaEx1Unk4N2hmbDdUa3RMOStDbm1kSTZSRzVBSVFoOHJpT0ZE?=
 =?utf-8?B?alBVemJlUytpVlllaEloZGVoQUtJcTNYVUZCTjFramZENWRPTWloZzlqTlFV?=
 =?utf-8?B?dE1TRmFtVzJlWnpCU28zTHdoRmZKMVc2cW1pbytOZFBDRU1UU0pSNGkrRHEz?=
 =?utf-8?B?Qi9pVkdMVEZSSDdlUVhWYitSc0JTQTQ4aGNtQkxFUTJPbWQyNTNhZVVzT29C?=
 =?utf-8?B?Zm5Oayt2aU8vVFYrQ29seHZGRU03MDl5eXlhNVZJc2QrcDJXd0ttcklNZE12?=
 =?utf-8?B?VUZZaDJ0eG9HSGFxYWE0bjRBWmJKdHBXVXBmdXBHVENBK0tvc0pZWHNjbXdj?=
 =?utf-8?B?U2RBYXBCUFZDVTBsT3ptQXJ0dWVGOEdSZ1o3TVpnYnNwdzdRR1AvT2VOeGJt?=
 =?utf-8?B?VmtESFR6WDF1ckMrUlYwUHVGNFQyMUYwQWxNQ3JZSldQNjVyQnUrL0trZ2xX?=
 =?utf-8?B?VDJ2dE8ybEpnK29aNTI5NUFKWDAzaldwbWZ2VmVERHFJMWhZYTZ3TS95Ymln?=
 =?utf-8?B?Z1o5bEdEY0FFcnM3bGUyREFoS2RrNkNzSndYdXMzSjVqd0JuR3hCQ3laSjc2?=
 =?utf-8?B?c2tNbGpHeTBnWkpidTFENkt0Z05VTmRzeGdTVDhBUzRmcE1wUE1aSnZiVE81?=
 =?utf-8?B?WWFtQ0Q4NFV6a3R5T0RmUTRXVm5ZbEplREk4WjhTc3cyRElkTTFma05jUmx6?=
 =?utf-8?B?aTV3dEorUloxRkhEcWp2MTVwN0RWMC9FSFlNYnNKUG9xc2tmWC9hTnQ2ZFk1?=
 =?utf-8?B?b0ZnUnZiUkc5cTlwTmRZanpKQWcvTmdTd1JoNWRWMVh3eVg1RHlXUkRUYWpw?=
 =?utf-8?B?SDl2azVTRmt3d2NHQkE5RGdMcmczN3Jxbk93SzlWK3lWTnhjVHNSaUc4QVFM?=
 =?utf-8?B?aVZML2Y5dWlnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVhEZGN0WnFRSUJ4Y3J5STR4bjA3Znc1NTdzTkFlTHZrRDhOVzdjbzl5L2px?=
 =?utf-8?B?NjhXQmtza1FWMUJTcVdoMkt4VGsxVXlvVHcvblNrbUVMNUpsanU2OHBEZFN1?=
 =?utf-8?B?azlyLzNOUFIyQWhSVzJaTEIvNUJNZC9JQlUxYVMvcnNueHRZdXhrQytUZUJ3?=
 =?utf-8?B?WGJILzZBekNjQ0c4K3RldXBnRVBUdW1rajU3NDFoR1pwZTgxWm5OS2s3WFJu?=
 =?utf-8?B?KzZ5dWRSczJSNnp3U0pTS3VMRmNUbFo3L1RPSUY5R2s5cFp1K1BmN2ZScnV4?=
 =?utf-8?B?THJYTDdxNEV2V21XMFZqOTdubVJvdHdRUks2TElZNC82d1lkZllmak1CZks5?=
 =?utf-8?B?N21FR1RMWnNWc0VBdmhVN1lIQ1gwQnpMNnJiY3kyMXpDd0tUNi8xR1JBZ25w?=
 =?utf-8?B?Tm50STBNMDYzMExHdldJL1pQTzdPTVJIeHRMcnpHR2lEZmxvS2duWjF4eVVq?=
 =?utf-8?B?emNtdk1kNkpabzdHa0RRU2oxVmtCenkyK0JlVFJRWEE1K09ZS1RwU1NabDNx?=
 =?utf-8?B?Vy9zd0FGelI5VkJsREprUjRLMGsxZGxaRktuOUswZ2w2d05WbHpKS0ZNUjBV?=
 =?utf-8?B?MGRPYW9uYkhWMzFXNmk1US9nQkxVc1VsSS8vckdGUVRiMk5BdkJ3Uk1rTnRS?=
 =?utf-8?B?cmNDWkI4RFZvSEhVQUlQRS9KdFh4TC9XbllleWkrUjBZY1BCWEcvSDBwWFRN?=
 =?utf-8?B?UVlQSllPMTFjTUhzWnk3RTUvRUdGY21aV3gxNU5lY2ozMVZ4R0U3K1ZHY3NP?=
 =?utf-8?B?S2NmM3pZOVJJa0hONnhabVI0dk16VmFPYnd5OEpuQ3FtdEk5Mjc5VTNPYkg1?=
 =?utf-8?B?UmpmUXRNVFhwb2NBTmhFRHNwTlJNV2dROUZpVEx0a1lYNnBlRDJjbDFHYml2?=
 =?utf-8?B?VWN6WDM4dytxWGhXWjdwUENMZ3hqYTdnQUMwU3VSblBLS2VFaXJTc3Y3dVUv?=
 =?utf-8?B?TThqN1FKSFNmUEJXaE9vWkN1aERjU0hXeVNRZHVmZ1R0RGlkR0o3RmtPVHQv?=
 =?utf-8?B?VklETlprb3RZU1JIV29lWmhMN1RBUmp5dkJhR3ZYNEl1VEorVTJqbkk4RGNr?=
 =?utf-8?B?MGpvRlV0QWJSSGo5NTh4U2YyRWRYWUFFbm55T0hhOEhCYmJhc0pjUHgyNzJj?=
 =?utf-8?B?SWtrU2JxNUhTalZ3S25MMmFUUmtzaXhoQS9TNVpxZ1k0SVl5SlNVY0czSEY4?=
 =?utf-8?B?andmUWdrRGFCZ094UGp3eFZPQ3ZCVUlRZzB5cllCNkRPdjVMMmMwOVNHVlpr?=
 =?utf-8?B?Wko3TTcyRDk4czVnMTlFMFRyQ21CaEVkTXhGb2lRanViZFdGQTBRY1FQWDRL?=
 =?utf-8?B?MFB0ZFVudDF3Wm5vVkFSa0ZnSDE1S1NRZGFVQlFGMEk2R3Fzb1dBbzFtWWVo?=
 =?utf-8?B?YmMvWXRnU3I3ZGR6ZG4rSmlvNUZ6SVBtMDVsN0pEN085YWlFQ2NaOHp0RDVs?=
 =?utf-8?B?UDNmMnJleHR1WDc2eDU4eWVYUTdwWkhuYUgvK3ZxS3F5bXh1S0xDNGNiRC9U?=
 =?utf-8?B?WnpzaVRxblR6NlpoNXFsY0kwVTRRUDRlOS9IakF4bXhYK213SVMwZVpYdVk1?=
 =?utf-8?B?b2hocVJLLzVCdkF3ajlZUHFTQThqSDZka2xTbFFscjhpQUI2eHpHYTJ4dXVo?=
 =?utf-8?B?ZU1TZWJYYU5ZT1ozajIzUlY4U2VWV1BzY2JST25PWFNJRG93a2t1L0dNTHVt?=
 =?utf-8?B?dGpvcG8yTkYzaHBSaDgxT1FJWGJwM29zQThRT2kvUW1Pby8rNWprSUk0SzRB?=
 =?utf-8?B?bTNUWHRiQ1BDeHNsMFFKUyt5TjU4Szk4R2hHcEJBYmlNbTZ6UnFTYVlTVDFR?=
 =?utf-8?B?TlVMamYzT2pVSDBERzdQUVZ0cmROYlVxM1BPclFiREd1N21QK2IyNFZFRzBV?=
 =?utf-8?B?NXE5M0lzZ3QyclZsWUFDSDVUa0F6Q3hEUzMzVVZWbVBDN3R0Q1VZTVJGRnp0?=
 =?utf-8?B?QzczQmd2bW1pS2NxUFM5OHAwWFdvTlo2dC9YL0h5TW83emUxN25TTkFoYzVF?=
 =?utf-8?B?b3JwQ1ViaE9GaHVHUTBsSFpadC9KT2Z3anMwSnNDMTA0MWovRzJqU3c0SG9v?=
 =?utf-8?B?aEk5QjJjTS9uZ0NXNU5ZY1VwNW1pdUY3Z1liblRQeC9mcHZRb2tWa1Y4OHhN?=
 =?utf-8?Q?rBVxtZBffBSTP+8/u7q7oimgZ?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e38fca8d-0152-4650-2f9b-08ddbb5c992a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2025 00:40:53.8911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kVLNQulh0FyoI+PHN9StiB73+e4vGEtdo1G/0glIFtz8P8RrkzAJFTm+92yobBG+6R12Zzz+Y7MewQ82UM+Wbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5068
X-Authority-Analysis: v=2.4 cv=L4EdQ/T8 c=1 sm=1 tr=0 ts=68687498 cx=c_pps a=U259+el5m5zn0mdk/7qTUw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=M51BFTxLslgA:10 a=i1IsUcr2s-wA:10 a=2AEO0YjSAAAA:8 a=QR_wBcAtP5jTkrNFJ_gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ppPbQp_q168DV6yismbYyiArQIWc2mkg
X-Proofpoint-ORIG-GUID: ppPbQp_q168DV6yismbYyiArQIWc2mkg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAwMSBTYWx0ZWRfX1/DCVKF7r0ve u/kzg1DnJyWwlh8/OsGgjQiBG8dYp8J7NHJ5v9MqT3nMZAqv0A0KTptoqLk3KrehzNKo2blFgZZ aCO9524iy1IFJNQk7MN2cN0YWK0hxAXPaWTZsiRMo03FXOU+a4VpcDFBdL+RXTNwAmdi8Ii2mJ2
 wSg3IqnL010OiZFy2OLdl44OLKThqdF5DkdJucTzvzNGIDQsUplX0ERNCNMmjkGOpUjAja2IoBv S+pqfBhPDO+EH6uAE1lssA+mkD6+KviLoLUj5vF/8PjGvh9ne6tdHYPgai/1k92yjlHGYPZqte2 kxGURIBSVpq4DIjzfqRV9xPC2htBwFrrfv5vCPAfuoWEUVDUiK66UZYBAZe1VfnY/uzWJ/cBhUt
 gTTKAY0LoC6kV3kPFBxTwyyHWYeKt9RyEdwb31jHLAyKr5487VuIaSpqgsKb5n1rQT15CM/j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 mlxscore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507050001

When matching a device, only the vendor ID and product ID are used. As
all bundles in an interface share the same VID and PID, there is no way
to differentiate between two bundles, and they are forced to use the
same driver.

To allow using several vendor bundles in the same device, include the
bundle ID when matching. The assumption here is that bundle IDs are
stable across the lifespan of a product and never change.

The goal of this change is to open the discussion. Greybus standardizes
a bunch of protocols like GPIO, SPI, etc. but also has provisioning for
vendor bundle and protocol. There is only one ID reserved for vendor,
0xFF, so the question is did Greybus ever envision supporting several
vendor bundles, or one vendor bundle with several vendor cports in it?
Or the assumption always was that there could be at most only vendor
cport?

Signed-off-by: Damien Riégel <damien.riegel@silabs.com>
---
 drivers/greybus/core.c             | 4 ++++
 include/linux/greybus.h            | 7 ++++---
 include/linux/greybus/greybus_id.h | 2 ++
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/greybus/core.c b/drivers/greybus/core.c
index 313eb65cf70..a4968a24a08 100644
--- a/drivers/greybus/core.c
+++ b/drivers/greybus/core.c
@@ -68,6 +68,10 @@ static bool greybus_match_one_id(struct gb_bundle *bundle,
 	    (id->product != bundle->intf->product_id))
 		return false;
 
+	if ((id->match_flags & GREYBUS_ID_MATCH_BUNDLE_ID) &&
+	    (id->bundle_id != bundle->id))
+		return false;
+
 	if ((id->match_flags & GREYBUS_ID_MATCH_CLASS) &&
 	    (id->class != bundle->class))
 		return false;
diff --git a/include/linux/greybus.h b/include/linux/greybus.h
index 4d58e27ceaf..9c29a1099a4 100644
--- a/include/linux/greybus.h
+++ b/include/linux/greybus.h
@@ -38,12 +38,13 @@
 #define GREYBUS_VERSION_MINOR	0x01
 
 #define GREYBUS_ID_MATCH_DEVICE \
-	(GREYBUS_ID_MATCH_VENDOR | GREYBUS_ID_MATCH_PRODUCT)
+	(GREYBUS_ID_MATCH_VENDOR | GREYBUS_ID_MATCH_PRODUCT | GREYBUS_ID_MATCH_BUNDLE_ID)
 
-#define GREYBUS_DEVICE(v, p)					\
+#define GREYBUS_DEVICE(v, p, id)				\
 	.match_flags	= GREYBUS_ID_MATCH_DEVICE,		\
 	.vendor		= (v),					\
-	.product	= (p),
+	.product	= (p),					\
+	.bundle_id	= (id),
 
 #define GREYBUS_DEVICE_CLASS(c)					\
 	.match_flags	= GREYBUS_ID_MATCH_CLASS,		\
diff --git a/include/linux/greybus/greybus_id.h b/include/linux/greybus/greybus_id.h
index f4c8440093e..3e0728e1f44 100644
--- a/include/linux/greybus/greybus_id.h
+++ b/include/linux/greybus/greybus_id.h
@@ -15,6 +15,7 @@ struct greybus_bundle_id {
 	__u32	vendor;
 	__u32	product;
 	__u8	class;
+	__u8	bundle_id;
 
 	kernel_ulong_t	driver_info __aligned(sizeof(kernel_ulong_t));
 };
@@ -23,5 +24,6 @@ struct greybus_bundle_id {
 #define GREYBUS_ID_MATCH_VENDOR		BIT(0)
 #define GREYBUS_ID_MATCH_PRODUCT	BIT(1)
 #define GREYBUS_ID_MATCH_CLASS		BIT(2)
+#define GREYBUS_ID_MATCH_BUNDLE_ID	BIT(3)
 
 #endif /* __LINUX_GREYBUS_ID_H */
-- 
2.49.0

