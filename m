Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD01521D3F5
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 19:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751658026; cv=fail; b=FqUnwvaTB7RoLwoRjPY0JWPzV/7RLKZIlptMAo0aHLfCJ0m0IX6iXqGVIySnAT/0qxPzzaRwt9NqswslfaRSLR6JmN4gzY5DMzzuLEK+qNI9lD8pqcgYQSIEEv82zcyiDix26lz+r4W2QjKYBDbRZe4kzmyGQsFJcI8Nyyj2aGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751658026; c=relaxed/simple;
	bh=V8z2YU7tflHTT43YMeR28EIv3DWeOJEOSgJbwxtrgB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WDBqc9Jx8qOv1AvLvknKsOgMIDFq5NnpsLx2aMZfEBM0+bdOCiglv/YV+PJ96mtESGk9SDwS/3j2AdTcBcwUGH99HZtiwqZNGaFpDIo7Dgs/CBJoY7VHlkmIIqPcxq/Yp054y1i1ZGtYZydmb9PMdrc7/4ywYYLF+gya/2nq2C0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PKoaf80I; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=i2FqkPBy; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PKoaf80I";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="i2FqkPBy"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564HYtsc031544;
	Fri, 4 Jul 2025 19:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Zy4z0OlNEpGYIJLSL+
	3zETHC6QfqhsDtOFF7nfUyZOw=; b=PKoaf80IbCg15fq9H4KQlkIfVvhJ+xGX8O
	rTzXEo1dELTmQoF/g8POSKYGKtOhrhOj6quhMSF4kFBf2Nh5LKTxOuYwdtsLESla
	SM6CUWFq1jJ/BAwWXqNHLGRNebEM70BGKiOrQi2H4acCZ10+0bxDs37dDSwh9xrD
	lHaOnsw5Eh3fERtvc3mEWAzBI2qp4V3/oapkt215dGkIW/s6nEIOoijUPWsN37rw
	Hb4K+sX27cRE6nGRPTkSCUhqbvdR3b3YGp1HMMCUsnetGnMZwlqfvMVa42+7BSID
	J2iE8dsA9MLoF4qq6kdizNUPStn/XGBC0wbC0peyuJ8eDcYRYwTg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j6tfk2u3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 04 Jul 2025 19:39:50 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 564G7KJw018857;
	Fri, 4 Jul 2025 19:39:49 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010008.outbound.protection.outlook.com [52.101.85.8])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ue29ut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 04 Jul 2025 19:39:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=feZmA5ymxojfdN+npAlk5lt1PpxxanTWm5nScFwPe/zk9GDgCfqTAe4Terki2o7rK2tk6L1klICU2QgN79PoHjHFiD7MQYGBg6uMxudrSK23X1phb2DQI6KX+A51eZyuyibQAWGBRZ2yhQ0dSKicNCOZrLQqAii+2t8OD1KroRLaX4x99n/BsZKuxoyxBh8EoV2GtBWM0bD2fwfZV5p4gpqb6vLM/xv8kZZ+WL0XEBOq6MddZ6A0dQ3OKnSdPIBDZl57xI7CGJ1ueCBtvHkSsRZtJ8XWGiHHNlPAfnxU0bYPAjSzVaiQuuXnZAvsrkdnY02/3YqP7SyJ2kz/2RRSbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zy4z0OlNEpGYIJLSL+3zETHC6QfqhsDtOFF7nfUyZOw=;
 b=lLe8Ny9gzOBizcqlbDMEiiGroff+i4p+4omxz60cbHkqFPU9yNmbs7jzWNoVMoSUa3j33vqP84G1w0oU/CUpomtUz4feFn5IUIeXguZPSUBXGf1nHxI/EyRV/8FcoF9KEg+nhqZbPli9E/kr1zAVSwSaQCV4uZkLnjW+G70EaBjIM01sDZfjuCv0fWoNKn/Y4ob6Ysn59tcCBXDhu/d5f8iGBMjTinz2/kuu1m/YGxN5lRW3FIty/cvr23Iyf217LdTmSdvPfSjxp1H4LVfazjlXNIAfU+5pPd1BGg6uiCastE/aTsUtvo7RTZH6Jaq05YDaBEH5VtPyeq41/FG/Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zy4z0OlNEpGYIJLSL+3zETHC6QfqhsDtOFF7nfUyZOw=;
 b=i2FqkPByckXuu/yg3tvQ3q6BITcFr41YX65QGZnaTIiGM3d1d/j0BXe+1XQrmEoNRSKj0QRkEhUKTosnGoDx8AwXNEfYLxwMwgPSlpLp+34V6mf2SlPnFlQNL6vSfTTiWSeuPsbPYcQG0Rq214C5YGRCoXcxp97Ta7SLmAwTg+c=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by DS7PR10MB5055.namprd10.prod.outlook.com (2603:10b6:5:3a9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 19:39:46 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8880.015; Fri, 4 Jul 2025
 19:39:46 +0000
Date: Fri, 4 Jul 2025 15:39:32 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Peter Xu <peterx@redhat.com>
Cc: David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
        Nikita Kalyazin <kalyazin@amazon.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
        Muchun Song <muchun.song@linux.dev>, Hugh Dickins <hughd@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        James Houghton <jthoughton@google.com>, Michal Hocko <mhocko@suse.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Ujwal Kundur <ujwal.kundur@gmail.com>
Subject: Re: [PATCH v2 1/4] mm: Introduce vm_uffd_ops API
Message-ID: <e7vr62s73dftijeveyg6lfgivctijz4qcar3teswjbuv6gog3k@4sbpuj35nbbh>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>, 
	Muchun Song <muchun.song@linux.dev>, Hugh Dickins <hughd@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, James Houghton <jthoughton@google.com>, 
	Michal Hocko <mhocko@suse.com>, Andrea Arcangeli <aarcange@redhat.com>, 
	Oscar Salvador <osalvador@suse.de>, Axel Rasmussen <axelrasmussen@google.com>, 
	Ujwal Kundur <ujwal.kundur@gmail.com>
References: <20250627154655.2085903-2-peterx@redhat.com>
 <aaaca9d4-b8df-45b8-a3a4-a431c99f26c7@lucifer.local>
 <CAJuCfpHN6vpDx+UNPEzJgZ_qD9USTJZ_+yZzQg2BpF_aRpufYw@mail.gmail.com>
 <982f4f94-f0bf-45dd-9003-081b76e57027@lucifer.local>
 <cda7c46b-c474-48f4-b703-e2f988470f3b@amazon.com>
 <aGVu1Isy-R9RszxW@kernel.org>
 <aGWMsfbayEco0j4R@x1.local>
 <aGbCbW7hUf3a2do2@kernel.org>
 <289eede1-d47d-49a2-b9b6-ff8050d84893@redhat.com>
 <aGfsaIIzHWfjcNFd@x1.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGfsaIIzHWfjcNFd@x1.local>
User-Agent: NeoMutt/20250510
X-ClientProxiedBy: YT3PR01CA0107.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::20) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|DS7PR10MB5055:EE_
X-MS-Office365-Filtering-Correlation-Id: b1c56313-129f-4ec5-5abd-08ddbb328822
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sP+qsePI/+PxPsqqNthyfv7A2dFBFRLfsfzi9gwYrWpZbihxgrKbyxNwH1RO?=
 =?us-ascii?Q?8zb/B1rioY8rY06sk7aDYw+E4+l5WFnGT8GLIy5908gddH/g7htBqbpOWhSq?=
 =?us-ascii?Q?9RmGPiTnhS/KVu4gFjpp6J0JIn1KgD5idDRt9QPPUR+rlfx3gsFpvOCsUyUh?=
 =?us-ascii?Q?Y47d7OBGnExayaHON1jKPyGtXy3W7EXFVytgipZXAwPgsGYMhMb9b57GYaan?=
 =?us-ascii?Q?y3xx6F1AGc6LmSFlLmUR5Z1vivR4aRWM5SYgJnVcQUmb/8XsWiLTjawRNVI2?=
 =?us-ascii?Q?joilIfIZxDQu7mXwgWLum3rjh2RyfLSL5s6yWbHAptucVPDjCairU9xVK4aR?=
 =?us-ascii?Q?gZ1yj85gxS9h0u3AmsNdl+PwM51quosjvp7KSPQyrSvvBh9oDlJiEnpowKH5?=
 =?us-ascii?Q?hX0ykhAd4GiVQEX7lsapeZ5MQz0nP0NcYBnyc7W4mHNFBfB4F9bSoJ2CMZKU?=
 =?us-ascii?Q?CUXKWg/nFpOuxeZPGS39Ss/NV0fivireM4K9KCczECsvP6t528Au+P2nPyDC?=
 =?us-ascii?Q?uPi6RK5sM3JWxgMdFGr1xU93nCNjBzyoAMwHmMP0RKbd6xk4flGY7FGj75Zm?=
 =?us-ascii?Q?zugWl0p2tkA9GU/QxkQhb1Lxm90RbWWFrJR+q6ApSEeGaqymM+XdKJmhIL9D?=
 =?us-ascii?Q?LLzNrHWoB7WjMzd/+AxLJ4DW+UOjs0lLX7mHl9fO+raJBp4cEOE8Jjkcdbuy?=
 =?us-ascii?Q?AgxNt4GRW3I40+imsY9D/xiCC6OBFR9WfIZ4rGyZtG3IDWxusJKxg/zROPL3?=
 =?us-ascii?Q?+WSvnQ22UXQB9e9hJaJfwPcxSWFCHvdmij9Ylujy7JK20Y2kJuONqMWyNK8e?=
 =?us-ascii?Q?07TDdhz0w9vnvRn9J1NbyRpGHrwrcLspQBLrnadyRAJZQwERtV7WPC2RuYgk?=
 =?us-ascii?Q?nLV3l6mDyHYYagyCpNbFnw55Knwj3N2+D3gsyPf7FxGKtTklt18QWytWIt7C?=
 =?us-ascii?Q?AHOtAHJSFr1KJ5UqcglfOmbg6B2Hy/KDz3kSzST82H3KogZsTLSqtECGg4fN?=
 =?us-ascii?Q?E/iVWB5SJPfz6xEwTYkwg1TwqhK+gAP7U8PMunflMOLRmszHfX5qvKIpLi50?=
 =?us-ascii?Q?n4mJnSFQadFlatiNz6oXlbk5lrqcEgS0i6AeMcM5gxANkkS+AkQGcwN3AI/e?=
 =?us-ascii?Q?Tupg29n44qydbV5mf9kv41874DQBtb5grkZe5I2ZqXDfoGFL7S8gRCsv/4dq?=
 =?us-ascii?Q?kI8MbAd8psdA86dLdqtchfV2iVrz2DQUymN4kaHpVMbVlWhUBX6lJrJWwiWq?=
 =?us-ascii?Q?d6yejFKUvxu7WxBcPTB74ea4UU7lIq5HxcGUAJTecaffLlT54gK7UiOf1T6Z?=
 =?us-ascii?Q?IzUGCPlIwcPNtLMz1iUyf2saCJEzET0iHx8JTEtCuqXCZMrA1L3nbM++zpl2?=
 =?us-ascii?Q?LCKmAYQsBoCQOJh/6iFr9iBgi1DgZ+CLnOgfcZoJ9wSunRzMmdmTd0olFbZO?=
 =?us-ascii?Q?QT+v/T3l7fc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FtnrgXD+gmLL6CSr+nc2U5RB2NTUz9wLTSZqwzDdg07rqhkdBrq/dm276goz?=
 =?us-ascii?Q?H4sYf8lQc4GUoPQxqSM5QBHDLaMHqHLvd00i084zpuCtYwM6JjN3Kchl3h4I?=
 =?us-ascii?Q?hhtWfqi4UP7/jts/Zd7kagVF3dqhdIVZ+pr5tzM7Jc/HEPKchgoBkA/WSzIr?=
 =?us-ascii?Q?NBlqRmWkI5zLWyFjmAVizK/C3ZwJAjvjD/sZ5k2hSn8vbvm+wtCR+hVQ4t5f?=
 =?us-ascii?Q?QfKY9W8rzZWyC36Zz8sZTtB53tm6L9fxRN5/O0Ln5M1S45gyEfcz2WsJIU/M?=
 =?us-ascii?Q?SPA1/CW12nU2Uw3NlWA9SagJf2bQkIW0sj01joEb5phFQHP/URuoixtmE5Sd?=
 =?us-ascii?Q?Qr9tkj7eFeaVFhS5HNSxjQ7oAXt8fjdSencta+uDdEBTr3Zs6xLKYYikOai4?=
 =?us-ascii?Q?z9lhk0WT2mUBizlxjatEuDna5OgTx3SPuwUdVgXP2Z5qXsvtDQo8kaz0cjbP?=
 =?us-ascii?Q?w7vDuWNVXWTjsIi8QjrdBEy3Cc1+4EUtWSU5ThoOmkhkWaip3FQEzIq5EyNK?=
 =?us-ascii?Q?PxnmCl9/N94sJCnMf6tlmvNSqT5W4GKW8Jmz4Oy9M5XtYscA3WhtSwFnhSQe?=
 =?us-ascii?Q?JRMep9McAk3nvJM9JJleSwKkeP/Fk+q1txiro5fdEVX/LpqLMYYaFE35eB2s?=
 =?us-ascii?Q?m1EcdxnJuzVlgnM0eIPEEenzUN7S0G1Wf0xJqofWJZPt7Z974BZBpIXvddrN?=
 =?us-ascii?Q?LlnZHXh9ifkE8idoXuyOwaWI6Ds9LiS8oeb1cH4U88EYTpjzSDY07ssFLYuw?=
 =?us-ascii?Q?ZFFvJh84Zlm1W1fXQ97tR9cEmwg0GQhN9G4F/hQB9IDT1f6VleMi7TH9fVmM?=
 =?us-ascii?Q?itaSfCuUTh5kSWHTP04jvz5lEVTxfd1eYQQAwzaWQyut7yAfqXcBURdr3/NG?=
 =?us-ascii?Q?C/tHkECe4uQYzHBM9Ki2ze7yhdKD+waWa/KSpjTbu4PXdrcX+dB/A6cyWuA6?=
 =?us-ascii?Q?zqjVE3U89EI1uQFdtsljOkwZiMo3+SdLduDL4DtxrFSRHAcFJe2iwQOiCde1?=
 =?us-ascii?Q?Eqdn5ke34d317S5/p60n/1VpMwN1f43rinuRi/KoBaqDQ1k/t5r8Q6vNGgeM?=
 =?us-ascii?Q?N9Fqy36dZrbz0cu0//xK07vh/bDXTelTTGifY79fd9K4X1M+zL/6ML/hwgjk?=
 =?us-ascii?Q?T4mNs79sQXR/4/tTukgoN/alXK5EvjgjZA5KMeBOrvjnwdlIPl8ieRi0dxjI?=
 =?us-ascii?Q?BGIfY7nBVxWB2+5AvdmgJxZzVWGR2LaK5wJUArwW0AB6OBuuknPyPJVSeZza?=
 =?us-ascii?Q?KWgyYIOPIVvrQRQVk8oaD5ZI2paTmkHABZgtsWPs9WLuWET9fQdObcisATBN?=
 =?us-ascii?Q?ZaG3BDULDrzMGQCTjmyUoXZTwH67bLJzGXKmkFTjlCefFhvjT3+Gl+qlSX03?=
 =?us-ascii?Q?oEhpQ2tsb48w1D8SnAlgOy2e9XTejzYEm11ni9tlPGKZWnCZwKw7E3BhSnzn?=
 =?us-ascii?Q?6QjgYMxv2pA/eOvGeCNa7i2p2vljQ6ttPw9D1TWDA1TzpltwmBfq7TcnVyS8?=
 =?us-ascii?Q?DIcoeV7ooqRpbrthHipaTvxO+Fzhz07HBurNSRpL0VwQGFDyrgUwbFa8qxKM?=
 =?us-ascii?Q?fsKwFCp6bhzYfgNoNiOz9kUmeUilOfp+IKoxkKhC?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	roE6JFrwIuz6mHpVvWI35gVW/oqGmnP+oS+MeJKe4/YsBe9RETnw+zG59SUw1ISPJpExZkidIeOKJA+NQk6f20RXIaAWZ9jQtkytyO+OovYDXb6J8qDZMSdAh1n1iSS6ilWm6HcyXrq95QG2Ye4e8BJCe9RoghlqPTuBqPWuzu8oBkdqjZrx4F34O6a9pdQjIUww2ckFT6ftMWhwwF7839UVEit6GERdVVocH3+St7jEiULv3D3dPqaJ+2dQCo4g/8L2BDdtP8yXM1f96uDGVls4Jf7lOvCpwUiI8tQrtj62Mr6lBRywZN5lhuaGXzFao2YsgJeyKMX3no7pb4SUHIGcMeGmoFXi2FonIGhRnPvSk52U0hxeLPLkkC1B3KT99AhfkDLnrGphHl96OJznHwMTap7dhADPn+e6jvn/VGIQqQW93VynG4MDoQjcmBIreT2ceVSTQfqOCkpGb0+5VeUEUIoaHzjZ/j5oPSCyzYtwOBNDOM9ZOE8ikH/+xmCzgc5ss7OcR/6mfMSElwRikKSHO+JdAHiMSuRXHknD45h1mhFt1L0H6Xj7ZwNFeqUPq08Bn5BzCZ22mUu0YXSmOLzu+IaeAcYN2iNg++U3LjA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c56313-129f-4ec5-5abd-08ddbb328822
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 19:39:46.5941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zf0TYFdPzjTYEQROvLharJh8DyK7nBlOH7W1zR5kNxItiXv6tJtfMCa6m83LXk6V1+Qgg70euEwuFDSqt6OabQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5055
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507040148
X-Authority-Analysis: v=2.4 cv=CMMqXQrD c=1 sm=1 tr=0 ts=68682e06 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=20KFwNOVAAAA:8 a=Zz6nxsBoSOZYNeXGPrkA:9 a=CjuIK1q_8ugA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: t7elIdN_dQTS4cyzQIkGR3v_Z0ysNbs1
X-Proofpoint-ORIG-GUID: t7elIdN_dQTS4cyzQIkGR3v_Z0ysNbs1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDE0NyBTYWx0ZWRfX3Lu5i9xbH5ta oYQjjUZkB/rXjHzhcIkiEV3Ti9LPplPKskVolaHa3fL951W+nudToRs9D9R+0u2WMQrW3VvE2Qp I5YybYp1dtflcaI/GG5Awl4iKuEzO7flwJrpUNK/3Q7vU/tf7jsebNs6+vRcoiYuJ8UZKeCDCE9
 dDjpSD+oH3z/jGDD/rPhv+Eng48LghbdQht+cTKwU/N2R+4xPkV2TECKpBcub5HkWNoGdF1lht7 DFMXqessi7fN31GVNUzJEuzE9EigLJOviiHvY0dNx0nA0Rd1nS6A0vWzglkJPQv1yBOtNgTlSy5 UCEBkmmtSj0cqA//InBitxahG6HAIwLwHhXH6WgDe3LFOkkacU3JywGz1DtLMw+64wF9TfU/WHL
 yjj94ZK0TLPNvvxlWOrFqDHADtey+NKgWzzQ9PpSkgtLPTQ8+UDPBtiH1+Zxja1GnRoFHsuU

