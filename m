Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AA12874FB
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 11:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750244415; cv=fail; b=DQkL1+PSu5w3PoYpKn9NJ9BHUytzSCehNEs6GBO5+dWeP1peIoYYQDfnaIPYnmcAEvS9RpmmQRLFKAdVfwCKe6ORjsARZXP6Lpwfd/ym9FJtXEHP1PiVsCLOEO8FkKV0WwKApeOxpETvlHCSwUQCMSMxWn//SJhGwCwgfRH4ePw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750244415; c=relaxed/simple;
	bh=0elafbuYBEPlrI9/rPPi1/HYfoUpsI8srxAZLducj8A=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nrl/yYOmk3/KFuaqFJY7ghhykeCveOqwarFhwDVnB4Eo82SK4ZSY8qwik026WtoWVjfI8OkldTPet+fZsZbsFx5iM9FQqN9NXZOL+Yx59eFnPNaxVQxWUrMGF6Zk5iTUSja9FAOHL+A1ReUCU7e4PDcNOpN7ABdGpQFEv+UAljo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ao7rvtTZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KgLMdcXM; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ao7rvtTZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KgLMdcXM"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I8fqQR024437;
	Wed, 18 Jun 2025 11:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=+hvt+uw+SwrO7mGl
	j+rzAufPHVeYrQFN/TxwYWyz+EE=; b=ao7rvtTZy0Xc387DU64jetilHU+6t65s
	del5rY8d4as17GxvuKXDHGcXV0KO7lUNBuylknZTy4mq7zRTua0AVSozLdk4URNn
	kevIcO1ALNZJMDzkxJnc52ezMRDyJZRG59iptznF0Sa3DEDUbaydlSA1BskIAvED
	O5Y91/Cbnu+f2GYI2oMQuA6+Xl6qDfej79CLhY4fB/S8ute9UvYAyThCmZ02Ckxw
	9Nf6F8O7RgTB/i2+Jd6GGz+CeNR2mM6C6Jowxv4XrsMjAODrXXebqPTj038BQJsN
	8D+Xy0iqDH6StqCH5MycC+Zl0oR2isMwLVyywaQtquds1+9jNsHPjw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479q8r6jr5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jun 2025 11:00:01 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55IAhOGC032102;
	Wed, 18 Jun 2025 11:00:00 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011046.outbound.protection.outlook.com [52.101.62.46])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yhage89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jun 2025 11:00:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uvl7kPswqWnFI1YKCcbHyCfSVLrcIxE53tTzoLBAiNaIgYGFA3F3gt6W24nUPp1mgjVbKXi2gCVQLiv40k2oekGjQLWdUlcdsPYbYpoJq9ZSJlIESj8XX7IG6PnjOB3PSghH5KajFZ6LYyjItH1YJ6FDETJvU1f8C4M9yKEPUYBR1seMbO8aKOkkZGcInZVGdzdKAkk/KaEtb4XlOdHXc3dyWeTfRxOxKorS1YGL2yAzq8rEHmYKl2DjZ/LUPzPHil0rkSArSN1AlXKXZajSNxgc4l06iSnOOOgTv2+rFF41/+tgoOOCEJkRcwWXTrFm2G4jpy8eHSMolyE2h4ptLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+hvt+uw+SwrO7mGlj+rzAufPHVeYrQFN/TxwYWyz+EE=;
 b=KrRZd7J+vvVIBahL4bBxNRRq7v3emmWYLcQQ89D6xwyE7EqdGSRuYfIGzfy5lg7nyi8fwmjAZZkNdaMp8qF/XHVVe5u7+q/V3G341mOIQ3Os2NK2ZRRoXgN/rd/Ma31oiDOdFiqw39Uz6TrthxKP5CNmJIXGp1Zye5u70oCG+gWcJPJDS+XwlBio4yly8hLcl929NL1zRn0vKsbOh1lsKc7OwPbMCqzHOPwplewONe8hpq6hqSeOwYyadccIF9asXC9BhogE/rJUaA91MrYN/WXvcntdG4HsjJlr1092Jsb/Rqqc1eiK0u0JuTL/WoSBUljUkfVn/ZLBjBaAf4qJTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+hvt+uw+SwrO7mGlj+rzAufPHVeYrQFN/TxwYWyz+EE=;
 b=KgLMdcXMhso0G1cAYKKMip1cBkiLH8qFfPZcijmWtcQjXqU355JAwg/wCN4H3VRRGyNGZcRU/8HE4D8QR7r0WtoAgqPpEFYUAAz1uJCXHaemo9CL8vBuzS1ChQqIYVm6FNAU5+p/U6am5X8t8BE0ZrXQJ9eomgYF+LYuKC27KJA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH0PR10MB5195.namprd10.prod.outlook.com (2603:10b6:610:c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Wed, 18 Jun
 2025 10:59:58 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Wed, 18 Jun 2025
 10:59:58 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
        Zi Yan <ziy@nvidia.com>, Vlastimil Babka <vbabka@suse.cz>,
        Suren Baghdasaryan <surenb@google.com>,
        Brendan Jackman <jackmanb@google.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: add missing files to mm page alloc section
Date: Wed, 18 Jun 2025 11:59:53 +0100
Message-ID: <20250618105953.67630-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0017.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::8) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH0PR10MB5195:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c209e21-b740-4050-6bad-08ddae57440a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W5eoBjp6FSksLS9tVTZ3MAEKjXUHQP2OCVsPvX1m2SkJuY7T1MfIHz9XOvWA?=
 =?us-ascii?Q?G5yhR4KgzshHpY6weqAzWQnrJObBcsBCzIcJoqOkxf9ldX9Ihrc1ge9YN8CJ?=
 =?us-ascii?Q?M28KeQqtTFY7T9WwwT1LliyauWsg68F41ttVUe+QFnOfDJPA9dSlIsgkgAGQ?=
 =?us-ascii?Q?4pKQteDGHZNdByHvf/EaKupwjQKfbxyYOPCA8WhnH0j/99bR4anWUETBZ946?=
 =?us-ascii?Q?5o1a33HC3gjNWYlUTpUdh3Jlzcc/yAjSlKuQ4b6VIi+uLWD3m5YQo3p6tsmC?=
 =?us-ascii?Q?sFLfaVE9o20iBiq+v0xG13MCgNfPqbN6ozozii2Izyd7B1BvaPRBD+N2bGgp?=
 =?us-ascii?Q?Ydah4NFIC25eI40bpah4E3SVx28/LB2EY/XCqX6S4ch2NcmaajD8EVPh0TrL?=
 =?us-ascii?Q?nu67wISZudkjaA210t93vq539ENflFUZcKSXC8fWh8uWeS4I1HAuGUylfGJF?=
 =?us-ascii?Q?f4M5i9I1nLnJQuDe0EI6f4YfPNepzdTZUHo0EnKGIlRLL9R48LSwjFmFUSL4?=
 =?us-ascii?Q?C/XO+Qh8CvfblGpGycY8vCIi/9zf0DIv0XEpkDsnKgrHkwSQlAuaw8L1z/zR?=
 =?us-ascii?Q?WoAR9flN/EKzO/wjnkGBgBTMR/Sq3DChM0Z/pEpon5kWD8iCTUTdWavaRhit?=
 =?us-ascii?Q?EUktq9ApekIFIZ2GUOYZIfBS9j3s0gGyHhaZAZrUQKNESf18/GwNBtSFSJaC?=
 =?us-ascii?Q?rcJj1wapQjQZZ2FnXqAWj+652RUItQUtUb7VQ5kT1ZBY23sX572IeGnhLEHy?=
 =?us-ascii?Q?UZFLK//pbPFngEarAYzfhrzrX7GsW2XhTdj3TN10CYm2GYT9GkKe+v+A3Is7?=
 =?us-ascii?Q?oYvllYt3BWbxcBO1/T7dmoI+BygnMgN42iQXhT00VF+7fgIua3aG4KCrYC1G?=
 =?us-ascii?Q?PRVm5jQ+VqYcxKf5z9FVOEIHPPOhYwvZSJjQMDQp9QtS0a5nCHmBCKmIcE6u?=
 =?us-ascii?Q?68WgKSik0q7KKKKbaQqUVlO8WTD76Zvba5Ed4j9yQVeLezAi3g+VURaAvXfw?=
 =?us-ascii?Q?GE7dB/MepCmQzDbXoV2vR1SNx945RGKosYmIh8ZY+IIzHaobjxoxm5sjVHB4?=
 =?us-ascii?Q?CJF9RfU8BrLvVROkNLXj8nm4InPt33Q8ULmYO/XtGef7iT3ngvgpUTNR2xfy?=
 =?us-ascii?Q?q1MjHSYkGs4hs1wNqu04FWCFsEGyrVUdkfGXym804Wi0X74MAP2W3Pv1atAP?=
 =?us-ascii?Q?4BEbMjjEGFhnDM5gtnsEnZVF82O9RiqZjB6M3s7O23JhwP7tn69sIZH3BFPH?=
 =?us-ascii?Q?yylVaYoLnrqCFy/FEi6sC4h5brTS/BRaLmDUehGJO/FU9DpFyNeH6ts+gJ3M?=
 =?us-ascii?Q?mp8DvL5guQPTnWbHWmGLMUATIXMSkVkQvwdWLWt73N1OMS4MixX7kU2+Ebx+?=
 =?us-ascii?Q?c0YkUReM1j/3tBwk0pYBqdnIR4kb4B8xBEFn1GFn/0IrhGR6Kn3reNFB29FO?=
 =?us-ascii?Q?AW4cf339fEs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QFO8/pRx8GXhQqLbpe6gHXvVSTFVvnSjc4YpNF+25zLpzpLu/uK68c9ej8yA?=
 =?us-ascii?Q?9UUdARG+G6tpWfaveipG1thtnPGgMyni5M5SeimdJHfnXprLdE2ZI7N+XYw1?=
 =?us-ascii?Q?aye2UhF4e5tHDtKF19Izqpg0gsW7P6GsE+Brfg+l62rEwedWKaJON4PPONII?=
 =?us-ascii?Q?3y/JStdZGlAnyX4xfsGpnduE9iPBOPvVPqVqol4eG5WLDCojg1dvBgL11a4R?=
 =?us-ascii?Q?5iChcIC1XDP0TyzVDf7ruRgao1t8OFQDru1vCsUgavr/PkSpzIhyHZC6/JXU?=
 =?us-ascii?Q?8PlOQgYEx067LLz13KajCx9eAmIDCYnSxyWF7ot7iPm7Y7Bbkd45QM34jTwN?=
 =?us-ascii?Q?IZi6jk0pm1qw04k3Qa6zgCqwhxBLnLkrkjycrYckrCZVXaDIV1BlbCwq40RW?=
 =?us-ascii?Q?DwOaSQWrNuuZ8E8Fp0uiZV2csICQpNW3DlNNaxTlqP6WZxZzY//78aulyDSQ?=
 =?us-ascii?Q?SigQx5pFnudOUVaZYeKoqVXqzaSm1D8oWVfsh91svBLZh5+7YVjaLFQCxHVa?=
 =?us-ascii?Q?j0UyE+SDocjXxMr9CBhJjsTZKgeWOB5hAHV3YAevRM3zHTkE6detFXV8+qSm?=
 =?us-ascii?Q?7hw4R0yEMKq2iJKIwcn4+VXr78oadPEbPqhsiCqOrHKXCETFC0mbx2QFQnpg?=
 =?us-ascii?Q?0IWPzCQnZpcSj4tvJPXovTFzPjSnsF7y6eHok1JWgFg9eWFQklvMQ/JilTom?=
 =?us-ascii?Q?h1Wojq4oNpWgreM2ZzMKoFTox1626V6hLO1zyHQ87AwU2yi7AUuZh03XWtmA?=
 =?us-ascii?Q?A7Ayw6V45L2A/iIacN6ILEQBNG58LyrCJ9KhBEWefhI+VeZSi4mrUtSZhXvu?=
 =?us-ascii?Q?y9tHbj85QoJTPHOmqJP26RyqYqtHir8aOKPf1k+XPdQO53NJ0rylPyGdKGzu?=
 =?us-ascii?Q?YTDue8SSJbImpA2rQZ1iweRBmLTpFVxI89xiM3s809VxLlH5xoa41ahHY+tf?=
 =?us-ascii?Q?6y4D7Ah8+s3QNXW87isSv6GCDkcHR8NoRwxlEOsC87zin+aqSPZnYjqN3W9N?=
 =?us-ascii?Q?LK38Inc6lcLzhQybF1n2fpX3+fQYUctwhJoCJ2lydXWVFXhbKv+93vBQtqAc?=
 =?us-ascii?Q?zVtGYlt3/S/fTje0HRuWqwvqeMMLam7wVwMGtScb0TWvWNx+zc+5UwN31GTd?=
 =?us-ascii?Q?ePlI686xXURVZ13vdT+psipTIahyUCo8z45bNTXwgqO2TiTMy6shXu6J3tnq?=
 =?us-ascii?Q?YcpRz+MTYnvwtyMmulw/PC11JCrUoS5Lr2A8Epd2Oakos87xiC+fF7Z0vgjL?=
 =?us-ascii?Q?Q4MMIm29khN6WoskZS1oTZu/0+0A9RRQMZ+9+3g0tLEiilFP05fITZSkQAjY?=
 =?us-ascii?Q?QQyx2WOjvKyWRiTGM3Ui+qVKhLPiLXPtenT1zPe+iWcTr/fTz0TgDYTRs/gH?=
 =?us-ascii?Q?DF76ytgvKBvpJNAUCDSyFVjHt3jpUQweRDPvTC0X6DV6lLia3Z68jWzoyPcu?=
 =?us-ascii?Q?qWA7vHHTKAhPTG01HWLdzEX26S/SCEjBwH7nGdwm3tv8AuN+DI58AvR3/3L/?=
 =?us-ascii?Q?qVBbdfJSqH9dKInNPSHXIOTUTRHZVEBvZdYz1J7rvwca7bCTStWe3WcB/aXd?=
 =?us-ascii?Q?EdBQMPCXbKKpOaHIEkAoU7ssK8sYh+65TmNB5w2lmuupoiRB9CNFvVSiKp+Q?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RD71OSsL4kRSMQ6nwtBdbx+LqY7zTn26HcreUEs5BDZ8KNYTR0HqYsu3LuSSxy4YAqg4siAW4eoZcjTzoAi2JVDZLImO0QfU29CFPzIthbSwB8Yownra9Iz5o/UVc3F0clizVnX9DZ7cP66c/3QHitfNd5hOviquvVktjhFpf35/Ed1a5KZkjVSFPIMK74EyvnyY+9yeh3F4E9W2iqPUj4KxIc6JY+2VAWTusc8ympzpJHfmq5onDYnQ3Rx2Kvjmm63fCwZmomFbYXiukbpfh8TepqnqigjPrrOK05lpFUO62xl0Z9PPL10mvd8pT2FudMQxBFPcWyvWKnK64nusxwke9XyBchJEiayrSk+0mcgAgdCJMFcMT61ZZ4pBJ5BaUDMta+8MI5/qP5JlRGkl0Gk3K610M9ttUrkfirTwvWmspMQAXx3v1o8BIfO4YZEOqV/CTwMgQ+JV+j4IRl3rmB8rbvkxx/UXIeEYYe8d5Og5+Zb+39/hrB3oJnSgjLchtyaHywNfdk/gVtmC7sGOORqPyQ/0uDKq4GEeoKCjIFxYMM8bwbsKdvc5AJT7ZplCZa6IDBk/U7+dEZ/Cjiyrm0sNAyw6T+TyM2HaG+riufo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c209e21-b740-4050-6bad-08ddae57440a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 10:59:58.4024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bUlfRKFspFliWUFxjH3i5CunspjGC8Lu5p04gBwVwuFULIDHuj1x6a99QpeX+UnvOQPo2nh8DHY7BYXCfrTCpMK0VwmTgg6ZJMn60Z+KrKQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5195
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_04,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506180093
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA5MyBTYWx0ZWRfXxTZ7uZ4VwmyJ rxYdUtgDg7M0Cc4IwFRUUC3ZdQr08IwM+ORNYPkf9ib/Z7FmjbXM0ztEZEH1LrAxDyjix/96iEi uIgxOlE0qhXFgYWQ823sRRxp17dY/18fywRlPMOfV948uk8ySeiThhTAk2Pp6n80K1cElYskxQ/
 UKs/stwMb6KGIS6YOxpe8hOQj5XsUoG4bMkJLlWhsPDej5BWG2NEE3CllW41erb75E0b9cq06F5 g6gYwKXvLpPiLvI+LdT0bw48dP1RpaLIjYX8XwE8cMQwBB/tIE4khgo+A5ERKN81VIAUeIJJmkR JUe4wE8Vwje4fXqAVBGN+l/rOii4vkQ5urol63x/mR3xPJ1FAp9ZD9qUvxOQkbld8YGS2bX1IeY
 dsAf720u1fPG4svMm7dviIjg5YwBsQSokARvWZ+36tT/YqiOixgGw9W4fyY2WgTh+HmvXybr
