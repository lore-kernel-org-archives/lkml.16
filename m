Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1261F193C
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739271133; cv=fail; b=fuBBdAw7/aPIProF5ygkrufX3UrHim3yAAxrNsb+7SpMur5lDclFsXB9Y3g/YQfFU+nvnbz8irEN7H4IaSSD1gzPn9Ce8K2Cjt1GjwD7XiXFBd4vUHCMpN0sQtR62pnPW534pfHWouxcFTtf+Rnc5Dum5SsC/gH/vTN/aQCItrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739271133; c=relaxed/simple;
	bh=/hDPbx0aZFA3L3Tq+9Uqvfu9QUyFqash+0l7tuuGurs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jJzN/K0V91ycwMS0NLEu02jUG8fQMJBY8MKy9gnDTs07swzmkJ+mFtzHK6OQjBY1iEbPhA6pCG9/VcG/VOH1TdITMiWOUtdqguPmwi0Pj90a2f9Ke6P6TWTOZnsNQUwK3BK0njudJsl38vr7H/ETNbkTkB8wTSEc6ZgWbFEqbt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fx68++Nr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FjFYUDsC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fx68++Nr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FjFYUDsC"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B7tigN005918;
	Tue, 11 Feb 2025 10:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=3UIh1dHUODxsRe1v+1
	nA14Wv4MRTyTzkcY+CZsr8YGc=; b=fx68++Nr5jBK+06kkq8cIgi5bA90iOpkcz
	tlOqiQh/+qHUq5nlVes4ShBKZP5ifxYg3kdSYPGkAvdXR/ZWJsnBrSoc4TomVLU8
	fk6w/rck5wMHeoCRQGtsffs7za8lHTkYf48uFYn+04gC2Aszh+pjjgNEn0dYTWqx
	zmDqZyEdGCXqsxdMIR/12wtwEk52jVT21PTSrALoiWWgUgW/+Gpj7fnvWcRDvSKE
	dYLyECe8O5+8ly5TbLI0f08yimVgNTm0mY8/B92DX6sc/Ue6dFltY4KuUlu9GeZM
	ZTNib+JNEzGjjj48gfS1P8OF5R8Dgp32KyY9gcuS+b5Rvdc7AwqQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44p0q2cvrt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Feb 2025 10:51:50 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51B9kg7W026920;
	Tue, 11 Feb 2025 10:51:50 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44nwq8ks3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Feb 2025 10:51:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UxKNX0rNC41ecKvPqTEAmCZYqD2WZU+x7z9jW9OMR1iMJA7SiMq3eTqQWLgxolnu1WwOyREFx/HUf4rmQve91E1oLkhCp2ZCrhvvguysRLm4e7h4+4jQRXHu1jpCMHpB0YZO8cyBLk7gMR3a89lEkZ2uQKxCF0QVwCAmWiz7kG3KxrmPdCGITal4XpfyHNFsgf8T0gJJOsMQK1bZmt0GyKuDFqj4EL0HRrB/NYVZSTqiXjhCGxmCZANAXZriZrxWdMxG2ss5NxbtdhepAaQvNK7XqyekUKxO4lrWsyJ0qhE7KQbpA50n5c6m1BHM+/FGTNm9Nh0nue4LfW6ORLxNEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3UIh1dHUODxsRe1v+1nA14Wv4MRTyTzkcY+CZsr8YGc=;
 b=sFIb6hI7LnBPSnhkW3VTx+1LOjwQGHKO/Bn/uG2p18C4rM5riNTr7XzSuHydbUzmhX0pMvZ4J8gjr5g95UgChoG0SULYwb+IINrBjd9iLQmzAVXcx1WIwUs2WMn3OrEBKMUqCAX8tS6Fg4Jj5KSN1julJHCOcvuuKYw7ugDU3w6XB73+mSFVyIXca3wqrub6MLOeAjiEetrOwKl6qmSBpUYKauYaY+dGh1Y+ZehwPLsVc2v3/FRD2ZwZlZ2XsS+rC6hsBg+RYTUmZwDXsYBBbhRVyJHDgd/iwZmV1Yssvw68m3Ht5cyYO7kjcWP99cxDudjdxsgOnP2AGxQKFD79sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3UIh1dHUODxsRe1v+1nA14Wv4MRTyTzkcY+CZsr8YGc=;
 b=FjFYUDsCnbnvw2lIcXKVgOiaM3+hVbEaDZ9ayvhfcks7PdTZWDBxsdOTTAIsZo87fV3F58k9sFoiAjJMQVWxcoGVNYGUOHM9p5yK5wsCw9dKoYt7Ueo4wWR6vrSgicKn+1tIy/f4biO6joxzLmSJqH9Fc8a2+BcTLt3muTzhqts=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by CY8PR10MB6538.namprd10.prod.outlook.com (2603:10b6:930:5a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 10:51:48 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8398.025; Tue, 11 Feb 2025
 10:51:48 +0000
Date: Tue, 11 Feb 2025 10:51:41 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <howlett@gmail.com>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Shakeel Butt <shakeel.butt@linux.dev>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, "Lai, Yi" <yi1.lai@linux.intel.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH mm-unstable] mm/madvise: handle
 MADV_{HWPOISON,SOFT_OFFLINE} from madvise_unlock()
