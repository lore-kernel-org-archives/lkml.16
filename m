Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC318F58
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 17:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746294664; cv=fail; b=Ej0uCaq83x7mmnouIdnMWRnDwH+nThWJfVW3G+/kEzJs5Ayl2DwwYD8it7cSqMLU30yTd0YIRs5501/M5dTQDCZKmJOS93Z4WLY693N+L3aeMk4vmZ8/3nmmIBTNtV5EDrutV+d8JJZHDJqFB857sCNZvulaNpsTBbWOdDdVPU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746294664; c=relaxed/simple;
	bh=f1w19RI7cOeAiFB8mub+IYQaFClKPijzi1pz+9gyPWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Kckp6uu0FyNIGhJu8VMoz2q1azKWNlCfMP92zNsyb0iZXk9DFlplvX38lXAHePIAWwRju0oY5NxjUGIojyokasHSPnpVFDKoFQbUyTOPD0to63hrTVr0f/zs0t3M7Rbs2ttczkrJo0ofFO/Eif7WO6mIZByj5EKnim+u0SRoypo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YExw9Wj4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=T9f03OMo; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YExw9Wj4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="T9f03OMo"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543HHkSL011972;
	Sat, 3 May 2025 17:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=f1w19RI7cOeAiFB8mu
	b+IYQaFClKPijzi1pz+9gyPWY=; b=YExw9Wj44Yc6rZuPh0wCfiYcjMC8ZVCsi+
	E7Lyi7vdOW/j8hPufc57iyihLBbbz37YWzXmmV4+/cwrNywbcK74C0k6NMw6AB/A
	5pTwjOSeols6DN3pCvNRhO18O0wfUOR4HaJPUUb8vKA8d9NvKsbBr500o0EbOjHp
	HXoMiwGERCGUedhxlxeABKtfpwpVnSj4U/2ZdnnZmIogMMqbFcM4ZmvCi3m1HR9X
	Nbo9N22FNX6TmabZejysWrld0VlXpJAHRyqbIJol3AvnKS+aHvE4GJuHatZweFpo
	TJdJp/rGYA3vW8lmGHsgSa08YO+3Q/3934ilCadNj/yDOFKu5rUw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46dqdjg0c4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 17:50:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 543CGraZ037643;
	Sat, 3 May 2025 17:50:26 GMT
Received: from cy4pr02cu008.outbound.protection.outlook.com (mail-westcentralusazlp17011027.outbound.protection.outlook.com [40.93.6.27])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46d9k64rf3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 17:50:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TLHa7sP1pPSd3oBFNFtfRD73HTbT/J4/atzUTRMkzyyJ6UqZZ85UZJVBvSjpw5n/W46ZX5zffdRZ9ikKY94nlDFNHAVuqszKNT8fZPNIbcspu+bqPu5y+2xUVh0uHwKZLkOyUvQhwlEZa0rwFR0K8g0BoIja3eR0tnPUVjzx4ZaUYaWgASfU/24L4wYU3o11ayVpbpEDNTLtxHnPvKso+1MPaUABg/XbMDDDnRfM/CGXFFQPF3f1kLrREd40kHIW19RPAKK8/tmnaFejX6DcNCqqdFMmthos6avD5y9PZljQe2cRRkW1vmLgdxpaIDb/+FfMc1b+iG4Uqvw57VFM5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1w19RI7cOeAiFB8mub+IYQaFClKPijzi1pz+9gyPWY=;
 b=FBJnWmgf4XuUidQ4wtDob7nEjOFcjxyJIYb07acCmkM/DoS19cBZO2G3HBKlyPaSbk0bUgj/JQ8AnhmuLmuTeu7n49yp2WXVASVisak704b/Wjk54euFJUT5hVJwpO8te2sB5dnExrtvMXpeC5XJHhvm2saxgHsEWs1IXy59HzNlRo7NIK+7EseFyLbL/Ndd68kxPr7OVyglljndD21dFAjRK94KLoUkAI7cLC4UcDWHM0V28HVyWPZp3O4HnuK0cCVYTBAotCrUWOT7E2Rt73Pv0Q7PsL0iVDzcaWe+OGf1x/orZAp/f5TSdvOYhLr48Ei4g/v7Z4k2v6p5MkE7xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1w19RI7cOeAiFB8mub+IYQaFClKPijzi1pz+9gyPWY=;
 b=T9f03OMoJ6AOy9dCaNeUn48qK9QNB0izNvPIp7wFxICrOZ5Cz9VuEfXJ3Tz34Q8MojKQcIc2vujRv1QYUmnYboT+UoRJKtyrpefpsoUiNR7vPtFWy5oDpF55zWIF2TOeio3Vca5QTzt7tlPdrEu6bV3KMmd21YJEQhLaAvGfWEM=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by LV3PR10MB7722.namprd10.prod.outlook.com (2603:10b6:408:1bb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Sat, 3 May
 2025 17:50:23 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Sat, 3 May 2025
 17:50:23 +0000
Date: Sat, 3 May 2025 18:50:19 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>, Pedro Falcato <pfalcato@suse.de>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 01/10] mm/mremap: introduce more mergeable mremap
 via MREMAP_RELOCATE_ANON
