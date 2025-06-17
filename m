Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5191E28FA84
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 17:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750181646; cv=fail; b=MLScres5Zn211gf5xC7kOhrSg3Kkq4gWCLywPuagxVqLv1rI7cyBbkj/RJ1wibmUVAS53PX9gfW6VK8no5nZhmK9+5nMFs121M3SsHYPWE1T4FGMTfUK9K54kwfcVkbXC8z+Ze5dUFCKvpV0ihhPr22OX6im+ETwHLs5BQFAs1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750181646; c=relaxed/simple;
	bh=jeJOYoUtJj5nfgkXOY9RPrlcSDj+SgzkWyUQyWmnT1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XDNl2d806DYiKTdS+7z/dQwkUDJQz+C5jmnMu8BhOzlmDkk6LHOKW5JBG8OPypCwAi/DOFRW480FWsqVGLE9rx4VQ/HWrw4skgxFonFQ2gKQ/6R6+VYRqEJ6+E8mOiDr+6Q/UutnuE0w1cOH8Zqt5YTUFcK2sJcFzmt517C8ldo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Q1EXgKRu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=beV8fFSE; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Q1EXgKRu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="beV8fFSE"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HEWxBZ001277;
	Tue, 17 Jun 2025 17:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=oQQXmIesE+wCV6O0XW
	Ma62LV33lPzb9Dj5yM1hIGxKw=; b=Q1EXgKRuFHXa6NyIQJj+Ud15VnYojNmLQw
	qlovFoL8BzGVfFijw8nXBNfdrauWx/v/CAkKbDc3rezIPJmeMk7oIpXP+HxTkTwi
	MGD/KalX9DSCaNu3uspP/HB8w6B5/PmVprw6AOmGxeNrM3rVtx+8zOwwBRSEavqz
	48LEguhLxwp1FW5CEDtX82qyWEcpSe8ujl4Z6Qa26zDqCFGQuRlIsx3DT7VbXwmM
	9DgSJ/HO0ATJi54E7Y/jMJ3Q1Z3hatEVgXfPfn710TiAJvyi5dS/Lp04vUm8X4GA
	vwOAuxeApUOrtOxCOhGaDmpcqZLxZgpAN0pV7AhPuEhs4y/sBh6g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47900ewx4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 17:33:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55HHHTHm032490;
	Tue, 17 Jun 2025 17:33:31 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010039.outbound.protection.outlook.com [52.101.85.39])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh9hytb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 17:33:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZZqXAp78pzCM6fFJfsn6+jagYay0fXePuHcJUcADZcYHmjTV7mI2Y+L5960OWQ/KOZI5hrm3PeQNgdo5eSq/MPOtI51eUosMSceuAzoh4Cn8pZ84xemNz72Ameti8H+arFG2AOh4aB8G1K7X89LOfUS0tvKIvdVpPa5vmncEMKXPIF82eIvB5ChRF/6s+8UYQdCKazL5sUdn6wFjMnGaMJcmGi9XoCSI9ceo8sh/V1DRT9rEuI37s5nBySChmMrXlKcizjcbCwfWAELN4NTCIYpfY8EvXrQpUP1SQ+PaIYnjoWTnBDY1zMdB72/TcK4EjRu1ZtJ4L2eilN2QLZA5NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQQXmIesE+wCV6O0XWMa62LV33lPzb9Dj5yM1hIGxKw=;
 b=Cpm5MBrvIveO4obqMs1YhmwxB6xC2y7Otr98cq3TCLuE/7I08zOfJEZz7i6ePGHp3agCJNJsaALcdu61eI3BXDsB6RUeqeXunLfk27nHYuVhRwGoZyl8wRLU0kKW8GWfpK05vxvlUb9JtOT3K4LLWfZs1P4lPZRKL3Lqex96ZemlS1nDgv19Fm577WG57XrV9WR9rj3vai+XZPNOQhhHNCH0tvEwbVaKNdS7OoBldYrlT79lfV5ERm7p8xMJDkft/z2Ak65J+ip5sZlRa+urCz2oCx1EEvs1QKSIlQlK2X/TTkOEWvigRuPZVarOJsY4SlK+RhAyN82657XvDhTs8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQQXmIesE+wCV6O0XWMa62LV33lPzb9Dj5yM1hIGxKw=;
 b=beV8fFSEw3ukr6kfFRJsL5q15uM4twXRXtVET8ezZ8IApKrwXyMmsBaU0j7++lfXyWX+XHBnpbxpb4Efl666GeZ4XKxD+fC4qzom1Vdd00jrY57daPmKpRuBC/xcNrX21H3nBM0RO5NGuidodeyel32aPnIdjDD6OBPdnwbmUlk=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by SN7PR10MB7032.namprd10.prod.outlook.com (2603:10b6:806:345::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Tue, 17 Jun
 2025 17:33:30 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 17:33:29 +0000
Date: Tue, 17 Jun 2025 13:33:26 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>, Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>, Harry Yoo <harry.yoo@oracle.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] MAINTAINERS: add stray rmap file to mm rmap section
Message-ID: <htutomkl7dzbc4x4zwowckl3fpjz3uypko6gnvqj3q7u5fp672@pc4r6wio64dz>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Rik van Riel <riel@surriel.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Harry Yoo <harry.yoo@oracle.com>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
References: <20250617165142.173716-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617165142.173716-1-lorenzo.stoakes@oracle.com>
User-Agent: NeoMutt/20250404
X-ClientProxiedBy: YT1P288CA0035.CANP288.PROD.OUTLOOK.COM (2603:10b6:b01::48)
 To PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|SN7PR10MB7032:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cebe774-af79-44ad-1c13-08ddadc512df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+5YZ22kD9xdGH4QfgTkSzXfB8bRRT6sm2MpSuk0lc+0xy1abGSa5sONlRyfC?=
 =?us-ascii?Q?OKm2gwr7ozTZZf8s9QHV8AaDmg+9bXNMuztr2IZs2xfc3puB/+wdwtFI4nHY?=
 =?us-ascii?Q?ZZqw9PKHMc7Gn5mQ2qZ+vjOXmC0EDjfU9IYktwm/PykAqkstGGs4MdoHyc0W?=
 =?us-ascii?Q?2jROdC88iC9nHI3sSAOrINATqvVcrF55hRgTTNbXhNBF0I4pzqoxU9i5oDRZ?=
 =?us-ascii?Q?ZzPtJjsP5UHid7eDa0YF8bqRDHbxKB4b5iaX9AZYkbsd4Qu908ZOqPp02JIJ?=
 =?us-ascii?Q?ps8DIINOiWlwaQyU1NaKofuFUXbf8ObqwXYLitbMwBwo3DGXtbf9gfCJAuZK?=
 =?us-ascii?Q?kK5qldLNFS/PDzhc0tDhF4ZuVlfbz+aJBbRjtch2Vjt/VnAScR3tjtJ6wwH+?=
 =?us-ascii?Q?Mnw6Jg7jRC485qPJk/Pf0W8gPXYsva8Ox//cL1RkCdUShW9gimT/PM2MyfX4?=
 =?us-ascii?Q?uog7tB6eC9Mvy55tzI6WqObi84cwA569d0KrdtNifdx/HBmerUZQZ6tliYgb?=
 =?us-ascii?Q?L1Pn0Z1AMuwecZQeYpHVBBzSgf+90hY5uBtIiZxliBfRtdqQeAhiYj5fyRwv?=
 =?us-ascii?Q?KIZZVBVDkejxqh6ta3hAoJ7VWCWWzBBiWcYSxn1rGBwg6gBQRGMUFB6Cb85B?=
 =?us-ascii?Q?F+ox5tekvZKoeqfdCfgyeb+OFh5IzXlT/8C7A6Vvsu0XZOd+MLGH0NMXhwuV?=
 =?us-ascii?Q?02/KJvnJQD0TYlg1PESyHLqF9xkMR2iJ0ceSJr9FsqDFTq8NzpQz0Yxq9jm/?=
 =?us-ascii?Q?5NOfzqz4pN06Zpg+b+CMd/8ag69oMPTchK1f3eLMpjdug7cTGqQwruECxFr/?=
 =?us-ascii?Q?d3Nfv0CcoKk6UzPCW3oa6Jm+ZaWBVUXwRohI1EarJ7Ke09duyGrtk+OBk/ri?=
 =?us-ascii?Q?Y5+M19ZP6autreWsJLyDCjf7sA/L3FRNflt3ylNXF12J6mL8zS/tIoZx//i4?=
 =?us-ascii?Q?gsyStHDKXhTcePFQ86smtJO3VInieC98r74Od8d2qmrPzTxRkM6ttUqG9PzW?=
 =?us-ascii?Q?sfMrslgEf7JivAaxx1Xpgx4Mg0gUPPCwFK+cZqfIbp4c2Zo6Vtx9K6++I+sC?=
 =?us-ascii?Q?8HE8otBH8spcxUXQUBg8L5/BBxtCOVhn0qsjmK++vZakO2/en2ON/DsXitcx?=
 =?us-ascii?Q?I+FDPZCizo4IuGTcvZMGiVX3CbnZPS7KI7+3/aVfztv0UYRYIRn+tDKMMBuS?=
 =?us-ascii?Q?aL54pSw2NBFGobSm/1y7lOhsiDmE+XW8In8VODJqn2coHlWXiZUjdmDz//YQ?=
 =?us-ascii?Q?+kDiSwl//YQDCy+sjkae6bHQ7mykmGOxwk40V9tTeOGrnPCn+l1pvnER5hKj?=
 =?us-ascii?Q?zunGoTWItA6jNFOb3Ke5IIuy3Ff+0dKBg0XASkbzGeuL+eIOTot0TeOxD1WE?=
 =?us-ascii?Q?dTLR+LO7GdSHO+hVmp2dVe+GhdvVvBbkKnMoXN5VdM8YbHsRgafpk1/pSyZB?=
 =?us-ascii?Q?3edrhXHTCqo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pJ43lfY1q1G5zUYIokJ/+aDvooVE4jB0ww1B3/eLM8+HATx7JyBxw/xgV/qw?=
 =?us-ascii?Q?0kcaVCHfe0vhDuJBfY4j12a51jD0pf0KwmmvsXiaphNZd2KO8xEd4BA86ArR?=
 =?us-ascii?Q?nfNploJChrwAn+kPO2nVFRXT9PBhd3LROVfYJzFWevh/iATA7RDw4UdTPBLH?=
 =?us-ascii?Q?Ndr7aSwFO7gNxCwVRP/zSQFFmHTja6oylEHD8cAch7DxaqzxrTzOn7/mOEvW?=
 =?us-ascii?Q?MfJb/6/X4kGs9xSWeen17Zs97hlJoygp6hnLCuFCctbzad/O4NGKKeZWWHLf?=
 =?us-ascii?Q?J7issMGez2qMTmAfOVTjYKugyfo3knnfRf6WBfWM14JSr12DPFeooqAJB2JC?=
 =?us-ascii?Q?lcHDPDwdsremz54HSWK3uXgsPzbXbvWp0fI/a10noViiXbzRLyVpgsbxt1h8?=
 =?us-ascii?Q?ePbCoJEdjO+zQn68W1GBn7lNkxZKOTJolAowz9IUFyX5KZz2vItry8QhT2Ji?=
 =?us-ascii?Q?pXeB4HEHwq5UbZw6lTqX4AgTVcl0Kn/rtHt3xx/TljKezevtuNF+hFnIefps?=
 =?us-ascii?Q?LB0vI13naRplr5MZvL3m99s1AX/wNzQ6RKS+Thh7omQcuBeACD/wF8mkXZa6?=
 =?us-ascii?Q?QDN6z4dAbT7uAK1W3526FF27Oc5BQ/hqjPOJTMd2m+UGeVTDJqDtr59UrqGX?=
 =?us-ascii?Q?NOhSVQP3OASFai8PssdzSWgHREauABqJa8l2LGzmGeb89s0r0RhSQBPDLS0d?=
 =?us-ascii?Q?ffshEfHiK5Ck+DOPHIfo1caje3LIjkKb8X1ZwbXwwQ5JOVomv03oJTBqdijn?=
 =?us-ascii?Q?zyMP9L2v4onXFyDml72Lg8x2PNJtTdVjKb0PkWPiT0QH7AfpOzZjGEEArwzh?=
 =?us-ascii?Q?s+isBDr1p7Pw06FP5W0QypBrqtKAckdrttnf1/euibp4ylmudXETGTgHFnAB?=
 =?us-ascii?Q?C9KGJHuKjnItdHDlxzM5mpnb7VuPF64XCBx+LLSenZj321GnIwRKxMC1k04S?=
 =?us-ascii?Q?agSc4tfD1mntYdEMcGPbX/Mdh1eBney4g61STS4Fg8K8GTkxJHBloMnVsXaQ?=
 =?us-ascii?Q?Y451fUveGUDiCAjDbYFI3vAJDxBxR7WaIyJYvesPbsdyBQKsRlNvgoXKl3tx?=
 =?us-ascii?Q?cQkiHED0QBZ+XDffp0Gm84JhS6wmd31VeqF8Gce96Dm07mFFp9K67bGWIdig?=
 =?us-ascii?Q?YS2zCRPYfE+1ZKF4lvnMICHkBTsyETWswKyVLTWZVozuZSyl9xHbELJ5Gl1b?=
 =?us-ascii?Q?zsJJEpUi3OEpQ7GbiHUFw3iUBKk/CnXwff0i/oGth7KoFRb7RC03UyEWQgXV?=
 =?us-ascii?Q?pK7OOzo0WeqJM4dKOSS9eCp7JseWi/81poD1J/HH8fcppZOmiCu7/FS3Jv6X?=
 =?us-ascii?Q?Lzz45lwztsjmR/3pSvAKv/jvh0GYksA3pk7mkuf9ojWs7MQZJQuN15d6yLxr?=
 =?us-ascii?Q?XChyaP0sSYiKAxvDKFCbROC2R7vwrKTSrqoQRClS/mMlIJ2U55VMbh4NnHZl?=
 =?us-ascii?Q?uVutfWaf0mVTmV7gLKbZ2Xguv9vdKf3lP+KUU9ThBMXx7mXgeUj9pIyKgvWl?=
 =?us-ascii?Q?TI/vuxzaF4AO1u+VsJPnjApoC8IAOlA8ceq2axH0Vaii4g6JhHTz/oAJrOCK?=
 =?us-ascii?Q?B51JURYfPYMoCh3tiiJixwtS1k7tcLujAUA5Z80v?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7++hFQIiOz6IfQYqqfGI3SJIfarrlfF3/Wpk3IRaX5VGNkULV8F8W4/iSYJOxlUKbxjJEoIk088q6iofqbEQJNSXRgNk9eKAiLJlK0WrWVXOcT3u5XYS4XMm5ER4mgCbT+S8bMeZrZSnMjIbiqstBxT1ok7q7+DExHevLjKV39ZkF6yGmkvp/bLVqQyDp/OOwvVxRDYosqYPVhlC8AGpjp/+3ovcp1UNO0L9NIYmj9h//U6RVNWVtCdeiKuYCiyX27Ef5cEiKr6Baj5Gw2bosq1UbNC5d6MsoAIKLPsNI4Lm67hLniD98gHMH79YYh21EVdjyU9pTEg4zvaFjNEWN+roOalJJGsAjAEMWZQkaAANZpZ3aYqQ8j4ldH8uPazBHGH0PyNRdH464ASJ7I8f/ucRtXyH9DxvAhy6TlXT5+9g5ADyNs//Dd8PaKihn3z2e82d+5y3W4uIVmG/nLTlMv7YM3jKrgWQDS/gFRRZMuin6ICvbA0FK8ONIEdm2zKlDYqmQXEgdeJxlwl2av+6xFX/MmeNX47xIdYsY0fJ0ZP2Ay2IpGL+ie5l+poKpMLxe7yIIAd6MVTuUxBhMgV1CkeA6qY+GGdEUJaoBk+XYIg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cebe774-af79-44ad-1c13-08ddadc512df
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 17:33:29.7447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BnG6LzX2QqNRDVJSaACwphmX6vr57/2mwoDH7yVHDmmc53fia7xdEuHyoJr/Ip/Gq4roWKrtRppX/kR/SO/Sow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7032
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506170140
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDE0MCBTYWx0ZWRfX7HMOaiPMuM5X wPw5LTaYZzd1DI1QBnQxcZVCmMZoM5Q02fDXe0ETZY0EdQJW235KG6C2rvVK9ZqGvfaAK0vdlbe S0t04Bv5tLZB0xQzFzDVSpigqP4JvMmdn8ABoNJBcDO+ldb8W2BW56Fxq2tF2WBDOF2SvxtSuua
 4RNtkH7qx/PGZaQs/26U8BwZmeqUA392ebgZf6L+llU46iT6Nsh+uvnjpkWZxzDzigPQ98XinZp ddxE6fx+SxDdoxImf1Aa3s2KVGbNkIuLAXKX7Zhtg7NLReE/baJqY7uHTUZVQNhKh+SNy8wU+KJ Ta9d/sMiBSsiSWQWmJwxVZNj7fe+gxStCHPeGqxp7eoIewKvGPLkkE+yb4VvDDTd366sS//VGG2
 upXzYTgWSTYoPJHbUIHNjNTY2XgAPhPZIYisjbFnu4LdumuX71CSOgUIWNNitbXVrTqiNTXq
