Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C9825228F
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750755157; cv=fail; b=WDXi+mviTG44KSARoII8FVtnpKdJMdDo2L3RtQBbRJ5ICVcfQ3Gmh39Ocs75ZwYTodFlLKmDvs3okT3okZO++xoC+jcPrL5Rw8QOAjqfl2hfDsDMzN6Ao/P3+tfyIiY7x3/TZHlbRFeKs/gnZBxW3OueFlKYYXb+uexsjjg2NAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750755157; c=relaxed/simple;
	bh=6iD7cxW984pKE68YMZ5pr291sKF7WUJGBGhNDcXDOE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qbQ2ToWJv974I4CHG7uQPfJMpHmG+GLbO2hOds8DQazSES1pBO5B9Qei1CP0btjoMLaUzY8p8vWvf78czpjAcbhTu2NTQCKONwjZCgyF3rM7oWXSNzkrEugaZ3pOwv58423nffuxuM9VSloLyGbS4IL/4G0hiIqde9Kh6IPlw1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mftpSM4V; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hyZv8iSP; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mftpSM4V";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hyZv8iSP"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O8icVC008253;
	Tue, 24 Jun 2025 08:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=lXsIbO2xaDhcqOpRtR
	NeYcsp+wWUUHMwNKmVyz8ssxQ=; b=mftpSM4VgRkEIkrqCZWBCZX+KBAmTNs/ed
	KJo3zayQ9q45gYcJFVN7sgI+xCkxS0a3Gv/9AchYrXXtmn2QK9gMsVs/Uhd4rnT7
	RYhbGdT2JSyfFCgEcJyyG6dFz9HXNgiHPKAfxxismKtp3phpGu6SjCRFkDobYJSb
	lifWNkaSHo3trNy/AN33beYdjiWjQsfleDz/UK2pmijsCT5nM3zE/VPx5JGkz3n/
	RcAYzQRXICT1YSQcHlRux/5+ZUPviFa6ErocCC7hzvI10UmOtoS1dtWPPxxoXTw+
	6H9Vt94BuPMwxQ6DMSb0GbQ9PwO9JUqHbGvaLmc7JwOev+jLtwIA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egt1bgd2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jun 2025 08:52:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55O8C0qA025930;
	Tue, 24 Jun 2025 08:52:21 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehvvvq1g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jun 2025 08:52:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GtfwQFv0SYdUigTvKelb2StbHP0KG770Iv6LuocR8/sqU8gA1TldEqDAtGF6Mi6iOL1by1ftGgAtKlIQi5PFuoZKvbFOV8Ywh671sAGJuidoKGjbHrztCBb0VAI4ctERneRb1RnYMsnyDxnOvvYAT7ENS2D9nVsqPJjG484aOx+pi2PWmlaqIkgDczUXqCHft+ZT6lhlwaCK+EJsSmkwnoMoXSrUBIBDfD6byzPhxL1ydYhYLno/QoZjiZXO/9ihlnQbV7rQ5kt3AQmVXhMpXim2MvL41iVlXPZCrkNsYAJFE69/Ct6mneKfDyI75zOCX5qQIXg19mq8IHms20yJyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lXsIbO2xaDhcqOpRtRNeYcsp+wWUUHMwNKmVyz8ssxQ=;
 b=QEENQXocDlwYowuURWYpdhW52VO98kTpUWkMiB5dEFhPU4cZ0JASzbqjshwjvvd3BlXFk6UviSkEiaW8lGcjLAXcr+79y9j9d2jphunlNGDke2o0mr3YKRmqnIYlgku/LyMlIJhHjOWBlsDOcwYSv4Q12O7OCfs5wOy/659ltg9AbLEe/hvDTnd3qimNOFjAFj3nk3moHw+/1hrbKRcv7P1PENeVA81yvSgBKIuWXWHXipgNfpOwfTxem3+CqgYDyJbCs2/ntLMgXN0VKkteBWGA1GNNXtYj5IruedSrtVyLK5+VW3o8kQAypqKFmLMf0+IlGZaH1mDa8Pph9+FDPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXsIbO2xaDhcqOpRtRNeYcsp+wWUUHMwNKmVyz8ssxQ=;
 b=hyZv8iSPqbonuZQ8qRMzIB2Kxx/W2FaNMAQI2eX8PTYR50YdJq0UbD7SlgYMdPMX0rUqUpn+PkPXkhpAXwhGD9nMMd7vWGQdHNIr89Fnz0pSTUgJT9QoEF9bpx2m2Kuv2ahP+iKaNhBxAr/Ex/E7YdlnT1fXrVu3o17EmcUExgs=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM3PPF8EEA8AA65.namprd10.prod.outlook.com (2603:10b6:f:fc00::c36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Tue, 24 Jun
 2025 08:52:19 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 08:52:19 +0000
Date: Tue, 24 Jun 2025 09:52:17 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>, Jann Horn <jannh@google.com>,
        Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Colin Cross <ccross@google.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/2] mm, madvise: move prctl_set_vma() to mm/madvise.c