Message-ID: <5b8fdef2-c605-475f-9673-f42328db7128@lucifer.local>
References: <87e668d54927bb4ccdb7d374275e0662de667697.1745307301.git.lorenzo.stoakes@oracle.com>
 <20250430004703.63rumj4znewlbc2h@master>
 <8c052822-5365-4178-8e06-ecd4f917cf8a@lucifer.local>
 <20250430154119.a5ljf5t5tutqzim5@master>
 <ae3717ca-42e7-49a6-99f9-73a4c0be70f9@lucifer.local>
 <20250501011845.ktbfgymor4oz5sok@master>
 <d6d5a67e-efcf-4e23-90c4-4f6e370bde32@lucifer.local>
 <20250501143501.vljk4hriuc3c2yrv@master>
 <fb53f16c-9386-4b83-9696-1ab51f03fe54@lucifer.local>
 <dd10778d-3721-44da-8c7d-10d94378777f@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd10778d-3721-44da-8c7d-10d94378777f@lucifer.local>
X-ClientProxiedBy: LO4P123CA0168.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::11) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|LV3PR10MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c6c29c4-f046-4daa-f6ec-08dd8a6afa5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MCSgC6AdvcERfez+NtUdkKn9zYZ8ilR3IGHh5iXvOTnwhox7dRFeebHl+SxU?=
 =?us-ascii?Q?agPT7yKN2bkTYLSsY2O/qh2mjQ14R6l9EjiFtc+6PqIPkx4+b+8DecupZkev?=
 =?us-ascii?Q?MNNxL0ynwDc+4frfuxePHcfOyI3yMj6weASNl5PiFXuqBTS+iucPbMy7iIra?=
 =?us-ascii?Q?fY1fjtVJqFlU3qO2w9qN9tg3+oCl9C/4CXJSDyowavj60Z++JnY5wJI+kkq+?=
 =?us-ascii?Q?xCocIBty34RDij0Sy/8O7y8K781uiV1TIQCPtQdmi1rAud+b8lJRA54qNi7I?=
 =?us-ascii?Q?TxttkZnUrBuWafI2AJInlF60ZYUE6W1zCYQXedXov8XPnribdq/qh5Z+w6Ol?=
 =?us-ascii?Q?ArcOIL/TM+msspieJ9BzG78AfGHSRRZOXsSlY2UbEVQbTXUZQCyB/k3WxUVN?=
 =?us-ascii?Q?F89g0hxzqgk1B+7hk827hyKeWQ8IAuUpkytMzSlLlajiNp5ifY6+7AXsyzaX?=
 =?us-ascii?Q?xxoxM8hzS1mLhqq1PPpZxf6sO1hHdGveU5tQIw9vU3HZEcfJpCURuRAdOGbt?=
 =?us-ascii?Q?R3mHAYlJpX3WCKW35ovGHdt8KU3bK7TwCiTEHisC6/4exdx0ouog0bdWj7PZ?=
 =?us-ascii?Q?aIf6syGCVrLdLpVGWGLvDEUHp3XG9RU6NAaNCBehIsR+tAzc741tORRknulL?=
 =?us-ascii?Q?4DNZygcQfs2aL+QG8K6HWDiqCPD8948Ef5frq0QGIXZW/0ldPsNNbICEpSWr?=
 =?us-ascii?Q?mIoo0xz+Hsd2RSqNsC0FflfgW+qPFGtsRmdQ1pTEcr6anxL/w4YJpo95H/sN?=
 =?us-ascii?Q?0XDI6c9po2VpENjaID2qHDMGL5hpLxWsUbZ9Nlx37Ddyn/qQwwNY4+ZN7mPj?=
 =?us-ascii?Q?5OMfcHPCfAZ7aaONzeALdwUL50PbeJE/URz55cG+shykbwayROLBCwhj6jJG?=
 =?us-ascii?Q?VluYlFDJOYqnbsesVnQUzBTmRjcRG2eRPiWfcaNZttqBrp6MBNZDpq627w7u?=
 =?us-ascii?Q?WEbDTTaPZXGHMjSHgOQnjzGzR+93nFJJO+cnPS3nK3UNIGl8mbKpSsspouw4?=
 =?us-ascii?Q?HuoyuCZS9mvR8S2BwM0fz6eXI8x6nw0t3joPVeYkKsO5eHcm2LmpRQ2XZ9sU?=
 =?us-ascii?Q?YxermuiSjdp4yoT2xVsMj1vqrQ4uEmyTbffaDcYgKckRIznU/Rimu8zWzMU+?=
 =?us-ascii?Q?gbgKxkqliZC8sUwX75p6Nsrp0WQgViI30vQIWnMLaQXO6eIZbWDOYr8saU9c?=
 =?us-ascii?Q?9hO3ix0ipPNRFi0o/D4/gVJoATonLWGnjQ5GxezDJoxSgakv8Fy3SdSDCaB8?=
 =?us-ascii?Q?HpbHBpXMbbAaPZSplu8Zt3FHDV3aQwG496RaGdDwjAxs8jGwHL3WdFevxv5P?=
 =?us-ascii?Q?wuxsrHzvtwsx27XrgOqGQqs/FRQd+pu5GEaKS+ssbL7ef4vCNZLNmnEVWgJa?=
 =?us-ascii?Q?mEdRUTIhT2XzWgaLWYSeuuWNnS45nvr3WJ7Pl9EEcloTcc1NQ/Uj4dmUc/Fy?=
 =?us-ascii?Q?6GPDUJA0RSo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S5IgqyESNbkEyEAHDsk5Ii7GYTZ8Qq+ySGGXjlB704WO4JWSGyCqmiQKpqEJ?=
 =?us-ascii?Q?6ZPD2KSJIw4YXM3LbaIMnfOhJ34HVeiv/0TIS48Wse3BbBiIKJbAhv+liRT8?=
 =?us-ascii?Q?1R9Ysp9KDIyeqm/bt0/LpzeyZeuhEyzPbLno3Hh8bNmuc9zOpnIeSc9X8uhk?=
 =?us-ascii?Q?w8hjzz8ikkCQBUFPukRDrIiQTBWy0rcjbRGVkNUkGgMeDH3vpPPv2dgCuv1t?=
 =?us-ascii?Q?59dh4bGJf5NNGf9sRBwvIA/toop1Xun6SStc2MYGvb8Gozth6l7MJpLIhaxq?=
 =?us-ascii?Q?jNKlk604yf9sBnV4y8JECgR4TORQr6heu8FY6aQj1N1I1D6mi/KDXanqKmeE?=
 =?us-ascii?Q?sXQKLIF33ADGMrqGFGBzumPnS1xzJ1JPZxyPrIKDnQudFm6M7VK9RCuLuvL+?=
 =?us-ascii?Q?7mw6EHfpCQgFx31Wj0N9h9iuaXkuL5rivHxukv6eXr+jM/2fN0nKwwA1RGab?=
 =?us-ascii?Q?9FOwN5vkmbCP3Ta2+lTdwqF5vZFKYkgIYQTeETx25RQbbtajIo+r5DxNXxf2?=
 =?us-ascii?Q?2EFZCNadkiVQRdEffJcwMZzds6NNFQbfbm1sG8h1YChPrTBFZDJBqK260seR?=
 =?us-ascii?Q?fWC9T4ufOEvfE0BxA23jAYhMng/qDzatkL4QE+iAHxu5LYJmPZp/0Em9h09L?=
 =?us-ascii?Q?57rtVwZ1HEZuwFpj8gPAK7zKbnVxULy9wSCfmErHpdPGbfc61Ui/EYc2OZB3?=
 =?us-ascii?Q?KLMfxbtecfYgnzvbzr4DPeeOXkby54hDIxb08+4kgDWtBYsn27iQ9zaoshFe?=
 =?us-ascii?Q?JHPrc0Gmz7DIHNdxEd8+e2DV7xMEB8rINQyIM8xLPcUgP7g8dozihMun7RsW?=
 =?us-ascii?Q?n4tUFGUmO+VxT7sPJZfLFa/LSwPZG3zwGoCjvvgYXGFEjCL1NgMBIOBKgx4H?=
 =?us-ascii?Q?r0cZWhEOLpg6EV4jwgVYYDd24C+lRqm5yT8et4aK6AX3ORylcXKDQ4BP7t13?=
 =?us-ascii?Q?LYJllpe543NnV0W+AlMgtBuzbdSiHH112dP2HAfOUlWcQTMXnO+9avXrWhS1?=
 =?us-ascii?Q?3Lan5nwacXDGfQQ+J+Z8HJ2lzusIruGtrFynHhmvDmYW/spjZdH7ZnOx7af6?=
 =?us-ascii?Q?mS5129lIsF63KJqg93L2ZZTMpuojokLwW4LcY8ky9IMDVTHFQ9wduX+4XVXP?=
 =?us-ascii?Q?66vitkDPhQtAazo1Iv8hTCR3iMTNDCKbMIjGSMLbGGvVjDfs3xT+Kjb3G4RD?=
 =?us-ascii?Q?vfhp9HZFzB2axH7lXdakAfU/CZzwbBCA7gXbFIyHac9lh+yrZk6Bre9PK/Ax?=
 =?us-ascii?Q?ucaXkJyfbNcTN0PygdQBjHrXQCUfbvFA6TPwp7AkhlBx+0hg84I9iQAuMBF1?=
 =?us-ascii?Q?c+1b++h0lzYlP/+jcTqbQWwDJ+qxK45a6SJpZRyCvywpzIHBkTHm/sFJxgSg?=
 =?us-ascii?Q?HpjO6MPHi4d85Obn8DB2fKQiVX5tGIGrxPnGtwPrsvivaIWfjEvl7bGnbcpe?=
 =?us-ascii?Q?yjaeHcnrZKJblXhuFojWye/h3CKaLOfKhxmY6bIuj5dXHDQCzzyul0ifDZVr?=
 =?us-ascii?Q?tthfNHXRRDn6uCNWDbr9LzYBYRuAiocP+ppl+1u68Hl9nBnwiTk+eM/jFepR?=
 =?us-ascii?Q?ZGSjBXwWAYa+cAsTVBiEg0xJpAIl3REGyH6QflcQau9tTRQB8ONcd7WXvAug?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qipNbTHEnMrhBEgvTUKBgXG85HnbW8KyBc8Tppo5NglIdp55N82cuTpL9jd+gQbS/8w7j6bpgm/ZxPngOi2SJGRxNGDf4dH7f0bhfC0tIZdCuRU/q1o58VL03icpMdm+xtkUfnaO8tF5tsS0KW9izpAas61OlDrXWepW9N3GTANWFrQseTDzesxA8GFFhycq3dN1deWzXv5mPOZVCHVmtHwKnTDftym44SZ4n1FPwmE3NfZzSrfoGdUZL4NVWNzI1i8aEr6BQIcuc9mox+bf1jNkK9oHvlp3IbxjPlpbEHBULNuRpIZBDd5d8O6UaUve6dIqn+fIGZpSV77DwhLrimwDDjSlctzJY6AI4phvcZE2B8Q7rJUmenPQh/XKWG9Q+FU+VLJDRgiyNHOyTi7nUI5PcGxeNGu7C+cvmHa4Logfu521v6xr3JOlTdQjP19KSCo4HdQepOYT+AIH+zGF6G3Ah9HP7X5/Aqk9gYmyzc6L0L/QQmOX/uTvya7es98TNVW1AtOGH1B3nYWFoL2v0icFZxvI5YJrgZHqdbg+W1Wsu/iwAbJNMlN0EJSpKAgYfEVcFQnrJzPmP3W0/2Q/klGzi0reeIUuTzqNHu/NM8A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c6c29c4-f046-4daa-f6ec-08dd8a6afa5e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 17:50:23.0842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tODd0EOX0Ilqe35Cltbsu37y4z2zfetSDENPN9p3uy3xX6NLFjKolfjg8NaMWm+Oyxen9U/k40ecMAc1LjOPKwgnQ0PbJcBymJX8aP+B6P0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7722
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_07,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=822 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505030164
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDE2MyBTYWx0ZWRfX5qRlo52zrqSq 5KAndWumYRil5znCIm8wpQlIatrxhXAL0ZvZf4m1pLJ8Up1/HnHA2Q8ZrdKXUUPyNTUAOUBUrF3 G7dB0dQGizGGNRxRN5QgVqOAFKdIzHdy22LI2QvUGu7l5KFddxVX3YNMnvwfv8E+I09hEa9GaXq
 IOL1vJvaBzOBWp4JCZo55xUR5/qGEKbEc14iH1xoERqX/NWcgFBsAb+WMFXxcpn6z4/utzb4/yE b/GA0uc2bA7rot+P+sH1OSlEJ183TbwSMK1yqx4xXA+Nwiz8J1tWZh/0bvX4frBy0UeirEtp3wt Q011GMvL6jxKti75GnrNHZ3ywD3iz/AnXvh6FZ8h4IMvriTUt7O0QZTL3dBTKthKDh1vQFPIfhM
 /XrW9Ct6OHMPhxyuFK8MKxdzweubJqUJiF7oxx4L0PuroEW4Bexz48jwm5m888ntkEgT1PBh
