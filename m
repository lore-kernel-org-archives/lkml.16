Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD601A2642;
	Tue, 15 Apr 2025 13:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725508; cv=fail; b=GH66puxPlX/11sViWZGOdCj50HAY978Ed59GhDS0IDlw9ACQxiv67UZV0nSqXNwK32UB5hzCq7POUpr9c+Y2YWK0ZOt9N/w9oIz+Q4imNruO0IilC3iBKsTQ6RFz6V3PEqrY6vw0etIWmZxPVvLQSFv6CY55yXglJaSKEn4p+gg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725508; c=relaxed/simple;
	bh=uiJtPyxzmkHYHJsxgLFtHrSnuQrYkAxmkiV3E7l/uZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tNkOyUBg+P4DkWUIFy1/oX1bsPON++ZNNhSuOv4B9gQLMtF1c3fDk8jeRkr6of3iC5ZQ6BKtwowCSa+qjkNbYisXXLIELK4yp6DHPbY3EM5ILA405BbxcpS9UYtcT8G4ivV3o+S0IlOQGq2r6u5sG8gcwl6tvDgmz3nXoe3qKuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=C2+yp5aI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=w1Z7/hbJ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="C2+yp5aI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="w1Z7/hbJ"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FDtwjV008408;
	Tue, 15 Apr 2025 13:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=uydpMF/rpLx3Vq+cun
	lPOA9PepXvcgpiJRataXBLpaQ=; b=C2+yp5aI7vUTDlego+t6Tg6mGpa5xZvPr/
	C7I4LEfa5ab2RySsDX8SWq8y9U4HtHo48Owi/+8ZMuv+MMH74E2XPN65w/wjb6aK
	Btdmdh9SKJIX17ePoGlSFqVuhCurGtMegznf64WmFsbimJGwOKw93+NTEos3qTSr
	c1pCVSt9S1xaRHfeueZWisqHDiOY8+ptfzun5qRDiAtVDm7wCK6/LRF9rKV6Dys2
	l7O8iTCe42q3Fe9zc0r9R862FeJB/KwH65Z++LFiXom1FIfDxWY4LxQIRt1z9TtO
	OlL7DTNyIKxiCiKo2LSsIqiAeZg/ylp7UFmlN7Q4nJElxAVW/b7w==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4617ju9t62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 13:58:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53FD8tAs009227;
	Tue, 15 Apr 2025 13:58:10 GMT