Message-ID: <2f448f7b-1da7-4099-aa9e-0179d47fde40@lucifer.local>
References: <20250211063201.5106-1-sj@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211063201.5106-1-sj@kernel.org>
X-ClientProxiedBy: LO6P123CA0016.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::6) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|CY8PR10MB6538:EE_
X-MS-Office365-Filtering-Correlation-Id: 75e350bd-675e-4617-c1f0-08dd4a8a1539
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OXtFvUtn7NRjAOkUJ1ra4zoPJWW2qKP1zudzelcKYc2TUDvf2UamEIU7GxNC?=
 =?us-ascii?Q?wKWBC0VECcsMdqEegyniD0oyXS2NKRnAla1P1shDA047qRnMG3AZ/ZcuVb6e?=
 =?us-ascii?Q?AAyay3LylQg4scNtUuJL7Qw8sKm13bDCukgP7ekQsI1x53akU4Lfl+VSS0ym?=
 =?us-ascii?Q?rtWyaUwl1kn96bWLc9JrhF0z009qStX3vXQ3FuJtwPtfaDMfQhwt019vquyO?=
 =?us-ascii?Q?uLCezYlbWl4SCes63RZed7PDygu8g03aluq09TnzVa3LtRsQZu79V65JRtVy?=
 =?us-ascii?Q?j47nB+eB40TULwN2v6qFLec3EDXFcPgMWL8XyjmqXfg5MIoGpT8AUn/Qc+oW?=
 =?us-ascii?Q?VWCbJ8JB9l8UZ9+3UwD7apAZxqgQQU9nAKr4UPv/s+kxe4hnUXm1zciQsFAZ?=
 =?us-ascii?Q?4DnUeZ7fd3ISAc9UUqqZPFvIPlcJZSehXx0nk17pRcePSh340dXBcQPQL5IU?=
 =?us-ascii?Q?ioW7OBUznMWI1VccPFIDzohwjaZJGBZ40sOkuBLOJQDiNhMcZaNHC4dyTyE4?=
 =?us-ascii?Q?C59EKcf5n0dxFE3KMmLe2x3WDySO+ME8UGIII/M2ru/HOA47JltQ43O4Or3V?=
 =?us-ascii?Q?3cRQZmlVzYVdSyinlzzBRM5SReAFnoOQgtZCgySqOuHErPB25iPHSbC+YjnW?=
 =?us-ascii?Q?vM2fuKbUO8b7D/T+uhY8r8b9SZYvsQBo4LwwzVNeYWdawvDY5+Tigju6lzfn?=
 =?us-ascii?Q?cjYvxRKLtvOoKKGBYjdYmz2+EnQmvyHjsg7gaP1fvDta/LBklJeZuzPhAT8N?=
 =?us-ascii?Q?I7NZM15QXSuMQ3Sk101N3nQd/DpPisHAfLoAmwnPEVshcqUPS+CcrKVdjUCg?=
 =?us-ascii?Q?ZkT9oFDCYgrUw+jNv7saDzPJBAVWeJDvGlU7j9mVBtf8z2RrTZZ97injkFBJ?=
 =?us-ascii?Q?Oz/v0G/jq+MNIy5yi3fbKCYFW1cJU9ANPQl1iJM7ao6C0ndlCRMqMAmOhmX+?=
 =?us-ascii?Q?bQWSmurVydjdJ6ikZ0y8orUOPGesWorc2QxR2+VvE7ZaqrZHMqiYSUchIW0u?=
 =?us-ascii?Q?fLCm7fERXGWqWo5Fwk2JR31bB2hkGr/Ibh35QHEdA10F94sfl1yy+1YLdYg8?=
 =?us-ascii?Q?f/OEIWho/m6OiKfXDwcwtSCSrCyV4I/9vLQ/qB1/eIpuuEv1yKWqn4DQtHqO?=
 =?us-ascii?Q?ZvAtqUUHrA7agE0wuDaMiIGUA9cRjLAE7coCOeDU6yFDzC3JMc8kpLvLjek6?=
 =?us-ascii?Q?BT7/Zbi/Qt7JJGaToZ5vNROmJZSAiUzTTZuLoZJNhKzVFuKuy4B2Hc/OY8Vn?=
 =?us-ascii?Q?YqSRscempI5Ul0FWC0cTf/DF3enyUyE9QN8Sd9OdwaTmneb3NiKQp3+aRQ5J?=
 =?us-ascii?Q?NyjH/TCKMcK7yse778hHLkTJxVajTOSPc27jihCJlMRdHw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lNa8LMk5EwqPPeb1TS7kzWjQd/tvDGPUSvm5OecuYxIQgkrCBLIE5LRmuVBi?=
 =?us-ascii?Q?hR7h5Rg7iM2GfcgNatx+o8nktH7GPX6tQY0cYtUAcOgAg1jFhUKxVmsUbCcR?=
 =?us-ascii?Q?ykh0OVIOZCXI2DAxQ292B9leXO60wrAyAF3UpMsCb/xdtBt2UcnZqrBCLeOC?=
 =?us-ascii?Q?1h780lsKkAjz3FMamLXgWzgmhWq6OLvJHcvIP3Nr6dG0wPFzfkp7lkihJenE?=
 =?us-ascii?Q?pOMW3FnKH9NSxe/ShxSVlZtq8MuBFzy4Y6av3Wg5OA13cDJ6wDNYSsDU4xnN?=
 =?us-ascii?Q?NTX7o9qglMdlDhtJY5iskriNM2idC++q6xSmZ0sTEMyj5bE0umHAcZPLD07f?=
 =?us-ascii?Q?47OKpJa0Y6Ht/lyIdSff60U83CJSPffVrTEuydXdYX++Lb5l+vsYM6IlLi9o?=
 =?us-ascii?Q?th5sdHdXD7QjIFI9hp9sS2A2hA/ZbaWyf9IoYS8axVMX4kncEumzTNRDIQ+d?=
 =?us-ascii?Q?9A/mztqBTe1Ig2IFaSTwpoigcU9Qwa6paoxTXpWDgs3EZ3vahUdjP+ZHAf7l?=
 =?us-ascii?Q?KC1cwuTuVQjXpCkXl6ofL+4uX+tySKIKnvy65BXtictl/TpcRYFHQ7iuKCYQ?=
 =?us-ascii?Q?YjedBM4mJGVFQ1koSHjlA5hBN3UEhPOILiV2uRCjMtF+5+jEwrnVaCWKJKGo?=
 =?us-ascii?Q?FIp6s6PFW0qBd/ndVAb1bJldxzjeoiKtrMs5EAxyMOpe2SyIXnwXDJ96wW2t?=
 =?us-ascii?Q?u1dDz+s2GLDcitzP2fPfI5Eh4IPkArf0znkMUiulIhJHuVURa4YosDVjY0mx?=
 =?us-ascii?Q?lSnOCI7rWjhkdcki569oBW/r4/KCUU1uwws/Wzv3l382QOHrR6RzngN5Usg9?=
 =?us-ascii?Q?VE1svquFZHuSS5XHo2pj/4dZa5LWf+3pFCJ0OpmJZXYF4CIi/NNEq+Mns7Wq?=
 =?us-ascii?Q?J0rB5ThFlSPgoskauNZ0dBGUHkHOX/rLWSBy6zPcr2RAB7JdrVUvAywo9LFw?=
 =?us-ascii?Q?Uge6A7mecNxj0cIeIYDAaqS2d3Q/NqOvKJpxZNEOBoBnulP9iEcPWMY/+Y9Y?=
 =?us-ascii?Q?fGFg7aR1jHL19roj4JhnqSZqHNPK4FH5uGfOalCiC40bgROsuGqlu39SpOdp?=
 =?us-ascii?Q?nCf258sKI6ClcYLS0Yjr+p7lDxUCzbJGB34R5nnWndk9UvEz0fO+o/AJZdzA?=
 =?us-ascii?Q?yjETzR2yUWsCR2wVDotbaoYruIHISPclRO1W++n4TQVanlYGxrdV5TpzBadP?=
 =?us-ascii?Q?4owx2xImWCNJjABXXtys6QANBru7gfvNckp1JVHXbu59cqvLamLtwyKgZaem?=
 =?us-ascii?Q?7bH3tfLhZzzEkQPLEHlWGK4NNm8wpRC+qbBCVFYq8FglbXJsxQBT6aowwgFE?=
 =?us-ascii?Q?UXovjjeTidVJUu8CO/xQ1gWobyI9L3P/QFTQiqKkYv4fgVfvP2apVLRoWjm2?=
 =?us-ascii?Q?zVl2JjKdng069AQ+0iIrzgMIt+Euyc3gdBp8f8thsacUwDFL+3heZiec9Fvm?=
 =?us-ascii?Q?Q6QKUe+oCANryahsjnzqaElSqUzFqk9Bx31Wt5qNw6DL1ysLCJhCUVsqYEUJ?=
 =?us-ascii?Q?+ibao3yPRQNXThoQ6qEfG9j1GE1Jc95GSnEyIWGwb/UO0gJL6voWXEaWLQZE?=
 =?us-ascii?Q?HyeA1RsBgVTsMH5VXgLHs199KxgH225dWfArOR+2YTblq27foJftEfS7UqZG?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UK/51zvKMlJnihh2jo1B54cBr9+HO0/LBuPKE8OTyvg7ogi4DB7Dbhp8cPWVkq04LEKVgQ2a45S5Vhv11kTQg1EBOTlAnKGrAqSm8fBlCxcf+QoCCxXCknAf5nCqr5l1KHx+USjTPSMCAZLHDcC5DFr3mTDIfY4Kc990XayV5idCrc9ePPTeVeOxcfNDSIXudvUBRzk213HNffjuFvi0diKP65Fk9umWd6fRK19t7GjE0dtEz/swI5xZYTZGkPH8hVxIrCYxMGfisyQvHptosriCdXRG5eBbX0Ao2cDXBWLKV4wSc3Z2P5mF5X8NXVhc+ZgyBFDkcOuC9UGF1/kqpulYUf1Lkt3ulAwjT4QeSysTib4jd35jZqxRRnvetnZfTu/pKnpYIzvyQ3SIOmTKvNMzxs+GGaVL3MTZ05h+zm1O3gqEFrJEvfRxIEgbdFHx51WQAoofHe/2p85LXZRs5jI9Ob9spq7lfSDRoT5OBhMe3UGoqnFU8s8tai1eXajI3HT8l+JMyj+DqYkDTKSv8ETZgHIPDVyARswYGiJDai5DefqblooiJxv6HS8umqDs6yg8WFJkXwJe1+VejpVNI6p4VD4D/0yV5/gazLab5Mk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e350bd-675e-4617-c1f0-08dd4a8a1539
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 10:51:47.9744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y1ObMoNWA2U2vlfzx3wJzP9Ezq4l4qS+NpXVjHDtZdj+moFYA9DJEJrsphin9dAzrvjhel3oVXn34rlUhJ2xXJKqRKKEa0kLB813HMwZ3Xk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6538
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_04,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 adultscore=0 mlxscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502110068
X-Proofpoint-GUID: vYnGyT7_mlNVpZrqIvNYXgSb5EcMvSWU
X-Proofpoint-ORIG-GUID: vYnGyT7_mlNVpZrqIvNYXgSb5EcMvSWU