* Peter Xu <peterx@redhat.com> [250704 11:00]:
> On Fri, Jul 04, 2025 at 11:34:15AM +0200, David Hildenbrand wrote:
> > On 03.07.25 19:48, Mike Rapoport wrote:
> > > On Wed, Jul 02, 2025 at 03:46:57PM -0400, Peter Xu wrote:
> > > > On Wed, Jul 02, 2025 at 08:39:32PM +0300, Mike Rapoport wrote:
> > > > 
> > > > [...]
> > > > 
> > > > > > The main target of this change is the implementation of UFFD for
> > > > > > KVM/guest_memfd (examples: [1], [2]) to avoid bringing KVM-specific code
> > > > > > into the mm codebase.  We usually mean KVM by the "drivers" in this context,
> > > > > > and it is already somewhat "knowledgeable" of the mm.  I don't think there
> > > > > > are existing use cases for other drivers to implement this at the moment.
> > > > > > 
> > > > > > Although I can't see new exports in this series, there is now a way to limit
> > > > > > exports to particular modules [3].  Would it help if we only do it for KVM
> > > > > > initially (if/when actually needed)?
> > > > > 
> > > > > There were talks about pulling out guest_memfd core into mm, but I don't
> > > > > remember patches about it. If parts of guest_memfd were already in mm/ that
> > > > > would make easier to export uffd ops to it.
> > > > 
> > > > Do we have a link to such discussion?  I'm also curious whether that idea
> > > > was acknowledged by KVM maintainers.
> > > 
> > > AFAIR it was discussed at one of David's guest_memfd calls
> > 
> > While it was discussed in the call a couple of times in different context
> > (guest_memfd as a library / guest_memfd shim), I think we already discussed
> > it back at LPC last year.
> > 
> > One of the main reasons for doing that is supporting guest_memfd in other
> > hypervisors -- the gunyah hypervisor in the kernel wants to make use of it
> > as well.
> 
> I see, thanks for the info. I found the series, it's here:
> 
> https://lore.kernel.org/all/20241113-guestmem-library-v3-0-71fdee85676b@quicinc.com/
> 
> Here, the question is whether do we still want to keep explicit calls to
> shmem, hugetlbfs and in the future, guest-memfd.  The library-ize of
> guest-memfd doesn't change a huge lot on answering this question, IIUC.

