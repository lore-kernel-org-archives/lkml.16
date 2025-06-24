Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DCF2C08B2
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750779403; cv=fail; b=dffMhUbfWgzuMgSb/htCAA+wfNLbaS6O8D4slI6EjqfmhJ2M2h+UDKhP/BrW4ltIh0A2x1+h0yRqMb2TtKGLkbSHvpyQbBOgh8UDey7ItHb7NzRXsQnFgy/vT184itVos56QS/WFZ6knswDuZDX1u7e2YJItybuEFad6zsQd4DA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750779403; c=relaxed/simple;
	bh=4PAGPmZy0XdwKtjCa8bbfN4WbB5B4NY3F8nO1RoTMr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=e1wPdoGEN4FabD1gE/CPzltSPkDw7G6z72BD7vqfP1QFOmMJTNLpetgHBxee6e4hO+r7GSupNGXFuvarL6MnQpKSb9xXjFKu3eAF+j+PXTv/xY8CvVTl38yVd+19p0/aZ1EywHyEZPMyHawqSWbw0rfQOjL7+02IZFn3fyzLiF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jysAGgQq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Y4I26I+A; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jysAGgQq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Y4I26I+A"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OFN73G032182;
	Tue, 24 Jun 2025 15:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Pph9Fc7E2/ANIFcu+/
	AIdvwAG5fL+2J3IGasECCSWXY=; b=jysAGgQqlF0nrWUUt8rhbLVjUJCA8Fmww7
	5NANmVgv0EO3S6uX89oTLoMmkXJxD9bUM2fIv6L12kF+s0AQ87tbak3J80ijxbAr
	O1+rAQkc7JKqCi/ZzgIIHYcT7E9Bdo82qfLq6+yYo3tIQ4lqPA6BTCw/KxBdYuwV
	gBRp24GkiqMzd5wXLf0lvJJfMUT06BLyOW+U/l13YewODSqgnxpY7fInLyA46Eyu
	KH5aeIAb9LMC/+GZrR50z/ymg8Gz0YT17H6eVQVPq4+A2LhxPctYl/m7HjUmixMF
	r/Zp02H8YCbl443BXp1NzcmNsTgngGQOVEjO8JpMoq/aGykiZmVQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8y5eps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jun 2025 15:36:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55OEPKUT005899;
	Tue, 24 Jun 2025 15:36:25 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehq3t4pb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jun 2025 15:36:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xqZJeY+XFb8Rwxu75r+at/7rYvVBq22KUdRRBOQIEY9aPQA5f6DsikLHPFPTRCfO3h7CdL8x4GbZJIX95iaPFO0CL+RWqxWP4McTjLBIelzQFL3MH6Q/puOvwM+hROAUF/5PnH4UZs+7zQjO2INC4lDPwhHTqrJjYQ7zhqxpoHXGPmCD8aVGZv9YyPQ76LAWOdT8VWTtZ9h9iuDpD2ZffDDtkpHpv2CnEgTMtwimVFalfecmiIq5OSe2xune+x4TwzbeqOsZ7C1k5eNWIvKLazwOGJJmXbgtonXUzzh2uXijhwxU1Naj9Agfng6DBkwCkar14blwFfLADQF6IUtdLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pph9Fc7E2/ANIFcu+/AIdvwAG5fL+2J3IGasECCSWXY=;
 b=IfSfKXoQtpPx1KdivGy1krnAbnV3dx/M/7EHKQQqsS/z+BmDxZTos2vWIHthSSEszpMqeWl/yTExFQotedTVPro0njtjB6fFv4eFbtqGmpGjo3FS9dOIUhnryBRQ33b4sBXx1+v4F2Olki+1tnKwWj3m+Pc0hafUUn+l4M/A/6yTmILC09S33033aM4PRd92++5fbf4AKCYYDbdEpvdtEswbbfRxSZAeu+Kr+jj0pPGebiEUBV7XVSMtlo27MuirQ86wGWMldh2x4O+NnzbCbCQfTuTQ39atECEfvNs7STUMX8FztXblVc/XLl1LXsK2hKnWifvcemQwdSe23bDDbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pph9Fc7E2/ANIFcu+/AIdvwAG5fL+2J3IGasECCSWXY=;
 b=Y4I26I+A2M8ed4fIOxGO6DA3FiiikdhqxmdgndZ04Gj0pUf8EPhYNZsgAOziqit9fucmBHfy0LOYJLX9RoC7swFFA98RT92V2uCsa0BqCmBiWVWiRlMF0YKSCTDZj/RxwT+CKeerQ0meDNYMp11EDXXTewF/EDhG4lgupV8Iihg=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ2PR10MB7584.namprd10.prod.outlook.com (2603:10b6:a03:547::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 15:36:23 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 15:36:23 +0000
Date: Tue, 24 Jun 2025 16:36:20 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>, Jann Horn <jannh@google.com>,
        Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Colin Cross <ccross@google.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] mm, madvise: move madvise_set_anon_name() down
 the file