Received: from cy4pr02cu008.outbound.protection.outlook.com (mail-westcentralusazlp17011026.outbound.protection.outlook.com [40.93.6.26])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d3j34f9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 13:58:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IZYJ0k80JJkiOtNwF1+ulXb4tF4y/KVA2dbClT826gcDo8MWyzDoi4U09X3GVyWW/xL7r5JohMtE0Oeq2AZbpSCtX3I2vahpPUxsBXFL4KMj/3sJOIJ+9t7XDwF9anzLQvJIiC0dHhGj98jUBv5X0r294GkEgR9xaWfOXqnp1IKDvMouwAyUj4JI6C/+YWqF+o/mAoXVApJWGl40yu8Xyz5HdWYfM3Bn84v0q+Aj0n9prkazzXnPj9jS8WKL4zphFgtLPnJ90c8D8WCxjKDsPTfVN7aweOaQ/IfcL4xVCmE3oL56YJ7wOuY75pNPUWEHOvhRsfoGPh0P6xQTh60m6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uydpMF/rpLx3Vq+cunlPOA9PepXvcgpiJRataXBLpaQ=;
 b=iEojkMzLqGJuvZUNpyW0PvICNGdg5nLFDtrsd8rzWPPExVBEKvGg+2+JGKsQkZrtD3Gurisqd+B2DgdZloQhRd3rZdU3rnjJBfTd29MwkJwGQzNbPSeVmC5oyWxHhsNRlJC8GsKGLfyhtvV/sr0PA5HnD2CIIH5ljEHf/Fo9QmziJA3irzoKd9ld9FHt8YayQgpZr2cX69QNmhWVoHOSOjdc4rC9YpMKKheEKW4Lp6HVQV/NkdUn3o03+0TyMbpZHe38HDP5AlQZsPChL1FvGTHyULh1zDj/VmwbzLZ6xuDIB2xSDfyYJpb9hPUg/yWwwdCyS1ODcS4CtXbpUIqamw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uydpMF/rpLx3Vq+cunlPOA9PepXvcgpiJRataXBLpaQ=;
 b=w1Z7/hbJzYkqx3D9pHUcPYp5+IqYYMcKRyvkopQMDpSvVCZb+OGJTyoxb0zyGg+cYMP6q3IIQsIALKgsDowyL7lGoh5a0qlbSV8XuC+XGN/ng6aAWBZZxBsKYy+WB6jegYeDIcHj0ocRg/M1zAIrNQwf/YxoaP9ZUPpSM0ljX34=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA1PR10MB6855.namprd10.prod.outlook.com (2603:10b6:208:424::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Tue, 15 Apr
 2025 13:58:07 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8632.036; Tue, 15 Apr 2025
 13:58:07 +0000
Date: Tue, 15 Apr 2025 14:58:02 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: WangYuli <wangyuli@uniontech.com>
Cc: corbet@lwn.net, chenhuacai@kernel.org, kernel@xen0n.name,
        akpm@linux-foundation.org, jeffxu@chromium.org,
        Liam.Howlett@oracle.com, kees@kernel.org, hca@linux.ibm.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        loongarch@lists.linux.dev, xry111@xry111.site, tglx@linutronix.de,
        thomas.weissschuh@linutronix.de, Jason@zx2c4.com,
        zhanjun@uniontech.com, niecheng1@uniontech.com,
        guanwentao@uniontech.com
Subject: Re: [PATCH] mseal sysmap: enable LoongArch
Message-ID: <3de559d6-be19-44bc-ba8f-4c52d4bca684@lucifer.local>
References: <433B5132A1535C98+20250415134933.531084-1-wangyuli@uniontech.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <433B5132A1535C98+20250415134933.531084-1-wangyuli@uniontech.com>
X-ClientProxiedBy: LO4P123CA0091.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::6) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA1PR10MB6855:EE_
X-MS-Office365-Filtering-Correlation-Id: 03ec5dd4-8a89-4e31-8a22-08dd7c258ce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ja6K5zAJjSiv9KvWR6C7Yr7zkVVdCCWdidkwlWhSU/LLeOlyVdWMA2pJ38x9?=
 =?us-ascii?Q?yzToeEJzOGYROmrUgjzY0KnURWr489IJVaGwDPygZLC0ndQMI1y/HVCfScdP?=
 =?us-ascii?Q?kjQRLnrwgiRfNfk/AWbPDX5/i4y7pMSzyaLMJP+BpHSYgCHkoxg0rNexUISb?=
 =?us-ascii?Q?5+OWtXY6QMuIgfg7e4dTyRVY0vQee+TH+d84vnPANTbzr+nzXgxYsGiqYwYP?=
 =?us-ascii?Q?yWr7ect7Zf1/SCCzPTe3xobAMA54ttJJFPr+0doSgVJVZCsqh4DfHa4S+ZaX?=
 =?us-ascii?Q?TZkGgsb4nfL6yx+aPAW+GGUfvRKsSR96IMxEnG850FK11LNN+Wx/Zls0CKbT?=
 =?us-ascii?Q?b+RPh6BuLwctnLG3b55AFCspz09E6kGswKXXIFOzIh/8ndKpSaZYOFFKlNB8?=
 =?us-ascii?Q?Oniiygd+GMPxSfDo3ezIacmOnDeNi0cwhHlzkCvMH0RDzFwc2LO0HtAjmyAT?=
 =?us-ascii?Q?8i/WGc9WqQLaLVA66LSOFowz4af++xPmn6UXiBlYPJP/FrdK8clCg7FzzjL7?=
 =?us-ascii?Q?R/06YJ0F+h3BvliiHHSTTPbP5/+k9wbbJG6sl4nIGN+rbnuW2+QxmskxoKYO?=
 =?us-ascii?Q?26ZMgZJ4kOIBumj7wIN0nDyD4wKbXORbDTL5YgXJYEWKuPdXfi+4i/oVmkoZ?=
 =?us-ascii?Q?kh0nCoak/1fxja2X1RdyA0SEmtsh8C8KckjkDyJtvfioXx5K3aulkX7aTIdV?=
 =?us-ascii?Q?7Z/KjyKlDhnGzHPL8T6fUZ0/gXk31/IDRFarpvjgrA+lIljkLGBs+T/SA8fV?=
 =?us-ascii?Q?pUTezKwwEhQuhbNqKZ3mj9lCQeM95g/0YswgeH2ODdiGGyp1qvFR2KAfI7SV?=
 =?us-ascii?Q?NFuKGluheBlUN4TH6j2a+qkG6KuBcpgKBUDyRB5LrBdVD+tUwNc/RpgiO/hf?=
 =?us-ascii?Q?76xIe18y3RMI5qeWugud0twBzcrpQPw7499QUq+5J9BRvxUgTQ8Jj/PI6Cu5?=
 =?us-ascii?Q?BjBH8mM+LvQV1A4BT5wequi+KZ688yla18i7FSj4UB9uyTlpRMRs+vvDfuwP?=
 =?us-ascii?Q?T5CQhNLj/V4Qv0wXhdThY5hazmf7TJuoL9BPLBn9X++YCsmKMpSLQIbqbTKA?=
 =?us-ascii?Q?Q7xwCrEwvgpaudz/3Om0xlblQkHWi1llir1OQQt23yd8+18/HJF6p3gtWwJl?=
 =?us-ascii?Q?aALflW2dQVkExKpDVvUiL1xCKxZqT4lgwh1fcL8C4gK5C3FxCzuF9taOoUOq?=
 =?us-ascii?Q?/L+eoEZNpZSVp6pSq4z17/yG2X7EsIF/df1VF5ZQtE1aqOwG/7v3RF64OaYu?=
 =?us-ascii?Q?rzHch5J2mJxbhrhDso1m8S2MgJTtmIpYumghg2Tva7laKiIHlyN4AMKOiDU0?=
 =?us-ascii?Q?sqLa86Fotd4oAbEnaPUKayaT2BPRzonUNHt9ZmOLpuDdZ06YtdwjnUFZaiyI?=
 =?us-ascii?Q?BdRUd+MFp5yW1iDgLAK0kB+/OqS4ZQsC1vFwAYLkqrTMY6M9iFyKmifp5kIk?=
 =?us-ascii?Q?5LWgAgpWk+A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iub/4M2MGZiVlA0d2wO9IHs8cH0iL2bjRDgnIws7De/pngXTMnyJykmXUGew?=
 =?us-ascii?Q?oBE7a0dpxqpczCe++qv83gvRm8jPWY2dVNLHEbRNkClq6VrhutDU+dGst97J?=
 =?us-ascii?Q?IESEcrcrouyLZOlBuyqciaRkBioQBoyVmk9N19sfAvRycbdFrvMWqxvXIo6t?=
 =?us-ascii?Q?EIw2nOSGN5/73zqR6BYpsjE0Kn7GgzranQ8F5iEaH5Rhz49F8mY9oa34+FOV?=
 =?us-ascii?Q?ZYnyNZIXquBCco2V8rL6rDcSZOnB9oPdcjk5q+eLuotlmhw4x3pTdkTU61Ku?=
 =?us-ascii?Q?XBdz+POKqNF+MV8Wj8T+4ZrlvsAtNPC/vMi27pOrKTn3d4hH1T5Yz+WV2xSs?=
 =?us-ascii?Q?la75B/9goGMIsT/AAyTR4Q/1td8WJv1rJwTBZ4tjenjMzixTnxNl6vAogNEa?=
 =?us-ascii?Q?60xrXjkuynHpOLEw4UzgQ37VQ/ZN9c4deZt6EdTmOxf79N26CepZIeT0txKj?=
 =?us-ascii?Q?THGKbXwPHVKcTYzv5XahQ/bFzgAExwwQyriDK03HDOK9NY3HHwyxe2LND5Si?=
 =?us-ascii?Q?Es2PephT7JCYcvgCnNHMhjo/A+IH17thajl/qlROX+27OHHkMj4f/6UHoN8z?=
 =?us-ascii?Q?N6KhNwW+RpRW/69MC8x11sg7oQTlPdyAT3Sg/q3UUIF7EDm7C9RxDBMscLMv?=
 =?us-ascii?Q?HGjed2ek7EHFt4n0jCl9E25TLy89W0If8VfId8SJ20vbCESeTihtsH1d5Gih?=
 =?us-ascii?Q?m4n2vTgZUAfwkXtUIbUN1NKq5m3ymzVNuDGGKZwBtF7pbhNr1s0rG5wQoLcW?=
 =?us-ascii?Q?nqSr+ZpAf8Znt7BgCCLzAxgaMrmQKr7x63iisy3BTAsHa8AQ1qsEHmbgyQd0?=
 =?us-ascii?Q?zHvxF4FmI+vOL+LAGYjdd4W8BpVYyX1Y+eWJUut1Td+b3oIzJlidCyy7eQpb?=
 =?us-ascii?Q?nKkI6GnkaM3HnPSUuTmz63rcot7f+XrhW/jqEAfHXN8uygT4htwbR68ES2v3?=
 =?us-ascii?Q?mOc0+ePtf/LCgC4A4GTYZJMjQo0z57XgWCbUnBTaZCFooBt0mDnos1vPm5p1?=
 =?us-ascii?Q?tPI4gC/WWkpvPtJyeJobwQirTdUhxojYZ6asM5CyQQ+AMsuQ1PUmyVsw01MF?=
 =?us-ascii?Q?SaG+udCxVx5W+oapqEk+5QVIemDJ4SUk4qrR1sR6GjA1tqgYwAEIe3ZgxEAg?=
 =?us-ascii?Q?seLPFJwC2sx/Y9S7Xw4y+fjb8xBy6i3welp1C+5UeBwdGOneEVvYIfK7t4fr?=
 =?us-ascii?Q?kpU36FT9sekAb1BXYQzPOZRi/oQAddDofMxrUAa5OgqlCHPBb67VxclO0u9Z?=
 =?us-ascii?Q?DRE8P0flBfDps+tDfqvpDzkTEcgDuIjwPMcyR8a96QEksYsRjasA/qUcMLsI?=
 =?us-ascii?Q?PbE/9ta+3nJt1T/rPXptkVMAprUUiWRwBJfRwgkjQxpDzAm3K1g4bcyfSqVW?=
 =?us-ascii?Q?Ogloib4o26DuoHlrL7bcdKiZ7W1/0uEoV21iGQrb6Gi2Ain8CE2SqZ/z9hxz?=
 =?us-ascii?Q?Vl+y24QydW732/G19HLcsluC6IxCA7MyDatJpZWfePOXjVCKLgJV0VM1MESv?=
 =?us-ascii?Q?LcN1tV4AXJdF2lf5J4AbP14y20KDp0GVSQAYHpws05aNy/69FPnwRTdw+HkA?=
 =?us-ascii?Q?JClh9V3YgnrqnKX94yEhixJCtF530REZEdn2Be0cKF6Ad4DIgbaE3tdcKAdp?=
 =?us-ascii?Q?bg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XgKahERYEzPdxJIEcLejacW3acc5EPL6YGOyusho5I40jeDWqV7IVilMp07kOV6JWrEBoZezWoeqVK6Vey2RQc3Ktv7vA19a0OrLn4nEE2Rbn261gsgJuC0zmnMgkvFurRc1uc+CCs2sFIiGmAKFh/X07y2V7wtX379JBLqCelgKkqHXQHYCWono2MJbpwv5BPXXkLW481NcA2kRpIx4Fq2iW/v9XxNvj+Knbytbb0BpKldjPj6f/2GYwoHdvHPlsI2RNg4JTlTU0NfsJzZ/5AwXn/yMd1kHCTnqkV00+WvNz0bm9EhwCiGH23hb9/IKocOkHKqhGeXaKLDv0Z5Tp5ICQIOwxNIxV90GspcHfl8fCPfH/twEyMuJDwU0L/wlTOV/zJM3yAy8LcwwI1v/ku1zHJa+g1axGMTewS0qbTwwg7SUfjnGYiw29B14u7F6m01V72R/pHLRnTOndaFu68z8LhpxKfn0gcUk9vbLTrYYUS1Sz8knFe9Ue9qa54mhMPQ2AwkYiFwFVpW1rqXphfBqPJaQYOuMI8IGp4AzNCjJS9rWGR4SzXy7xS6OPR32Ya+sJKvsxidVWFUjYR0U9cF/MSTI1cmxhzgTbEQ5FpA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ec5dd4-8a89-4e31-8a22-08dd7c258ce4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 13:58:07.7091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oaE4IiQFIJebZDTSubI8WqvvozYYzrNW3YdToU0I4mpfvjARZN2QS4l0dXl7sgexu6gRaVzuxQaBkSOg7OuRJKzH23E15wEm363HA7pOjB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6855
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_06,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504150099
X-Proofpoint-GUID: --ZbB1hhfQ6gCcQH4AKc0VZxw2cSCnEx
X-Proofpoint-ORIG-GUID: --ZbB1hhfQ6gCcQH4AKc0VZxw2cSCnEx