Message-ID: <b908cd5e-fbe0-4edf-8111-4833b6b0b188@lucifer.local>
References: <20250623-anon_name_cleanup-v1-0-04c94384046f@suse.cz>
 <20250623-anon_name_cleanup-v1-2-04c94384046f@suse.cz>
 <b24f45dc-96c7-4dcc-8dab-8de11e3921af@lucifer.local>
 <b44b7cf4-d31b-436e-863b-c0edc88b1934@suse.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b44b7cf4-d31b-436e-863b-c0edc88b1934@suse.cz>
X-ClientProxiedBy: LO4P265CA0002.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::22) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM3PPF8EEA8AA65:EE_
X-MS-Office365-Filtering-Correlation-Id: 888120f6-b9f1-4a8f-3d6d-08ddb2fc6d25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DiAH3s+9HNwHmqPCzcylRwMKcqCuZ8ixGY/OM5cCnz47AJm4tbheD8ucMaB1?=
 =?us-ascii?Q?sDPRsMt6PoaDaNVrtB5/GWMzqrDJZndsxUs4qNs9RRneKrgJ6rRX0RHDTU+E?=
 =?us-ascii?Q?4yDrVEpTVqDUM95MqncAlP+zNCQ4aD+e7uRO5AUB/uBtv9n2G6pFjNW6tWDV?=
 =?us-ascii?Q?Ls0FWWjOsKP2jrFOOUlaB493YzGiyqC4aF6gn0csGkXi7as/wT4iJAXRlL+a?=
 =?us-ascii?Q?p2T5CED2H3JuDobf4yiryH7YraA/0106COripDW02jbnFtBpZpWwpFdAMIvQ?=
 =?us-ascii?Q?swkDl5tEycq69LEPdZIRqeu8vxicdxNgTwRzKZK4YQt3dqAMzWus96Ht/RDd?=
 =?us-ascii?Q?tctjvb9ghI+0EvH/CneaEjBzxM5rdjKYwzXTJTUx0JmjVO3C700sF/RKRx39?=
 =?us-ascii?Q?4qtWWB6LMrYlIbLK6CFEtZ1Pt652XTGM20ZC71AYmlEeTUHmHbfi9rx/86jz?=
 =?us-ascii?Q?tC80Jz8yikh066+PyfEdSQh6eeQKnWcsy+tfMzEUJgWGDTGe1FWCjnwLbP5S?=
 =?us-ascii?Q?WfjWQ1eiYJLShwfOkHM5txFg/5ziQFjyT+7n5CEi/WzLzDHW7CtfuuDIDKE9?=
 =?us-ascii?Q?A62UfOyU+Vxy8l6WboJwmEndJ6j5WXhEqXpduq3DgHgaH/EPn0PZOA7h+fqQ?=
 =?us-ascii?Q?N9ev2i/333b7tO1m44Ni3WQLupeFSC1Z5vQcGfcPEgJl8rYDnWNXfi6UlNnH?=
 =?us-ascii?Q?myiqQLBtdcy2UE/SKeRFjI+IOIFYgDr692T9WKu/VdN24Ulj6vbOnBqRG3bD?=
 =?us-ascii?Q?Gph2y3v2asrK2FaB4MUoETJEIz8MtqkUfeV1gDW8mWmptcw06xlMGYXsGEP/?=
 =?us-ascii?Q?cwW/+c43WASOOkjhdUTATEY9FcKIUTZOonQQ8uOn67ZoStFVtP9m/ILGJsLC?=
 =?us-ascii?Q?HS14ZRq1S27Q2tyZ7T6Havn96KodvbCmtetWnN3+5pYe2se5Jo5qCynO4rU5?=
 =?us-ascii?Q?A5bsfltVZO0KJD5GmIW9uMhXkwmZBKQShv3VxW4qi6Lp7O7HaWvebn1rCV+G?=
 =?us-ascii?Q?Xl9r91BNhYwweodO8VcDHH/l11/ghK3R7VhK3LJx5OAE+/TF9nkgljvr+WVp?=
 =?us-ascii?Q?9BsGH7xv/j6LOm8iwg47EuEdnD/qjfVod++eE0ZGvsdIW1VMF4jmmPw5h4gD?=
 =?us-ascii?Q?rv86tM299Xh7hUeYEqvDtOcyXh+StuGstBox2fH4eE2+W9HqzrN2bPJFMKkE?=
 =?us-ascii?Q?icKFcgz+57YVPkUQrkD35s2lTPCANtdMVTH+Y35L2QNwuczw1d1nK0LzX17w?=
 =?us-ascii?Q?a8jsaBtwVnoNFICGM3LvU/A15riFFF4xOReZd2nF/NNRiNvUWKdHGeDgIjFK?=
 =?us-ascii?Q?RIZPxnz46SmAv1oawBQi/pe2gXJDe6GNNRtYdGamEM43rTQCVzsp1LLTBcCo?=
 =?us-ascii?Q?AYbyoomulq7g0vNdmLIQjmLmtfhu6+A05u1ci7P/9yVG0//Xbw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9C+G/ABJ2L3MPQdwzDkoSHoPD97joTakd+M7Gsx0hq/btdzE6EnJwhaGyeiY?=
 =?us-ascii?Q?Jvw8KB7vDiECcIl4KfQSZkvTeddmZVkadcKiqHc2D3T1N2STjPGlUW4M2SLY?=
 =?us-ascii?Q?AtxJDuJaFTu0J25EW+DQIBLN37WbI8dngg0YqzF2CkQsYgdHu+90YuvVNzwB?=
 =?us-ascii?Q?eo4TTHN4Zg0u8C0ow6pZE3eQp+rw/0fotiTC8Gv9vzTJrH3/vnwsI6356fk9?=
 =?us-ascii?Q?+kb0BU2OkFkBYtqidsgdBzlT2JS6Can91hyl+2yt6ELXFwwXu+tlEUQM9/t3?=
 =?us-ascii?Q?QDICStfOtng+hxmkzfu6H1Bp56TAIfSoHUgHbJAh18ulvj6fYzPd4lQjo1pl?=
 =?us-ascii?Q?r0A/Qct7kWoO3EBKCa5vVwr1OME8WpKHEthuOrpBU+AS+rD6d9WILyrwK4od?=
 =?us-ascii?Q?s8IP9AIc5yVqQZ6hQ0o5I2bXwfJaeaTal9zP8vmtsyVUjpP+10xhuxG+TzUP?=
 =?us-ascii?Q?bw8P8FtS97JNNrg0ZV9MaSw8ej0DvgtwZMZGZlfxyYETiozCAKWrLz+ixZKT?=
 =?us-ascii?Q?V+tAJVZIhdZmPU3/tfS2yNzaEUIoSyFmCKocWkacNTkBxn2wixXHGkNYVy0n?=
 =?us-ascii?Q?gvn/X2RXvdochXomJyv5VGLmXHpz3v7fgrh3TERR2MsqB9VJkBVOtmfXZMR0?=
 =?us-ascii?Q?nspgD1lyVp2eXju5t7ycsQE7CidOoqmoMEW2CJ86AinMziRAotvQtq8bwhIm?=
 =?us-ascii?Q?eLZZfGDugwD1hTnBKNytvAwi9Rz5/X6910u0pxacaS60Cs8UrIJOyKOUAje3?=
 =?us-ascii?Q?N3SrJ/pvx8qDQNDVtGrlQGF6l7VHzl1wvE3TH/IMnWwU76RhBtwuzm2yl9ZI?=
 =?us-ascii?Q?TTwYhJud/KtV1kO7thUPvCyCjRvxib/m3qQrHAeEuOr2mfJlGZ6fxRsjqAdf?=
 =?us-ascii?Q?qPIOeiwVTqXZtt0v9IS2K6VqHdyCOeAuluuBPsXDlxnM0hBYswa7TYDr7l0T?=
 =?us-ascii?Q?318tDQqIl12tJlLZvj/pAa3Yu0Kws4tPuvXoZNipqGRBkjiz1c7hzBQLgeNq?=
 =?us-ascii?Q?5/XlnKNtEFlrD/Bod3B51vw9paTsYT2vSyuW3C9wCCaO0Ebp7WpKc0Q6TWLf?=
 =?us-ascii?Q?+cVb89+qf+SaxJUMsBuKWxcR7mG1PIMmlr2NAr0XK5K4vh+E5QgL9v5nxbAK?=
 =?us-ascii?Q?XoKPNnEr8n1TsWKWcfR2MmQ/j91bo4ybDSPjLdcMaEgSHghshcXbsgShYAZJ?=
 =?us-ascii?Q?8BQovE58jE9QvXah8dKzBhE82udLlc15O1ZpF1dUCVdQmQgzROA7S/9vQ7au?=
 =?us-ascii?Q?o07xinaL45VCbJRDv653NYcWP4OwsRrFcji3pYtc8zfedKdTFDjqpD8S/5YE?=
 =?us-ascii?Q?UU6ws/G8PFU6kF++kaHmVemp0GIzzklX/UkxrZF+IVgeQBHBGOW9Ka4VXlRv?=
 =?us-ascii?Q?fIxq4mlCPnxIvJZmCXkFY6BWqHxp88zdRQuc1XsQ0FVUwDVjtqZi7ZWmE2Ra?=
 =?us-ascii?Q?38WNQFG3sug8SA63QcnEMKpOA91Y5mDDQrGSnlRlNdz3ezbvqYDEMqk7nUPS?=
 =?us-ascii?Q?kEby4LkZQO2fSlJ1TBAry0CHmy/B6/+VMUHgWReO5Z6oxQ7vALBaZqci7Rb3?=
 =?us-ascii?Q?1fPfVFHzTfYKgeATjS1UTsGh3jzMvlu8TP/1RwQw5gQCvRNYVBtQOotLpiDf?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4ZHgjrgmIMYcoxF9Sow2rpt9MXrMuCJ2epEafe/1WTexc7HITxCUXLCalohp60vUgbfB1T7JSzcjBDwp11eGbqMZCJT0DGJYDjX6hosX5gTaa2XLa6rFX6N8BP4OK7OvmQoH1pT4jSsOL8BkKCZctgIUAWhbcv00SKSsEiFWeL0oBefve+imYBUD9Myk3sdVy+XsTJw20GfDTZ1aU0a503eA6pVgTcogKCqzGwLl61F0iQ02l1aII4pS7+EqJK1WmjKEkfwnI0xGvdJdy5Ksnl/bzroETy5vNuryNNEC3EH9lpuoYxNVnKEZfyIp2ydj+wt/R5WWxYBN3GlRZ5UBOEVU8vPNy8Tak5rr/QNQd95O/lV8KYP45z7t1MMOdvhGnOEs/nBfmoJpoUvZNqpLCXfugqIS5nEaWrbIL/LVgFNoz3DZp5LXoddqeXKfEgERCH3JNM9jzAYJbzRSa7wKlPrvmsgl6mPc0E4lbBo6USRbxrUYxpota2BD90DrHv0uVlZ8+LzGhbx5wx6L2i3iv1Ka2ACsXF5f87xtNBdaUTvgOqzJwVXTW02uj4yee+eUjLS8JA8XrRRkUnkwQt6HVTg1eT87YelTmjb8LcS9Rak=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 888120f6-b9f1-4a8f-3d6d-08ddb2fc6d25
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 08:52:18.9704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3lNai0wyRiZxXX5RD2dk1R4kLT2CGm0GskSAdQEdjw/Zy5UEm8X/YRAl44SbSAdseCVW1U+dv89fjXy4hWo/F10SGq8RqsNfDu2qQtNrNKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF8EEA8AA65
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 mlxlogscore=820
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506240075
X-Proofpoint-GUID: RClmYEudgTZ__bkNscVGJ4sHX4YqkSoS
X-Proofpoint-ORIG-GUID: RClmYEudgTZ__bkNscVGJ4sHX4YqkSoS
X-Authority-Analysis: v=2.4 cv=cpebk04i c=1 sm=1 tr=0 ts=685a6746 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=FYackiRVtrMnOlXGipkA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14714
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA3NSBTYWx0ZWRfX3/Mzd6i2YDBw JQBXpnoPSyHMKOF1wGzjUwC3EGtsi0wsGhYfzC5He57FkRpIVNe1H75A/y+taA8O5WNY8M4LoVy SawCAoAG8NL1a8avbSJriPSKqktmUHhCrEARe00UOlTBRVgw4OZLW4GItoGvbw9vmFI3TcXN+g4
 NgUC+BndCCh/41lojXctkdaZNkTRm/gaKaF6j+HAza9tNdHHHQl9nYEKyOuzJNxFnHQDZRz/ZQ2 2Cs0dBfnwQZzH3UUypQ+oGVnJu2s1p4rol1yeklhikeDgkUmBzYsn7itDzWfLJ9/1rQ065qUbgm rwo0X8Q64lA3CSsGdHrTIna0DTdOKEzBevgR216lOWPVH9xQW89dvrH20DJythI6GHY23dhJmxR
 DOi+dXPrGKNexvM3l+lC3bTgVrpPLRQdQcgg9ux3LDlJaQFZAGR5lH8EaPzRBt27ueyDILxX