Message-ID: <c009828a-821d-4f88-9dd0-b8abde64714e@lucifer.local>
References: <20250624-anon_name_cleanup-v2-0-600075462a11@suse.cz>
 <20250624-anon_name_cleanup-v2-3-600075462a11@suse.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624-anon_name_cleanup-v2-3-600075462a11@suse.cz>
X-ClientProxiedBy: LO4P123CA0669.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ2PR10MB7584:EE_
X-MS-Office365-Filtering-Correlation-Id: c6dcb5f5-c5ba-4c4a-3b23-08ddb334dfba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ww6A5qsezufe8XKPIBrzzQpw6bpe8vOyy2MliA2M5qZk8hWG25dQThvJmNHf?=
 =?us-ascii?Q?Quj9bZ9XJwmUXO0ZfW7HPoiNnFbN5prlwoPQaDN6coimgxVnnUsmlS4TwY61?=
 =?us-ascii?Q?N7eUBi3jH+GytL2c7pu5okMD6eyMYP4HlHyjbPIUOwnHiZHqZn8y2+VieQv7?=
 =?us-ascii?Q?Fv1Y3jHUfxm6kTWFniNck3pIkGa32K54H2BGtfvUoyJPOxHkvvzKZhZSxflx?=
 =?us-ascii?Q?rBTyymf6v2aaTbeQkRDl4zo8RPGCavyFDzyeULKp/wlyy1KZzt6uA5imfnIk?=
 =?us-ascii?Q?raYHw0XVVWcL9fsH+9nDIxFKT+otj4/HnULf98oSJAEHnnusbqdHcc3LfXEV?=
 =?us-ascii?Q?aHuoMFVuMeCPmwxJgcE0sqR6wLmC0Wd6mFyrk8RwBTyAcds6FCWcVG8rCMvK?=
 =?us-ascii?Q?f18TsxvNV2D5ngsXgIQyZhzsByWMNogQ8NFfsYoaFPRK0CV2Nd4LYOIvfmjP?=
 =?us-ascii?Q?YEk7fEhs1ndORhSt/3eKqc5/kSoXKS2RTP+dII0n0Sh5FyKyMXMglRDhpljS?=
 =?us-ascii?Q?usUbflmcceJ02aLTfFha4UE5V2AJDauofY5j2mFFmzTM3KRrmwMe/hqmU1QM?=
 =?us-ascii?Q?8R8ZordLA5SNU4ckAqYxZR/AtsV+3yuQEjRMslbTTCTUgppkvQRiJM4BxYVP?=
 =?us-ascii?Q?oX1k0AnKrC1MHmmf/a7Nl+OUgBLuQx7Cz69hoJgQp2yKZjBqyflkWt4rvijU?=
 =?us-ascii?Q?30dfQQ4su/+NzpdWW/YSw1lPR/mLrECz9SAPNJPS6MeTUAeT8ML7NxnhlSG7?=
 =?us-ascii?Q?ss05Eap0vrU5hUz7DIURxI0bPL3kUCZ1AyyC8oozOu1oSOLwlbXk1TM7I2TP?=
 =?us-ascii?Q?h3GCAF8dsvUJ/Lm0Kovv8RsPd+OeDiYdr0EINJY/Hy2lhlR4b1eq6/qmbuOf?=
 =?us-ascii?Q?gLvw3MaBHGrCA6Qj1XRJ0cJ6ntt/h9SOvjD9KRIZ/YS2ARcFXh7QwL1c42Fm?=
 =?us-ascii?Q?utCkohNbuu/I7U5Tf+UCmGuQMlppBkIMNjZEoNJe8cOStM2bXzpNYf0Qi7bx?=
 =?us-ascii?Q?gO5vWuwBgKS5vv6rUvIw9JGYR+no2aIMFFc7Y3zTLgySibvnNb65GZ1nj6SO?=
 =?us-ascii?Q?zXIyLM4WYLZExW1O5xVDWJWf0FsYIn/xH2B9XtqJBdS+dQjRpjthT6NudoTi?=
 =?us-ascii?Q?0iDS2RhO6IWYf9ilF8V2uYO3/hO/D+CECV9Jj2y9RvCP1EH/QXonQnI0sYoK?=
 =?us-ascii?Q?ug00MnBk1Ri3G4K1aRbxhTtVQ7uyzNTai+5MU3eHzOKeBMbsPMtUXyJsEaWm?=
 =?us-ascii?Q?8ysRwuFAS9RNWkP57Yz+VETzsC/19dQ3ZNX4xTQqiHnmOJcxJE7U5wmSqsGs?=
 =?us-ascii?Q?v4vCHZi/kGwG1lLoYoZJQpDxFYF9SawVc7RY20uPUv9qRmcpYbN+cRzxEENb?=
 =?us-ascii?Q?+uxF5WnLEFu+rpju9POev8xVlZsekuW/O2h95bTmVktO1taKH6ReRPOMtw62?=
 =?us-ascii?Q?Io+51Lbffc8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mJRfw1YL9GEDuK6HN9Hng8pGfSTd5TVu21PrfADtI3NNdswQbxFPc2GPcGEJ?=
 =?us-ascii?Q?+K3RmKKsi2GMYTTWqKtqNs0f2GqRziT1fSbpsz0cDHTCnhTFTuVOApOC3G/v?=
 =?us-ascii?Q?myb3ap2r9xtbd1OJhgv1tOUcBFbIODuiZlpKaqe4kFUpnmeopSoQrDt7zYzx?=
 =?us-ascii?Q?Z0wTKgemGHHsOGxmorz/QZ2MLtw/iLjWNu9jbK2nKEiatZXg6SMuUPTdUI3b?=
 =?us-ascii?Q?bcPY9IuXSEFYVTIxn633nAndLLF8KlhpvJIk3dqqbHrd5wJ/vdNEC9OPUQIl?=
 =?us-ascii?Q?blG3AG6ghMpGFxjFL1gneWH2wneCPLs6/goebGd29d8d6SNTQA7VEtO8fvAv?=
 =?us-ascii?Q?Q3YhkC25Q5WXIVleVBOkvDsUWKynWsPNa4g7bBQTtU1d2y5NHPgX1xnkQP2i?=
 =?us-ascii?Q?sWj+oSF80B8kXBIzZdkwjUA6IAT54wo9++8fPatIEld6t7YTjrhvAJosvGwI?=
 =?us-ascii?Q?tde1WWl6ijSBO8vDkScldhKxc9dulMRSFrAAr9x3kLO0rl2oWwpypt5HUcbh?=
 =?us-ascii?Q?t/whL1boQiiUr0KeVN2fbY5pnmAYOtCQc7jYlCgyZs7Q6jZkZMdY3MGzkaJm?=
 =?us-ascii?Q?wlBgrhQOmnhFuMX0YJvpKZalLY7xJieLMONt0EC5pt/82HY/Ru6YZtlxzmWL?=
 =?us-ascii?Q?RvF3RYVIqt31BAbEMEnp6tHY34QtvKB72N4THFLsA25gqhgcWBLgSCxsZhi1?=
 =?us-ascii?Q?+pNMl5XhL1narXf7y+d/UMOuv4BSEOv2Wrm4WvqDaPi4sLxi1+5oVyQfIzEh?=
 =?us-ascii?Q?RvhOGFuCaoMQhNG19Lktlzw6a9VGnOfUE+2rd+h8nCxsTuMqsdbrjPkZCZ5q?=
 =?us-ascii?Q?lnDcewK01f0omPejoXP4Qro4qlYucOztlIy8HBlHKZjTmbt4N5vz195PT8BC?=
 =?us-ascii?Q?DkshufoRYHNMjrqHr3c0h4LrNoVRCbQisq6HyZ0AE8JOYtdpRpubda8TnmIq?=
 =?us-ascii?Q?uzjbq6wS0dM4bnIDTsJSwAT9jQM2vpjDcPIy7T9NuBAJOarpf3GlE9/Oed3T?=
 =?us-ascii?Q?efwpeIy7zXjOEULizocSP9P6+qEl2iNBVx85G44+UhzEjmngXVAyP0x0ERex?=
 =?us-ascii?Q?JQM+BlAZAn0dvIUSP9yRSMFvxmlUWY0vUFb+VR+Pf4nvLR+4YRsESnhICDay?=
 =?us-ascii?Q?2J1gOPfYO0z6521FpTcuWg/4Btgiy0IhmQm5VNPHfaKZMSM5PP/vF/ySxpAQ?=
 =?us-ascii?Q?qNxmmkwJX7WC1E3RlP5QiCs29uyJhCE+kwgYRJEyCuTpZ7on32QvW5YDroOm?=
 =?us-ascii?Q?YcUTSpndwHAQZxTBKgp48/qhEs1jK/Eu+ljQLUBObX4gBlPk2Ob82/61wCw2?=
 =?us-ascii?Q?QLat2mYJLSjui9qvLtdX79UwwsgYhwArR0GxKWHAtuDiM7PuFLRgwFD7JHWJ?=
 =?us-ascii?Q?Fh+QCePL7N5LaKdClkBHavR5YpCwOK4g2jxYu9areFFeDBMkhgjvlzUC6w8l?=
 =?us-ascii?Q?EaSDS0Qf3xUtYNd6KciFhjvYSpJxX8bSVFf9cskqDwJLCV+gVXptCfRinRiB?=
 =?us-ascii?Q?FEadEYvb6vFGqrLC8nnqUrbgIduSDulR0K63dhNx8GK916SF5II5wITm6cFB?=
 =?us-ascii?Q?hL5Lv7bl3mM8WshTo4Op++ezaQSDGDy07fet3UMbbUhPa/aixnh+z9nGcrVW?=
 =?us-ascii?Q?4g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BXEs5OfX62ZJHVUfSI4zNnza1IESPH/Xfw3zgS1YiDLeUZX1TEJC2ANMiwQRbTH9LJZMq9VuOFaTgmoJUdNtvt5OwTIX+Q2xW8cl3Aq4sYER/12zzNp4lsXpkd2n3KOQm5cRScFjgMwiGYWC84bQa0905JUP18/6qTUWfn2SieKWhoDZiS35pCtBbrB42FxC/JJM9E/cGrsakIe22PFP2fxXn8/T4yxaG5r3lbJZpQAXzCeMQDU3MfcUCVWfubmfkplPMLANiCfptgqJQytzBJkXOCPpJZVgPOp+OcTAP5HHTlujQ1zAfLUoMOpxet7GLER3/yNHqLrHKAhVALygGjdwLXX7eiHeK7yEtbdyBoxa0UOlBHEbJi0S1NyTNiu/s9XWBAaPpaH89YrF9GsdfZCiNU1ukLiJDa9HlkMH1YGMPE2H9HkOvgZq2gHsoAtjcGlYjUk5dhkzflpClv3T4rp834GafaKkQtWq9qlqeVq4cwetD8txbYWTnumzhWGbJ536q9PH0Wh1uUtsOQDcbpjvlBRqRIr0NcqpTFchwI8Cij/JvfI/TCIGqpWwPRHBlffSp3tRySotJmSpeU05qNw2yCGicTVEfZTiCiZmjFY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6dcb5f5-c5ba-4c4a-3b23-08ddb334dfba
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 15:36:23.0579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q3b/UXccdMKDFbpoDli7wKL+gr1hJOwOeupWSceVij1dHt822B85ekdONGd3sGXL6dwG/vGcnd5DwUAoY3pLBBip9Y8Epj7pAK1gLFjt0ik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7584
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506240130
X-Proofpoint-ORIG-GUID: Bd0Pg0TEULRA_2C-V__Cr1JMh63kVlsn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEzMCBTYWx0ZWRfXxZYmTDi7LOj2 94u7xqQGn/5yv7T1GqD5UG2fzbaeChChaUY9cKl8Zcz1lL8S7haL8wi1xeMnfvrfV/+rnxTXOly c8AxLmq9jYKDvejZrEDtAELv667gozfJV7vQ0F00L2NaCf50sH/mgOmpjjIeJvgBk2gFmMsX1Ch
 VNl6yXTG0PxynfX0aJEUAUzIrfMh/3EbE52Tew1L8at2WcCi9yqCW/AWhJoAEdZzMrsKRVc965b TxBOe8voKpQNwY25Vgb0rrgp6BTweWirHZ1NhbrWCZhs9vA9D86qAWqVktstSdvHLJACZ8NWnPy 55UXW6c4a+mm47xw5fwaIu/mG1XJn1zrihwaL5p7c47/TGJmfTTt1zqq2xiGt/gsJc86osRHmXO
 Dqo/u5hz2wJMZ7IFYeQzCqOlxGFp7A4LnxJBui3GsT8QK30Qij7ygatWgZyviAPKH31ZsDyo