X-Proofpoint-GUID: bJLotw5ETKZaZLY7Vo6T39CHnBw48tvh
X-Proofpoint-ORIG-GUID: bJLotw5ETKZaZLY7Vo6T39CHnBw48tvh
X-Authority-Analysis: v=2.4 cv=dvLbC0g4 c=1 sm=1 tr=0 ts=68529c31 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=1XWaLZrsAAAA:8 a=Z4Rwk6OoAAAA:8 a=s2hSWIIl5NW7w4-vmdMA:9 a=HkZW87K1Qel5hWWM3VKY:22

There are a number of files within memory management which appear to be
most suitably placed within the page allocation section of MAINTAINERS and
are otherwise unassigned, so place these there.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Vlastimil Babka <vbabka@suse.cz>
Acked-by: Brendan Jackman <jackmanb@google.com>
---

RFC:
https://lore.kernel.org/all/20250616202425.563581-1-lorenzo.stoakes@oracle.com/

 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bbabcb161572..40ff84e1dcd1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15875,8 +15875,17 @@ F:	include/linux/compaction.h
 F:	include/linux/gfp.h
 F:	include/linux/page-isolation.h
 F:	mm/compaction.c
+F:	mm/debug_page_alloc.c
+F:	mm/fail_page_alloc.c
 F:	mm/page_alloc.c
+F:	mm/page_ext.c
+F:	mm/page_frag_cache.c
 F:	mm/page_isolation.c
+F:	mm/page_owner.c
+F:	mm/page_poison.c
+F:	mm/page_reporting.c
+F:	mm/show_mem.c
+F:	mm/shuffle.c

 MEMORY MANAGEMENT - RECLAIM
 M:	Andrew Morton <akpm@linux-foundation.org>
--
2.49.0