On Tue, Jun 24, 2025 at 10:12:20AM +0200, Vlastimil Babka wrote:
> On 6/23/25 19:13, Lorenzo Stoakes wrote:
> >> +{
> >> +	struct mm_struct *mm = current->mm;
> >> +	const char __user *uname;
> >> +	struct anon_vma_name *anon_name = NULL;
> >> +	int error;
> >> +
> >> +	switch (opt) {
> >> +	case PR_SET_VMA_ANON_NAME:
> >
> > So I'd like to copy just the below over to madvise - we can decide to move stuff
> > around _later_ since it's really weird to have all the anon_vma_name stuff live
> > in madvise (apart from the stuff in include/linux/mm-inline.h obv) - but I think
> > that can be a follow-up patch.
>
> Sounds good, will try to come up with a name for that function then :)

I'd say set_anon_vma_name() is best, there's no need to mention that it's
madvise as y'know that's an mm internall and weird impl deail.

Also I guess we can keep madvise_set_anon_name() the same, even though
it'll be static now as it's in line with the weird convention of prefixing
things with madvise_ even though they're in madvise.c so, y'know, kinda
implied that they're related to madvise haha

>
> > I'd like to then split out bits and pieces to make this less yucky too.
> >
> > Maybe add anon_vma_name_from_user() grabbing the characters, doing the
> > strndup_user() etc., have it call a new anon_vma_name_validate() static function
> > which does the is_valid_name_char() check against all chars, etc.
>
> Right, I'm fine leaving the followup cleanups to someone else again. My
> biggest bother was patch 1 anyway :)

Yeah of course, incremental steps are valuable here, makes the next
person's life easier :)

>
> Thanks!
>

Thanks for doing this cleanup it's a big improvement!

Cheers, Lorenzo