X-Authority-Analysis: v=2.4 cv=DIyP4zNb c=1 sm=1 tr=0 ts=68165762 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=fGO4tVQLAAAA:8 a=D7G50T3mGO3ChR9Xd9oA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: cbAZweLGyPFXon95KyDDd_NmnX1iOBFH
X-Proofpoint-GUID: cbAZweLGyPFXon95KyDDd_NmnX1iOBFH

On Sat, May 03, 2025 at 03:29:08PM +0100, Lorenzo Stoakes wrote:
> OK have dug into this some more with a drgn script to read actual kernel
> metadata state and it's simpler than I thought - the root anon_vma is
> self-childed, but descendent anon_vma's are not.
>
> We can correct this with a anon_vma->root == anon_vma check. I believe
> we're probably safe with anon_vma reuse, because in that instance the
> anon_vma would not be mapped a shared folio.
>
> However, to be safe, I will check this, and I as I said previously, I will
> add a number of tests explicitly tested forking scenarios.
>
> The respin should have this fully addressed.
>
> Thanks, Lorenzo

Note that in practice, this wouldn't have broken anything, as in this case you
would _have_ to have parent anon_vma's.

The root will hang around even if all VMA's unmapped also, we only clear down
anon_vma's once no references from the anon_vma exist, and by nature everything
below the root must reference it.

But the function is misleading as-is so needs fixing.

As for anon_vma re-use - this is not permitted for root anon_vma's so naturally
it requires a parented anon_vma, which again implies AVC's which the uncowed
parent check would pick up.

Additionally, the reuse implies that the folio is not mapped within the process
that first created the anon_vma, and thus the num_children counts remain correct
across the board.

See https://pastebin.com/raw/q6wzUMLi for a detailed diagram of both scenarios
with anon_vma parameters and linking derived from real-world kernel values
obtained via drgn.

These will form part of the added tests.

Cheers, Lorenzo