X-Proofpoint-GUID: Bd0Pg0TEULRA_2C-V__Cr1JMh63kVlsn
X-Authority-Analysis: v=2.4 cv=PqSTbxM3 c=1 sm=1 tr=0 ts=685ac5fa cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=xjyKsPYKGNYMRII8yeMA:9 a=CjuIK1q_8ugA:10

On Tue, Jun 24, 2025 at 03:03:47PM +0200, Vlastimil Babka wrote:
> Preparatory change so that we can use madvise_lock()/unlock() in the
> function without forward declarations or more thorough shuffling.
>
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

Fine, but I think this is small enough of a move to be safely combined with 4/4
as David says.

Either way:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  mm/madvise.c | 64 ++++++++++++++++++++++++++++++------------------------------
>  1 file changed, 32 insertions(+), 32 deletions(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 7e8819b5e9a0f183213ffe19d7e52bd5fda5f49d..cae064479cdf908707c45b941bd03d43d095eab6 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -133,38 +133,6 @@ static int replace_anon_vma_name(struct vm_area_struct *vma,
>
>  	return 0;
>  }
> -
> -static int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
> -		unsigned long len_in, struct anon_vma_name *anon_name)
> -{
> -	unsigned long end;
> -	unsigned long len;
> -	struct madvise_behavior madv_behavior = {
> -		.mm = mm,
> -		.behavior = __MADV_SET_ANON_VMA_NAME,
> -		.lock_mode = MADVISE_MMAP_WRITE_LOCK,
> -		.anon_name = anon_name,
> -	};
> -
> -	if (start & ~PAGE_MASK)
> -		return -EINVAL;
> -	len = (len_in + ~PAGE_MASK) & PAGE_MASK;
> -
> -	/* Check to see whether len was rounded up from small -ve to zero */
> -	if (len_in && !len)
> -		return -EINVAL;
> -
> -	end = start + len;
> -	if (end < start)
> -		return -EINVAL;
> -
> -	if (end == start)
> -		return 0;
> -
> -	madv_behavior.range.start = start;
> -	madv_behavior.range.end = end;
> -	return madvise_walk_vmas(&madv_behavior);
> -}
>  #else /* CONFIG_ANON_VMA_NAME */
>  static int replace_anon_vma_name(struct vm_area_struct *vma,
>  				 struct anon_vma_name *anon_name)
> @@ -2109,6 +2077,38 @@ static inline bool is_valid_name_char(char ch)
>  		!strchr(ANON_VMA_NAME_INVALID_CHARS, ch);
>  }
>
> +static int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
> +		unsigned long len_in, struct anon_vma_name *anon_name)
> +{
> +	unsigned long end;
> +	unsigned long len;
> +	struct madvise_behavior madv_behavior = {
> +		.mm = mm,
> +		.behavior = __MADV_SET_ANON_VMA_NAME,
> +		.lock_mode = MADVISE_MMAP_WRITE_LOCK,
> +		.anon_name = anon_name,
> +	};
> +
> +	if (start & ~PAGE_MASK)
> +		return -EINVAL;
> +	len = (len_in + ~PAGE_MASK) & PAGE_MASK;
> +
> +	/* Check to see whether len was rounded up from small -ve to zero */
> +	if (len_in && !len)
> +		return -EINVAL;
> +
> +	end = start + len;
> +	if (end < start)
> +		return -EINVAL;
> +
> +	if (end == start)
> +		return 0;
> +
> +	madv_behavior.range.start = start;
> +	madv_behavior.range.end = end;
> +	return madvise_walk_vmas(&madv_behavior);
> +}
> +
>  int set_anon_vma_name(unsigned long addr, unsigned long size,
>  		      const char __user *uname)
>  {
>
> --
> 2.50.0
>