Can you explore moving hugetlb_mfill_atomic_pte and
shmem_mfill_atomic_pte into mm/userfaultfd.c and generalizing them to
use the same code?

That is, split the similar blocks into functions and reduce duplication.

These are under the UFFD config option and are pretty similar.  This
will also limit the bleeding of mfill_atomic_mode out of uffd.



If you look at what the code does in userfaultfd.c, you can see that
some refactoring is necessary for other reasons:

mfill_atomic() calls mfill_atomic_hugetlb(), or it enters a while
(src_addr < src_start + len) to call mfill_atomic_pte().. which might
call shmem_mfill_atomic_pte() in mm/shmem.c

mfill_atomic_hugetlb() calls, in a while (src_addr < src_start + len)
loop and calls hugetlb_mfill_atomic_pte() in mm/hugetlb.c

The shmem call already depends on the vma flags.. which it still does in
your patch 4 here.  So you've replaced this:

if (!(dst_vma->vm_flags & VM_SHARED)) {
...
} else {
        shmem_mfill_atomic_pte()
}

With...

if (!(dst_vma->vm_flags & VM_SHARED)) {
...
} else {
...
        uffd_ops->uffd_copy()
}

So, really, what needs to happen first is userfaultfd needs to be
sorted.

There's no point of creating a vm_ops_uffd if it will just serve as
replacing the call locations of the functions like this, as it has done
nothing to simplify the logic.