+cc Naresh, Arnd for another reports/discussion of the same issue [0] while
lore/lei is broken.

Hi,

Lore breaking means I missed this :) thankfully you cc'd me (_this_ is why I am
so adament about people following get_maintainer.pl procedure btw) so I was able
to now notice + reply :)

This is totally my bad for missing this on review, so mea culpa.

[0]:https://lwn.net/ml/linux-mm/CA+G9fYt5QwJ4_F8fJj7jx9_0Le9kOVSeG38ox9qnKqwsrDdvHQ@mail.gmail.com/

On Mon, Feb 10, 2025 at 10:32:01PM -0800, SeongJae Park wrote:
> madvise_lock() does nothing for MADV_HWPOSION and MADV_SOFT_OFFLINE
> behavior, but madvise_unlock() does mmap_lock unlocking regardless of
> the behavior.  Commit 948a0a9ea070 ("mm/madvise: split out mmap locking
> operations for madvise()") in mm-unstable, which introduced the wrong
> function didn't cause a real problem because do_madvise() was not
> calling madvise_unlock() for the behavior.
>
> Later, commit f19c9d7b57cf ("mm/madvise: split out madvise() behavior
> execution") in mm-unstable made do_madvise() to call madvise_unlock()
> even for the two behaviors.  As a result, the kernel tries to unlock
> unlocked mmap_lock.
>
> Fix the issue by handling the two behaviors in madvise_unlock().  For
> the two behaviors, do nothing but just return.  Also remove an
> unnecessary blank line in madvise_lock().
>
> Technically speaking this patch fixes commit f19c9d7b57cf ("mm/madvise:
> split out madvise() behavior execution").  But since the broken commit
> is not in the mainline yet, squashing this fix into commit 948a0a9ea070
> ("mm/madvise: split out mmap locking operations for madvise()") would
> make more sense, so adding Fixes: tag with it.
>
> Fixes: 948a0a9ea070 ("mm/madvise: split out mmap locking operations for madvise()") # mm-unstable
> Reported-by: "Lai, Yi" <yi1.lai@linux.intel.com>
> Closes: https://lore.kernel.org/Z6rgiVp7221r4JZ5@ly-workstation
> Signed-off-by: SeongJae Park <sj@kernel.org>
> ---
>  mm/madvise.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index b5ef8e03d8b0..b8969457f3ef 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -1577,7 +1577,6 @@ int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
>
>  static int madvise_lock(struct mm_struct *mm, int behavior)
>  {
> -
>  #ifdef CONFIG_MEMORY_FAILURE
>  	if (behavior == MADV_HWPOISON || behavior == MADV_SOFT_OFFLINE)
>  		return 0;
> @@ -1595,6 +1594,11 @@ static int madvise_lock(struct mm_struct *mm, int behavior)
>
>  static void madvise_unlock(struct mm_struct *mm, int behavior)
>  {
> +#ifdef CONFIG_MEMORY_FAILURE
> +	if (behavior == MADV_HWPOISON || behavior == MADV_SOFT_OFFLINE)
> +		return;
> +#endif

I agree this fixes the issue but this is horrible. let's abstract this please
rather than doing the same crap that already existed, only now twice.

> +
>  	if (madvise_need_mmap_write(behavior))
>  		mmap_write_unlock(mm);
>  	else
>
> base-commit: 8bf30f9d23eb5040d37e6e712789cee8e71e1577
> --
> 2.39.5

I attach a fix-patch concept for something I think that'd be nicer, do with
it what thy wilt! :P sorry I don't mean to be 'one of those' maintainers
who copy/pastes code + demands somebody do it (by no means do I do so), but
since this is so small I feel it's kind of quicker for me to do it this
way.

Obviously take it or leave it/adapt it/etc. This is compile-tested only...

----8<----
From 9fce3e47bf0fff2a2291be66002af346cdbca665 Mon Sep 17 00:00:00 2001
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Date: Tue, 11 Feb 2025 10:44:26 +0000
Subject: [PATCH] mm/madvise: fix madvise_[un]lock() issue

We are asymmetric in our locking/unlocking in the case of memory failure
madvise() behaviour options, correct this and abstract the memory failure
check.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 mm/madvise.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index b5ef8e03d8b0..1a7af59c3aa9 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -1575,14 +1575,29 @@ int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
 }
 #endif /* CONFIG_ANON_VMA_NAME */

-static int madvise_lock(struct mm_struct *mm, int behavior)
-{
-
 #ifdef CONFIG_MEMORY_FAILURE
-	if (behavior == MADV_HWPOISON || behavior == MADV_SOFT_OFFLINE)
-		return 0;
+static bool is_memory_failure(int behavior)
+{
+	switch (behavior) {
+	case MADV_HWPOISON:
+	case MADV_SOFT_OFFLINE:
+		return true;
+	default:
+		return false;
+	}
+}
+#else
+static bool is_memory_failure(int behavior)
+{
+	return false;
+}
 #endif

+static int madvise_lock(struct mm_struct *mm, int behavior)
+{
+	if (is_memory_failure(behavior))
+	    return 0;
+
 	if (madvise_need_mmap_write(behavior)) {
 		if (mmap_write_lock_killable(mm))
 			return -EINTR;
@@ -1590,11 +1605,13 @@ static int madvise_lock(struct mm_struct *mm, int behavior)
 		mmap_read_lock(mm);
 	}
 	return 0;
-
 }

 static void madvise_unlock(struct mm_struct *mm, int behavior)
 {
+	if (is_memory_failure(behavior))
+	    return;
+
 	if (madvise_need_mmap_write(behavior))
 		mmap_write_unlock(mm);
 	else
--
2.48.1
