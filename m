Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FCD27F75A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 10:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749204222; cv=fail; b=JG71FkvGEi/Cb2fF8d3I9lgnKzjLi2XgYVS/hP4pEs2xTraegzq0YLMMFIYnZmC3VSLMs17759fMhY0fvcOBIkzycSaJZVvsEsdom0oB6BUGXMFw38WbjWYHuemJwQ77PWUtQberkL8tX+076UI9idbAO2FgGD7qepfv648yI/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749204222; c=relaxed/simple;
	bh=n+xupnBD7cQ5TZCGvnZ7Lxa3A2siHm2xxAp7oMSUOHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Owc5wVkqeVBHEduqMv02X8MwvFmllQBRgmAR1xw37aDS/lOhQ37QBqMeyJzBQpyQpRr1BeZZduAyqn6+gaacw8nQWgnB6Ruotfgojewn4O5MNXhasRFWstTLxhilSfyMCsajL7kzr7Mh8XUfGC2RT7zNv0l7T91zPqAP9uLyoS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IpIAdLhI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=f4mIjhXg; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IpIAdLhI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="f4mIjhXg"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565NG2O011382;
	Fri, 6 Jun 2025 10:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Jj+2RbZthBBqCc/VyY
	6kJCF9irffaBJjy0DOCj9k1+g=; b=IpIAdLhIb8+ohlJlKZiZlkWUcURndbQeZ4
	Rf8UtsffrHDpWATdrcHdY/JoAoTnQ8JD4eLluaFmDk/9KmaBwlKnXfd59pgv9qDh
	zqfKEMopHyqHMPLkRz6nNRzVua1uFHll1CXMUqCggZ44Ik6dv4PeF+j97aYmjqd0
	dUnX7QMe2EQ1Wb/jnX93YpIG5ai7eCvOjgy9iYUMvc2iMNBuI/ssNMyP/U2oo6al
	kBX5xSrQroz80rm72S0EvsudsDoe9X6y0wfRKU9biff57J+NK/dmedQdSO91Jwne
	zUd84YLfeks09MEFP30TSDP+P9q367het1rzW/V7zjDGuKtk5R7w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471gwhfk27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 10:03:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5568ZAVi030643;
	Fri, 6 Jun 2025 10:03:17 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013015.outbound.protection.outlook.com [40.107.201.15])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7d44t7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 10:03:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jgUHM5kTrok3j1fvFy+pXIgzrZC6gi+HUrwTpxiS0kpSYP2pq9RadkyGEo3RWytSjI0WS7wDSztdWhpYsf6JChJGZ16POCMlx9cfHXpj21LpGYnfD0u99y62QyB1xaEzn6aRZDfllF98evWiwdbAaPZuv2rq50NrPdX56fe8WmBy1CuIByk41FEZ03EDL0R6i2aFoct+F3dw0x+L8wQ91wUKHNC2QJ67BCQqrlPM3OZMZWzRmkOjPRh39qvud89vnmwzk3n2IJogs+x0HBOgh6Z01Ebyey9lTRB/Tn0Sw4327n18HuVb/euGcx/2yCTauYNkdqiKwPZQsIZgUm1uYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jj+2RbZthBBqCc/VyY6kJCF9irffaBJjy0DOCj9k1+g=;
 b=TAOHVk+9LuZVdhN7KDdmeo1x7FzH1oR/ew9qA5Wpfd/CdXU7Y+PQY8Ggs41kwNM8ktBlRXolL4vWyXB36sBqPF5cRouA+WHQsj+p/4GigUMaYaDsz/6XtlkLfRTO7DCQn87X336f/3UkfQ6EJ11AZ3VvjG9uKSpfGJqVI0RnpvBNI8KV3wQEA8DbQGzim9B38M79YWfyNRaxKl8esW/0K5qlOsGkHIux4swXrhfFdrPV5wnM/L/HIOAwd5u0XnZ9RBSgNRDkaV8JxiDMk/CEe4S4jgDTgBIsCl5MKVVs5H6D6CIAgXpn3Y1q46szbgJ0RmdK3pbVM9i6MPO4vcTTMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jj+2RbZthBBqCc/VyY6kJCF9irffaBJjy0DOCj9k1+g=;
 b=f4mIjhXgxerCO58+W6870WlMVN95oRYSpkQeG4YUAvqmapXc9ARAvB31bx+gNz65zqzO3kDtCvl3xXKVnKoSkKX9uu21DuIVwNEccU12pQ/jMlO/Nlsr50Ouf2rBk0T9BfXCaZ3KjCdDe4B2kbmHDfO7oNTySLmRhANl1vzbo5E=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by SN4PR10MB5624.namprd10.prod.outlook.com (2603:10b6:806:20b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Fri, 6 Jun
 2025 10:03:01 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8813.018; Fri, 6 Jun 2025
 10:03:01 +0000
Date: Fri, 6 Jun 2025 11:02:58 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, catalin.marinas@arm.com,
        will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
        rppt@kernel.org, surenb@google.com, mhocko@suse.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        suzuki.poulose@arm.com, steven.price@arm.com, gshan@redhat.com,
        linux-arm-kernel@lists.infradead.org, Jann Horn <jannh@google.com>,
        Yang Shi <yang@os.amperecomputing.com>,
        Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH 1/3] mm: Allow pagewalk without locks