> However if we want to generalize userfaultfd capability for a type of
> memory, we will still need something like the vm_uffd_ops hook to report
> such information.  It means drivers can still overwrite these, with/without
> an exported mfill_atomic_install_pte() functions.  I'm not sure whether
> that eases the concern.

If we work through the duplication and reduction where possible, the
path forward may be easier to see.

> 
> So to me, generalizing the mem type looks helpful with/without moving
> guest-memfd under mm/.

Yes, it should decrease the duplication across hugetlb.c and shmem.c,
but I think that userfaultfd is the place to start.

> 
> We do have the option to keep hard-code guest-memfd like shmem or
> hugetlbfs. This is still "doable", but this likely means guest-memfd
> support for userfaultfd needs to be done after that work.  I did quickly
> check the status of gunyah hypervisor [1,2,3], I found that all of the
> efforts are not yet continued in 2025.  The hypervisor last update was Jan
> 2024 with a batch push [1].
> 
> I still prefer generalizing uffd capabilities using the ops.  That makes
> guest-memfd support on MINOR not be blocked and it should be able to be
> done concurrently v.s. guest-memfd library.  If guest-memfd library idea
> didn't move on, it's non-issue either.
> 
> I've considered dropping uffd_copy() and MISSING support for vm_uffd_ops if
> I'm going to repost - that looks like the only thing that people are
> against with, even though that is not my preference, as that'll make the
> API half-broken on its own.