X-Proofpoint-ORIG-GUID: 8i42YYrzMOSd9hsrqHsoYCEEpeYZjsRo
X-Authority-Analysis: v=2.4 cv=X/5SKHTe c=1 sm=1 tr=0 ts=6851a6ec b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=37rDS-QxAAAA:8 a=RleST1MUVYkazl5gBFcA:9 a=CjuIK1q_8ugA:10 a=k1Nq6YrhK2t884LQW06G:22
X-Proofpoint-GUID: 8i42YYrzMOSd9hsrqHsoYCEEpeYZjsRo

* Lorenzo Stoakes <lorenzo.stoakes@oracle.com> [250617 12:52]:
> page_vma_mapped_walk() is used to traverse page tables from a VMA, used by
> rmap logic once the reverse mapping has been traversed to the VMA level.
> 
> It is also used by other users (migration, damon, etc.) but is primarily
> used by the reverse mapping and is a key part of its logic, so it seems
> appropriate to place it here.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Acked-by: Liam R. Howlett <Liam.Howlett@oracle.com>


> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 08045f9efadd..5010e91e8e75 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15888,6 +15888,7 @@ R:	Harry Yoo <harry.yoo@oracle.com>
>  L:	linux-mm@kvack.org
>  S:	Maintained
>  F:	include/linux/rmap.h
> +F:	mm/page_vma_mapped.c
>  F:	mm/rmap.c
>  
>  MEMORY MANAGEMENT - SECRETMEM
> -- 
> 2.49.0
> 