Message-ID: <0b2cf458-4e5f-4ab3-bdd5-82cec8f0aec7@lucifer.local>
References: <20250530090407.19237-1-dev.jain@arm.com>
 <20250530090407.19237-2-dev.jain@arm.com>
 <6a60c052-9935-489e-a38e-1b03a1a79155@lucifer.local>
 <ecfed817-105d-487f-80ba-52965f926c1e@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecfed817-105d-487f-80ba-52965f926c1e@arm.com>
X-ClientProxiedBy: LO4P123CA0365.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::10) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|SN4PR10MB5624:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cf9fac8-a2a2-4734-024f-08dda4e15223
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GtELHw4GxEOVKCK7dGZzAB7yh+LlZnldItvnZN1qoyjj1gphIFubc9uEs7Gz?=
 =?us-ascii?Q?iIZzImftAWh9na0P9paBNkOBZfTuheSMjAIm7aepDfH2JofVDOP1yqATRCjx?=
 =?us-ascii?Q?Z/B0iRfRSSQJIL+e3fflBFY/kAOeT/T8sB6+P6JrI3+tE69Q8NpjCRARlFnb?=
 =?us-ascii?Q?XHOMoHdLQAamvsPALbxMhsOla++ARfQ45yxJOqus5CulKwAGsi7ICjuxmySg?=
 =?us-ascii?Q?/8LZDzXU1dQnk75koWYeSFHZXiLDyJY5keYiAN+kgRYZ3WhDsb0njX7tpZlH?=
 =?us-ascii?Q?oFGS4ytzxs1iliIueKvIirtiBzY1vOGBsL75FUv2/aufIjlamQ3lEDwXD11L?=
 =?us-ascii?Q?P/8FqF8JXrn8+ycg4Mn0NaqnUgHqCF+HpH6X/uuS7Iajb9tY1ZLpZK2A8F7n?=
 =?us-ascii?Q?BecOtVoHwJIpdBhwoowLU9O8jeb634muuww/zp5oSZd9ImLTS/vuzoEL7mm3?=
 =?us-ascii?Q?y+jIk513mksbK7oKmNF6/T9NhaS1PxKKtDYIuM9DAQxw1J11XcEUfyoCjvfj?=
 =?us-ascii?Q?S7QFMa0kpH2cVRsgeIdmTfdkN0l0jJ4k6zVrmyRYKMc5DrLshhUw+CSTgRdr?=
 =?us-ascii?Q?BmOwafCY883dyAx/YvYTwJvccXCu1ne7bvfP+Zbwibvixl5R180Iot/wr7OF?=
 =?us-ascii?Q?LSCNiKatxlqGaCZ2rpnKITeHn2URU7WJFjy7t4+C8aeBvnhL6oUx8G2LG+kj?=
 =?us-ascii?Q?4np766VDzHKP8Psqn298KD5rviOyjk6ZtauUYUqPhQVMofZUNSOKEl9JYBlX?=
 =?us-ascii?Q?raaL5x8x3PP0hJSxJFKBHmvNsTECNRw+6nyeD6pomHKHySUCZxONXbsY2eig?=
 =?us-ascii?Q?HLgIHXAzRUmnjpJYOKPAd9GmQX5hX2QmPasFMIZHHDUGCjlJZPa2Ee6gb+uo?=
 =?us-ascii?Q?2TPKPiTN1usq8iAZfxUgdzn6Y5TVVFqi9UiEWzswDzElJiCQ9a6rpV0Lk6v1?=
 =?us-ascii?Q?LYbhCVK6zovao9WSu7xMqmQ7l5YHXFnRwHLJ+lhtcUXZzBiBOYIAEiHRKI9I?=
 =?us-ascii?Q?OZbFV64YEDTN5J7TxcOD8hBxAfr3SQQsFZ4F5xIlaiNmaASxW8AYOUo8f95H?=
 =?us-ascii?Q?gj6uJ79+HITmlLDrB5WF4brXS3OKuRwo4/uJulIfJsC4SihAUaq2ZRh/qMFP?=
 =?us-ascii?Q?0o4R5U51wTXGVBWqNQWMWlkE4rViNhhk+pZR45FPsenKHwjSXv3V6KTGHH1r?=
 =?us-ascii?Q?si6n7EHkYT6e9nFbGmNDqpU8Td+eGHO57c7HdNGqoXn3xiS+IaJkQc4DDgXJ?=
 =?us-ascii?Q?vAHssF/fIMf73hEZ9r5PDeB/YLPeki94Jk4ye7LodGsVxUiG7M3XRciKSbEO?=
 =?us-ascii?Q?6VBZRV+3O/vUKOJ0d8gd/jM+GOrIj7ypBHNgWVeuKZ/11PBi9rT9PT7143Ks?=
 =?us-ascii?Q?GRHeNIyLbF6CGpCfeKlJ5kpEZ/8nHacy+3aIKR0VP6wk04PD68eTCGBCKv+6?=
 =?us-ascii?Q?UMAqGBHHHRRbXyPNJw41x6ife3kN0IhA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dLnNM6/mOe9H/E7qbN9UVFqoTRh/adWiME/c7kvnC1T+5D1U+o+1c6RMMafB?=
 =?us-ascii?Q?Rzme5xEs8TGDo5Eoi3t0cUqz2L1UPxp0Iwdy/oEmjz07wTRz8RtktKm/7McN?=
 =?us-ascii?Q?B9tGoM1XiNLfpWnxqXKaN18CGrZjetrv6xkW9ZxZCywDpwic43U7bKIqTBUn?=
 =?us-ascii?Q?pIy37xe1l5Hqxq+sdwGbnZh9PnpNlWErt6dMJlL6ECp8Sb7bqPBRUCN8M5v7?=
 =?us-ascii?Q?BQCzBM92MH0+xyPDmGr6RezBjSSeKfhiKAFzdJH1wVaSpRfNM3o2Ta54HpP2?=
 =?us-ascii?Q?G1omi70F5wVjK7g2tC0fNS3DVF79n9GGOZ+R41YfrJKZmu9N3rOvB8AFQDzX?=
 =?us-ascii?Q?2LB4ge9fHKUlTeb/Y0dHWAUz0YQUqntn2c2IRRxSQ9szF3WoTY0fqqnjXppT?=
 =?us-ascii?Q?lSbd21W0/kE8PrF8YDDXlkp3bnu6BGca7T08RgFSBbhOXaUM0f6xwCJ7KgKL?=
 =?us-ascii?Q?t9FeIR6teLnpYcSqIGRvsui2mIAnaBqFn3/zjOkhKe7AO2gUY2HaoGfGcaIK?=
 =?us-ascii?Q?am2VFbjvK+8gx43cTSA9m1AgVeEAwuOsmFLDlLBsAaXL4uJnYOsgDWyuo+fn?=
 =?us-ascii?Q?kD5QLjws2t6Ef3viUJcue9J6jhSRzVNpfKSgH3plbwtGlToE7isRcHPDwAvh?=
 =?us-ascii?Q?V8VF1dH68BayZakU7UdQL3ltd8+M6u1iKgaAvBxxh/i1RrMSe8tUInUZhBZq?=
 =?us-ascii?Q?qKY8Di1pI1LL1ZEDWEf8nVyvoXp6b911e62lYYbl+83WKeDGt4a6uSnr1ep0?=
 =?us-ascii?Q?coMb8LXvQBKgR55m/VETmMUaGsSyjO3mRLljVAgTRgitLcQ/vErPsYIZv8Td?=
 =?us-ascii?Q?hgkBxppE0htLVAOxGheUDH0JH8pa6arZIX/4bJ/8EkA1w/MfVUTBQD8u2lao?=
 =?us-ascii?Q?/eAYANFfHJs16ZgeesOcOoQyB3gyjDVd7nO7/ZhXYDaPYjjv/p+5DTj8rtUY?=
 =?us-ascii?Q?uH4umR99/heGWvXZnQ/D7nI/3/grL//ZcGZtv80xPwKHGhu33GHjIob3RxhE?=
 =?us-ascii?Q?P6/n7BR7MOHOUf56KYkeUxv7nKUQuUkucoF6BHf4zj16xBA/zx3LzMdPkRXq?=
 =?us-ascii?Q?PD8lOtmf1SeQ/xtv6rzbYuiIg7Zo0uAmZiyYARLO0VrO4JKgC6mPTWmZjKcH?=
 =?us-ascii?Q?e9wWHNPMLgAHv/p0I1ernL5VOBH7JrT0jYOcQnSCBSDM3klqtm9OyCWdXcHe?=
 =?us-ascii?Q?XK+T0mEtFbcErsLco2y+Icvi5EwBbpGHsV527b9gzkj2RRQImNNQTmrTwU3u?=
 =?us-ascii?Q?DjrN7ma31Hw9cdnLThW86Xh3pADu7EtRszxPd2Vl0uszkoXZRAwtJumFpKOe?=
 =?us-ascii?Q?njVne87o9vhiZM7Lm2NsDSR/1xl4ZNX/KX9dEB3k9qezgFenJdZysH6ASD91?=
 =?us-ascii?Q?8QXz0gGwOycVhd4eogxtuyWNUZ+LyuGdQzfG/CScfTuXEiqA4r99iVYi44cJ?=
 =?us-ascii?Q?ZBZCBzJsMVIHqSsWtIklRrRWnYVRcAI4lXWa3+haxxw1Id81buzMpndjpS02?=
 =?us-ascii?Q?tmbbJzp7GFT9ng9W6y32LVcfaOgc7/zmHQ95eZJ/aEfbwiFSOCNvpt8zrKqL?=
 =?us-ascii?Q?FF5xMUziuZDoUerc3h0SwjNlqsX4RfotJqqeKAxdYAtpMfwKSyLneAAzfKMc?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7SUrae/+fdqEGXipPrIC2rPRV2BxZXalsxWK3l0BEGojr++QVPLUS7Mr/LVFDXpLV+Epuj/G1jeRYlwcPuz4eY4ryLxqaG+xdMJ2sm42r9sCDHYABwd70JJvcsVus4w+L6Q12vm4C0q7/PNVCDAtBMEUdeefyec7jJKB6V1rfvarTDw4wIsMe353kCRwqwk/uy4eWwVW80/WTgWK3kxyx0iAZ0AZjfsXobE59PIlFAvR/npypkpdenRXMM5yQw09192EH344sv9d5cGOj1ETRjwmji8L/67iNS6kolANr0n46xl2nUhs+Lrf7CTs/pXnIbRJdm85Z2DQmDnPhhfAoIzaIBejaLvR6ddEt+v9VVsQ7Et7/y4VVDqjqfwyC1V5cCk6WEgnTpbrLoH6EqjjBwhioukX+qafMOFDYIlkMLiZKSwPl9Xy+QLcBu6jNEXYtZHznzPz9MD7dWTju6DuRRvTA8IzykxpUQ8Eb1zjQxI8jcyP6Soc8y1gW4mQj0nkW5+lMJBiKPS/tl2pmRdSjYIiGlCg1Qi+UGflMdhpyr1yTQ5tpKgMlz4RJwbslOha3qkY79QT5mOBRo+Wm0C4YivD0pZMkG0wlUMUGxsRF+g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf9fac8-a2a2-4734-024f-08dda4e15223
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 10:03:01.2923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2furwG2GVLBDqoHaFzeRyoPLT0+z+1TkHF63Rc0TTPF35D832SlpRLlzcGA4TczGx1t/WdA0FrKOnpFjVd4WMjqbhzLfSuz7kllqkflqiVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5624
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506060092
X-Authority-Analysis: v=2.4 cv=Wu0rMcfv c=1 sm=1 tr=0 ts=6842bce7 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=7qp52ovlw9--blVHXKAA:9 a=CjuIK1q_8ugA:10 a=PG6Q-FFm6skA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:14714
X-Proofpoint-GUID: dawVMZ30N4P_P_YcfFhkNlPLb3u7wkE1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA5MiBTYWx0ZWRfX1ZHUjNHwOScl B5ZFrbmIvzQ3k8Xma2md0/jzijIFdhif0QrOlC0TaSBqe3Bmz4xhPLSnLpA7MBmt0ouK4IC/9A9 l0JB/Hcb4wCxFcwwTj9U+JxCO/9h3JABPtr/7b0Li94J1gOH3piE+Ck+WgN1yrhE/o8uw52pK3g
 doGf//0qs5m1fWVWEYsNDUvv2VIQh3VhDYptg9wy8q6QXIH5h54QwfI5XXmTOXTMDv7ghml8AKg x2IHDGSgrVt7BXWyduQ6QvFJegrw5cSNt6f7Zi6o7x9Eh6Ps+7BOak9/o3OKOKQcRCs3q7OMDez 5JWQz/IqJ6I+ro3TUzjjiToxY3zBVPhbMpWyFGKrwJqgLH2nhcssi0ARbN/N7co+rF8KSgzmK8+
 dE1p72iv/rW82omJIn0L/3EOJkyU0gC5HDRUTu+BVZvu4i20EtSQVB7IeqiHmiwAmkgXCfXr