The generalisation you did does not generalize much, as I pointed out
above, and so it seems less impactful than it could be.

These patches also do not explore what this means for guest_memfd.  So
it is not clear that the expected behaviour will serve the need.

You sent a link to an example user.  Can you please keep this work
together in the patch set so that we know it'll work for your use case
and allows us an easier way to pull down this work so we can examine it.

Alternatively, you can reduce and combine the memory types without
exposing the changes externally, if they stand on their own.  But I
don't think anyone is going to accept using a vm_ops change where a
direct function call could be used.

> Said that, I still prefer this against
> hard-code and/or use CONFIG_GUESTMEM in userfaultfd code.

It also does nothing with regards to the CONFIG_USERFAULTFD in other
areas.  My hope is that you could pull out the common code and make the
CONFIG_ sections smaller.

And, by the way, it isn't the fact that we're going to copy something
(or mfill_atomic it, I guess?) but the fact that we're handing out the
pointer for something else to do that.  Please handle this manipulation
in the core mm code without handing out pointers to folios, or page
tables.

You could do this with the address being passed in and figure out the
type, or even a function pointer that you specifically pass in an enum
of the type (I think this is what Lorenzo was suggesting somewhere),
maybe with multiple flags for actions and fallback (MFILL|ZERO for
example).

Thanks,
Liam