On Tue, Apr 15, 2025 at 09:49:33PM +0800, WangYuli wrote:
> Provide support for CONFIG_MSEAL_SYSTEM_MAPPINGS on LoongArch,
> covering the vdso.
>
> Tested-by: Yuli Wang <wangyuli@uniontech.com>
> Signed-off-by: Yuli Wang <wangyuli@uniontech.com>

I'm sure it's fine, but I am yet to encounter somebody enabling this for an
arch and saying 'I have checked to ensure we in no way rely on remapping
the VDSO, VVAR or any other special mapping'.

Because if you haven't, doing this breaks your arch.

I hate to sound like a grumpy maintainer, but could I just ask to check
whether you have, indeed, confirmed this? :)

If so then all good.

I also think we have a table somewhere in a doc that needs updating then?
Jeff, can you confirm?

Thanks!

> ---
>  Documentation/userspace-api/mseal.rst | 2 +-
>  arch/loongarch/Kconfig                | 1 +
>  arch/loongarch/kernel/vdso.c          | 4 +++-
>  3 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/userspace-api/mseal.rst b/Documentation/userspace-api/mseal.rst
> index 1dabfc29be0d..ef733f69003d 100644
> --- a/Documentation/userspace-api/mseal.rst
> +++ b/Documentation/userspace-api/mseal.rst
> @@ -144,7 +144,7 @@ Use cases
>    architecture.
>
>    The following architectures currently support this feature: x86-64, arm64,
> -  and s390.
> +  loongarch and s390.
>
>    WARNING: This feature breaks programs which rely on relocating
>    or unmapping system mappings. Known broken software at the time
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 067c0b994648..54ed5b59a690 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -69,6 +69,7 @@ config LOONGARCH
>  	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
>  	select ARCH_SUPPORTS_LTO_CLANG
>  	select ARCH_SUPPORTS_LTO_CLANG_THIN
> +	select ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
>  	select ARCH_SUPPORTS_NUMA_BALANCING
>  	select ARCH_SUPPORTS_RT
>  	select ARCH_USE_BUILTIN_BSWAP
> diff --git a/arch/loongarch/kernel/vdso.c b/arch/loongarch/kernel/vdso.c
> index 10cf1608c7b3..7b888d9085a0 100644
> --- a/arch/loongarch/kernel/vdso.c
> +++ b/arch/loongarch/kernel/vdso.c
> @@ -105,7 +105,9 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
>
>  	vdso_addr = data_addr + VVAR_SIZE;
>  	vma = _install_special_mapping(mm, vdso_addr, info->size,
> -				       VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC,
> +				       VM_READ | VM_EXEC |
> +				       VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC |
> +				       VM_SEALED_SYSMAP,
>  				       &info->code_mapping);
>  	if (IS_ERR(vma)) {
>  		ret = PTR_ERR(vma);
> --
> 2.49.0
>