X-Proofpoint-ORIG-GUID: dawVMZ30N4P_P_YcfFhkNlPLb3u7wkE1

(One thing to note here is that I have refactored this walk_page_range_novma()
function so the kernel equivalent is now walk_kernel_page_table_range().)

Overall, I'm questioning doing this in the walker code at all.

The use of mmap locks for kernel mappings is essentially a convention among
callers, it's not something that is actually required for kernel page table
mappings.

And now we're introducing a new mode where we say 'ok that convention is
out the window, we won't assert anything'.

Not sure I want to add yet another way you can use the kernel walker code here,
not at least until I can unravel the mess of why we're even using these locks at
all.

Strikes me that init_mm.mmap_lock is just being used as a convenient mutual
exclusion for all other callers.

So as per my (new :P) comment to 2/3, maybe we should just fix apply_to_range()
no?

David - any thoughts here?

On Fri, Jun 06, 2025 at 02:51:48PM +0530, Dev Jain wrote:
>
> On 30/05/25 4:27 pm, Lorenzo Stoakes wrote:
> > +cc Jan for page table stuff.
> >
> > On Fri, May 30, 2025 at 02:34:05PM +0530, Dev Jain wrote:
> > > It is noted at [1] that KFENCE can manipulate kernel pgtable entries during
> > > softirqs. It does this by calling set_memory_valid() -> __change_memory_common().
> > > This being a non-sleepable context, we cannot take the init_mm mmap lock.
> > > Therefore, add PGWALK_NOLOCK to enable walk_page_range_novma() usage without
> > > locks.
> > Hm This is worrying.
> >
> > You're unconditionally making it possible for dangerous usage here - to
> > walk page tables without a lock.
> >
> > We need to assert this is only being used in a context where this makes
> > sense, e.g. a no VMA range under the right circumstances.
> >
> > At the very least we need asserts that we are in a circumstance where this
> > is permitted.
> >
> > For VMAs, you must keep the VMA stable, which requires a VMA read lock at
> > minimum.
> >
> > See
> > https://origin.kernel.org/doc/html/latest/mm/process_addrs.html#page-tables
> > for details where these requirements are documented.
> >
> > I also think we should update this documentation to cover off this non-VMA
> > task context stuff. I can perhaps do this so as not to egregiously add
> > workload to this series :)
> >
> > Also, again this commit message is not enough for such a major change to
> > core mm stuff. I think you need to underline that - in non-task context -
> > you are safe to manipulate _kernel_ mappings, having precluded KFENCE as a
> > concern.
>
> Sorry for late reply, after your comments I had to really go and understand
> kernel pagetable walking properly by reading your process_addrs documentation
> and reading the code, so that I could prepare an answer and improve my
> understanding, thanks for your review!

Of course, that's fine, it's all super confusing, and continues to be so... :)

>
> How does the below comment above PGWALK_NOLOCK look?
>
> "Walk without any lock. Use of this is only meant for the
>  case where there is no underlying VMA, and the user has
>  exclusive control over the range, guaranteeing no concurrent
>  access. For example, changing permissions of vmalloc objects."
>

OK so now I think I understand better... this seems to wholly be about unwinding
the convention in this walker code that an mmap lock be taken on init_mm because
you have a context where that doesn't work.

Yeah, even more inclined to say no to this now.

Or if we absolutely cannot do this in apply_to_range(), then we should
explicitly have a function for this, like:

/*
 * Does not assert any locks have been taken. You must absolutely be certain
 * that appropriate locks are held.
 */
int walk_kernel_page_table_range_unlocked(unsigned long start, unsigned long end,
		const struct mm_walk_ops *ops, pgd_t *pgd, void *private);

An alternative would be to have a new parameter that specifies locking to
walk_kerenl_page_table_range(), but I'd rather not have to churn up all the
callers yet again :)

> and the patch description can be modified as
> "
> It is noted at [1] that KFENCE can manipulate kernel pgtable entries during
> softirqs. It does this by calling set_memory_valid() -> __change_memory_common().
> This being a non-sleepable context, we cannot take the init_mm mmap lock.
> Therefore, add PGWALK_NOLOCK to enable walk_page_range_novma() usage without
> locks.
> Currently, apply_to_page_range is being used by __change_memory_common()
> to change permissions over a range of vmalloc space, without any locking.
> Patch 2 in this series shifts to the usage of walk_page_range_novma(), hence
> this patch is needed. We do not need any locks because the vmalloc object
> has exclusive access to the range, i.e two vmalloc objects do not share
> the same physical address.
> "

Thanks for expanding, but this sort of dives into the KFENCE thing without
explaining why or the context or what it relates to. It's like diving into the
ocean to look for an oyster but never mentioning the oyster and only talking
about your wet suit :P

>
>
> >
> > > [1] https://lore.kernel.org/linux-arm-kernel/89d0ad18-4772-4d8f-ae8a-7c48d26a927e@arm.com/
> > Basically expand upon this information.
> >
> > Basically the commit message refers to your usage, but describes a patch
> > that makes it possible to do unlocked page table walks.
> >
> > As I get into below, no pun intended, but this needs to be _locked down_
> > heavily.
> >
> > - Only walk_page_range_novma() should allow it. All other functions should
> >    return -EINVAL if this is set.
>
> Sure.
>
> >
> > - walk_page_range_novma() should assert we're in the appropriate context
> >    where this is feasible.
>
> There should be two conditions: that the mm is init_mm, and the start address
> belongs to the vmalloc (or module) space. I am a little nervous about the second. On searching
> throughout the codebase, I could find only vmalloc and module addresses getting
> modified through set_memory_* API, but I couldn't prove that all such usages
> are being done on vmalloc/module addresses.

Hmm, yeah that's concerning.

>
> >
> > - Comments should be updated accordingly.
> >
> > - We should assert (at least CONFIG_DEBUG_VM asserts) in every place that
> >    checks for a VMA that we are not in this lock mode, since this is
> >    disallowed.
> >
> > > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > > ---
> > >   include/linux/pagewalk.h |  2 ++
> > >   mm/pagewalk.c            | 12 ++++++++----
> > >   2 files changed, 10 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
> > > index 9700a29f8afb..9bc8853ed3de 100644
> > > --- a/include/linux/pagewalk.h
> > > +++ b/include/linux/pagewalk.h
> > > @@ -14,6 +14,8 @@ enum page_walk_lock {
> > >   	PGWALK_WRLOCK = 1,
> > >   	/* vma is expected to be already write-locked during the walk */
> > >   	PGWALK_WRLOCK_VERIFY = 2,
> > > +	/* no lock is needed */
> > > +	PGWALK_NOLOCK = 3,
> > I'd prefer something very explicitly documenting that, at the very least, this
> > can only be used for non-VMA cases.
> >
> > It's hard to think of a name here, but the comment should be explicit as to
> > under what circumstances this is allowed.
> >
> > >   };
> > >
> > >   /**
> > > diff --git a/mm/pagewalk.c b/mm/pagewalk.c
> > > index e478777c86e1..9657cf4664b2 100644
> > > --- a/mm/pagewalk.c
> > > +++ b/mm/pagewalk.c
> > > @@ -440,6 +440,8 @@ static inline void process_vma_walk_lock(struct vm_area_struct *vma,
> > >   	case PGWALK_RDLOCK:
> > >   		/* PGWALK_RDLOCK is handled by process_mm_walk_lock */
> > >   		break;
> > > +	default:
> > > +		break;
> > Please no 'default' here, we want to be explicit and cover all cases.
>
> Sure.
>
> >
> > And surely, since you're explicitly only allowing this for non-VMA ranges, this
> > should be a WARN_ON_ONCE() or something?
>
> Sounds good, maybe a WARN_ON_ONCE(vma)?
>
> >
> > >   	}
> > >   #endif
> > >   }
> > > @@ -640,10 +642,12 @@ int walk_page_range_novma(struct mm_struct *mm, unsigned long start,
> > >   	 * specified address range from being freed. The caller should take
> > >   	 * other actions to prevent this race.
> > >   	 */
> > All functions other than this should explicitly disallow this locking mode
> > with -EINVAL checks. I do not want to see this locking mode made available
> > in a broken context.
> >
> > The full comment:
> >
> > 	/*
> > 	 * 1) For walking the user virtual address space:
> > 	 *
> > 	 * The mmap lock protects the page walker from changes to the page
> > 	 * tables during the walk.  However a read lock is insufficient to
> > 	 * protect those areas which don't have a VMA as munmap() detaches
> > 	 * the VMAs before downgrading to a read lock and actually tearing
> > 	 * down PTEs/page tables. In which case, the mmap write lock should
> > 	 * be hold.
> > 	 *
> > 	 * 2) For walking the kernel virtual address space:
> > 	 *
> > 	 * The kernel intermediate page tables usually do not be freed, so
> > 	 * the mmap map read lock is sufficient. But there are some exceptions.
> > 	 * E.g. memory hot-remove. In which case, the mmap lock is insufficient
> > 	 * to prevent the intermediate kernel pages tables belonging to the
> > 	 * specified address range from being freed. The caller should take
> > 	 * other actions to prevent this race.
> > 	 */
> >
> > Are you walking kernel memory only? Point 1 above explicitly points out why
> > userland novma memory requires a lock.
> >
> > For point 2 you need to indicate why you don't need to consider hotplugging,
>
> Well, hotunplugging will first offline the physical memory, and since the
> vmalloc object has the reference to the pages, there is no race.

Right, but fundamentally you are holding vmalloc locks no? So this is what
protects things? Or more broadly, vmalloc wholly controls its ranges.

>
> > etc.
> >
> > But as Ryan points out elsewhere, you should be expanding this comment to
> > explain your case...
> >
> > You should also assert you're in a context where this applies and error
> > out/WARN if not.
> >
> > > -	if (mm == &init_mm)
> > > -		mmap_assert_locked(walk.mm);
> > > -	else
> > > -		mmap_assert_write_locked(walk.mm);
> > > +	if (ops->walk_lock != PGWALK_NOLOCK) {
> > I really don't like the idea that you're allowing no lock for userland mappings.
> >
> > This should at the very least be:
> >
> > if (mm == &init_mm)  {
> > 	if (ops->walk_lock != PGWALK_NOLOCK)
> > 		mmap_assert_locked(walk.mm);
> > } else {
> > 	mmap_assert_write_locked(walk.mm);
> > }
>
> Sure.
>
> >
> > > +		if (mm == &init_mm)
> > > +			mmap_assert_locked(walk.mm);
> > > +		else
> > > +			mmap_assert_write_locked(walk.mm);
> > > +	}
> > >
> > >   	return walk_pgd_range(start, end, &walk);
> > >   }
> > > --
> > > 2.30.2
> > >
> > We have to be _really_ careful with this stuff. It's very fiddly and
> > brokenness can be a security issue.
