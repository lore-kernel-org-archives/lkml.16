Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1746C15278E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 18:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750098075; cv=fail; b=PMCiaoRs6Cwk7vH71oES745OpLLhZQPm5GeCphnx9TXcEavarffpDP+X8itMX62Qm9ps6nVNoN/3MqVnZHY30uK1NWuSEPO6fKnx+nX8vrlnsQhC7yP2n9ErqbGiJbebFd3EFBMNr/15EYgcfSSFHLV3jOjzyZuE6S+ykIu6hAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750098075; c=relaxed/simple;
	bh=/pWYXHCIFFh3xtmN428twZFbyXfC2NFBoKINnfyJn3k=;
	h=References:From:To:Cc:Subject:In-reply-to:Date:Message-ID:
	 Content-Type:MIME-Version; b=bZAtggQ+GFozlWRLvTNrVKA3/Ov7PRTH3iP2+/tkHsNI8/t1fJRz+m5+K3sthYP7MzyvBBxIW0TtnX1fB0ONXzk8Og1r/EnD8FPQEG28xTyF1VjHU1uANQaOPuOjHMeFGF+TAPdXBMELZOGZ4uOXqLhDUkxRkz/4/eo+yAhwqZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Dfzm1nOk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uvWKIcLd; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Dfzm1nOk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uvWKIcLd"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHuS5J017344;
	Mon, 16 Jun 2025 18:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=/pWYXHCIFFh3xtmN42
	8twZFbyXfC2NFBoKINnfyJn3k=; b=Dfzm1nOkcIF/Yl+qGg/s6eQfvu1F7eINeQ
	hYOLB+Rg5/NRBImL5sxT3R6vWHQsjU6lrqJNoZV1XA1NPc0EAxGD76sfOanoOW8g
	YQlLlTkSUChapNdVs3nRBFao7ndXzSZSacC9a1KcbyBgemJBAvGKFrjdUW2sxxwc
	T9rFSM6OXYnxZV23JXB+cpNYX7/gnv9/+/u1DxZzBrWOknsMFRr9Jwvh2rikiyTS
	ETSK7xQl6GZYqHZ38RW4/sI5QCZR2JiLqbhJIlBN87+3uhg8p+TrbdHCLb2tiHN/
	v0E2EE6xebPwaJKvaievTLMZrGqwXjKzzhxphL7FOZM0hoH9lVdA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47914ekdyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 18:20:48 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHMt1H031603;
	Mon, 16 Jun 2025 18:20:47 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh8124s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 18:20:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=meagW1yb73A/7amLnkZX6NvEpXHhFJ47/RwvYm+w5/9/+sf+o2odXpelVo+C4uZTFEJ53EEaThQUamBcmz6DdRVCgf4DmOJ+M83M6xWuGomwSyodAQ3UcEc0/ZhBhxB2rtNOvFncRAdcWpLjLWvsRJ0EaO0D1njRkRH/ZjxEPUjye53k8xYmpR3TjmxHil1e3lnPjZKqRak4s3W4s/w3hxSTX/CCJqlGdDyFHMLkO1KMJ8O/xAWgsdT9UB7YmxPLuZVyzLbwl8PplK9Y1szrIQ6A2VF5xWxTlVb8y1IWliLQWdj9fu8p0hhAmeUO0cvEMHJV220QyqKv3VEiKP2wkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pWYXHCIFFh3xtmN428twZFbyXfC2NFBoKINnfyJn3k=;
 b=RYOVzUP3wPH56IpOVnTJaf76ZR7UKMYF4FTOfFCZ6ULP1ylVkJCiRnoIS/GaKM56YrzkEKUnzE4m7A07v0UbDuhcJ4IKeXl/wP3g2lRl5bp2s0en9NcVUMxt/8RoKW/94xgF9cudfYoVXGKWQ3wL62oXIq++Z7uWn16ShGbxMvKqkWorGqL+wMTaDqjisbAfne6a8zOxjnUFDdAJjyMrIP/kJwd0Dmi2IJD+aibksLtuwaKO6vFC0kFFwzzTVy8thqrA51jrMlkGsFkh1VhZmywgp2vxekPry9jPAHZzPl3v3QRIOuGjTxeLXGrTfNIGA5uAt4gySHXZIcbhFQQ1TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pWYXHCIFFh3xtmN428twZFbyXfC2NFBoKINnfyJn3k=;
 b=uvWKIcLdIYqRORNL5C82Ei1U2BJrkixI9Cph5gTohJAO187HN7kljn3fpXC7WbodifgpmzCw4AJ+JV3sRj+FJ3wNKDB3KYqjSTGhy2aVQpJ7GOJjhObqffRWtEn9KzDJh6v/FD1DJg9eP/veIrFa/txDNZM+MzEa1mztQX72TYk=
Received: from CO1SPR01MB0016.namprd10.prod.outlook.com
 (2603:10b6:303:15f::20) by SA1PR10MB6518.namprd10.prod.outlook.com
 (2603:10b6:806:2b4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Mon, 16 Jun
 2025 18:20:43 +0000
Received: from CO1SPR01MB0016.namprd10.prod.outlook.com
 ([fe80::16ac:12c3:7112:db4f]) by CO1SPR01MB0016.namprd10.prod.outlook.com
 ([fe80::16ac:12c3:7112:db4f%4]) with mapi id 15.20.8722.027; Mon, 16 Jun 2025
 18:20:43 +0000
References: <20250616052223.723982-1-ankur.a.arora@oracle.com>
 <20250616052223.723982-14-ankur.a.arora@oracle.com>
 <1c0d3994-1397-4bc6-bb55-9c26acdcb477@intel.com>
 <20250616145007.GF1613376@noisy.programming.kicks-ass.net>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Dave Hansen <dave.hansen@intel.com>,
        Ankur Arora
 <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, x86@kernel.org, akpm@linux-foundation.org,
        bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
        mingo@redhat.com, mjguzik@gmail.com, luto@kernel.org, acme@kernel.org,
        namhyung@kernel.org, tglx@linutronix.de, willy@infradead.org,
        jon.grimm@amd.com, bharata@amd.com, raghavendra.kt@amd.com,
        boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: Re: [PATCH v4 13/13] x86/folio_zero_user: Add multi-page clearing
In-reply-to: <20250616145007.GF1613376@noisy.programming.kicks-ass.net>
Date: Mon, 16 Jun 2025 11:20:42 -0700
Message-ID: <871prjzgxx.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MW3PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:303:2b::16) To CO1SPR01MB0016.namprd10.prod.outlook.com
 (2603:10b6:303:15f::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1SPR01MB0016:EE_|SA1PR10MB6518:EE_
X-MS-Office365-Filtering-Correlation-Id: 6382e4a1-6025-430b-e8d5-08ddad028182
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VSKk4ttBiqdjOHzznJ+6n0itYodoGLEh0Ac79nFb9zAbARkUXgECysGTkmSx?=
 =?us-ascii?Q?aOx5KwSPbcJPSKKQ3gkrqM9B/3ThWFLak1iSuWQLWgpM79LssLcPZ5K/N9KC?=
 =?us-ascii?Q?EN7ksm1OxD5uvoRAA7035Bt6HOQKs4hl4YKH+LeqtUIr9SVo1I38s8nMYdUF?=
 =?us-ascii?Q?WocvXZlC6EFrhdOvRNeagjAfoRtKuU8sl0hHYhLPO5x2qS4rCWv4i+/zbai3?=
 =?us-ascii?Q?+NkUG3tH8xYF//52Zf3uQekGVKh8TLBt9WrFWgQLNf+80p3sbl1vzHf/60si?=
 =?us-ascii?Q?iOx8TPsY4GOsCkcb4WieguGpL+39nDhhJNCWkHvVJum/A4QZuWQgAtiPNF+O?=
 =?us-ascii?Q?QVvIo9iVcE3O+2G8S3ICK26TDOLKToHa2M2M38qQv+FkRcHggxSDgoNU5LAb?=
 =?us-ascii?Q?aOvTpf6XjAVdDRgQk81nVpN16zZ2jf/s8HDbRvQxyp0xsuBIT4nqgQC+Ry/3?=
 =?us-ascii?Q?W1zvI1ERJq79BqvoUZRIQTEtDLETip6wMY4Hhxl1B0IBFYfiP4BakGJSu5KJ?=
 =?us-ascii?Q?Zqzi8eCiw+j4lZZvGuh7PIN8lNeLwa54P1i4ydOtcXdm5BVFrUgTiKrsYWMJ?=
 =?us-ascii?Q?fXOmpx7henzAmF3FvX2FUjA6AWbIkNlMx6h/oCCjs/Rybp0h6GlyqEvARQMy?=
 =?us-ascii?Q?2T0+IDYTVKglURmXo7WRX78/VlGf3vcbyJ8HQvMp97kkMAQwoSB2bxWn95B2?=
 =?us-ascii?Q?QjSNhop3YmE6oRJ/LZb0uU3H+NV5T155vbvo3PeQh75EEla8YZWXKWAwATiH?=
 =?us-ascii?Q?/fwp+PYFA/cS/bK2Duw5Y73lpnutDFJSWFvklbYRY/XTO7xRsNDivGEZE0Pl?=
 =?us-ascii?Q?BzV23mu9Q5rAEc0TWmojB3paKhafoBE46OS2Ab5bXCxAzq8nREHgJcB5M3Qv?=
 =?us-ascii?Q?oE4PSY3du8nOs3BPxGPRuOXW5Rmc+d4fXQe/YxJ44B5IhE1i+TvjvSxjtNw5?=
 =?us-ascii?Q?W59QOUHhl6x3wHQmK2XlQ4yjISCY9hZwwn6MptJQ7FFax/ly+DE4InR7pG63?=
 =?us-ascii?Q?+72PUeXsifhhnkWmavWNIUlp4vP/TJ4ZnNUFRDO3YUl3hBxP/x1etBYln7kM?=
 =?us-ascii?Q?s7eHXelUYrytzJW9Aoh9WNF5/d+h2SCB+UxzHSoIaeGsr2aus+1xopRuHXhf?=
 =?us-ascii?Q?8Yb7IolEo6ZExSU4621M6fJLlxuBrp/FppAISoog0q8i/JGl4sSMAkmzBwGn?=
 =?us-ascii?Q?kHC1HjIslIoO2pqwSRink9PqPvoQorDOavDzA1lcg6bvFFwkT/306QiO5ZuG?=
 =?us-ascii?Q?jK5gL0R34ppdrE5wCwJ9C/ZQ6Ix+SilF3SO7RPb6F1+HC1d5hCvm27ctpCxz?=
 =?us-ascii?Q?Mj6RXex+O+j/JczSDDCHQrZDxBKP1RNq/INSenpT6BvTsWOh9m5ftiyjPHED?=
 =?us-ascii?Q?18ckXwUeDC0DI0iDZNtasaL2bc3Q/HS3x02oTGdshV9kPpzhpaGc9Gp2WieR?=
 =?us-ascii?Q?UzGLpmUE8c8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1SPR01MB0016.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3MFm5qlzcMtEKtPBxpnV3TVM0noGxa4XmJJlSz4V5izxy3xxet4hBmiDt1bd?=
 =?us-ascii?Q?EqRYLuZwHFKhKzNHK+5brOcOzyJunqEeMeQJ6gmxKo04AppzPGQPQqV3dJZI?=
 =?us-ascii?Q?psbcHuXX2QhEwr2+NrlvZfJnBC6FBDJp6dKIasEe5gLL5mnAZQAAbJagaL47?=
 =?us-ascii?Q?9cHN8Fa9Gtj8tH0/JJeIhoE2Prb2FUbr0SDisRqy5rUh89l2MEkKP3eMzLDs?=
 =?us-ascii?Q?DwqnNbxc9yPTP2oGpkPWCW+0VQ/u/9d7h2bJFoG1q8d+3nQo/+74e9p1R2IK?=
 =?us-ascii?Q?5HTpgLqdgtlegHunFu/rEhSgEm0FNOAcxTryzN5FaduOg6Zt16evVZ1LGJPh?=
 =?us-ascii?Q?4AMc6ZcHnZeUb0HqKN702zB8oEVAoMsZguvYTSxHq65hJpsusWstMDWEQa7H?=
 =?us-ascii?Q?6ZwzIPSuawYzt5BzoMHGvG6wggqlkbYYj2ybnycJFDXxn7hHcaYtG6RueIH1?=
 =?us-ascii?Q?2FY7p6LOoZaohmSaGJYYYVqfpHKRv8Wo9FYygq1cZQ3yL48Ve3omXyE0Gr+L?=
 =?us-ascii?Q?j5fkdQYc/Z3uGDUntzf9kcKlSu59v4Vr4Ucwcw6aqbTYw+StnrT2ilwv4so5?=
 =?us-ascii?Q?MntrLuASXod8j3du58vgc88sZ/ql3Eb5dH/kKFWbqEYl0ecnlfBCgjIxxBJg?=
 =?us-ascii?Q?Pz6UXzcyCRg7y8NeZ8UHzXmxMF2nXV5uxX7uYv/U1hjNHE5+c5V249YXA2qD?=
 =?us-ascii?Q?GjNmF9RtI7b8Y5CUYkJbKT4ANmP71aQp7V2Dnquu+ktEymLg+V+CFy+uNyo3?=
 =?us-ascii?Q?6Viz3z5oqLm06H2dZ3vZiJloccabg+v84i3j/dHSOs3uzn8ylfpqxDtcI45B?=
 =?us-ascii?Q?LRGCsGDGSMQJe63QcxcXVpgltV9cjjubusKaYnPrROXKAEPNtlWghSrlUiQY?=
 =?us-ascii?Q?6AIo+58+Ez08XMnecZXJpThVKMWlFhz+cVWMEM+TuZQXJivLG2NHQSCUQwiM?=
 =?us-ascii?Q?mKsULrB9hWqBaSygSWSGfyHxP7CHZ68U3stSKxoojSpugUjcDHQaCjfkC6Ul?=
 =?us-ascii?Q?oQSNRVu9t69ijxUzYDZw663T9zr4jKBRzh170iBxN53g0md5akYOQMLfeyiY?=
 =?us-ascii?Q?wH3kbOiMLTaFdXbadSkkRcenpdoSE5YWQcbdXfKjnMKQx8fmE7VVWXA0z/l+?=
 =?us-ascii?Q?1op1D9IqTY2rIeCjbIFN6Pyu5GQSVRgxU8MfG+453QeIC4W4nz8a8+LVW0Dr?=
 =?us-ascii?Q?ldLHOcPwVf+KLp7N5TA0lI/aBhC6kmA4DomVXrT6yjkQbSes9o1tTj3mvNSm?=
 =?us-ascii?Q?9YDzb0o2ko2NhfHCh5X3VmppKaJuussmNNVQPPa7N8EOlf5Ty4t9itDqTlus?=
 =?us-ascii?Q?TY/P8RoXfmrXM2y5daufHgLH9OYj8i6sm+759mOyBsdpnodAZwdF/sVlrHdi?=
 =?us-ascii?Q?kYTyVhYuV4XMYspP8Cgnvv3qhleS4IG5TkKpLNJ1WjDxhRHPtUcHVwoHJp6T?=
 =?us-ascii?Q?2Ks71P3fYPjo4oeeXJKLyVq+7W0uQHHuMLWuwtGdIYParKNn38dA6TaY85qw?=
 =?us-ascii?Q?UDxnId4K3sUxBV4SRNxeqVUHd7Bn5wzPG7ZPbaEhdDv1R6YDSojUD0Ug64qa?=
 =?us-ascii?Q?zCDaevF8E35xA+8lDhrsbiLqcoidiDjqPsv2UqtnUlO4PrwkLOvAfijPfq6I?=
 =?us-ascii?Q?Jg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	B5f9Uj0P/OdIaFJPcnx6po16MyK2X3nesCfdF/0TbJC8S5JK5JqfixnIQX/k9zc6vJvrVKh0YMEzb2zHbf8rrClipmuj8t8abH7Gg6m991K+h6XYMAECKSKXbfgxBEUNy3IHtrxKqckaTVP385RWLp6SdSQ+2M7ixSD5+3A2bRjimRp/+7UrunRh+tt2Wm/SwBr3PUQup79hUzFXEzy7xEg6/nK4l2K1v7eZ+mea9Ij0tSCxUp8RdXkq5VonJI6zmTHpA4hFMEsS9M5e4SSpW7EK4SlkxjGwOBz7EKjfYV5/SCMF9GIOhiMC4v//LUp/fEAGHmzZNMEWLMGIFo2h8MQMl+60hy253M2ml7p2orJbmebmf1QWfoPbHH7/g65VsMXHKUDOoBEG5fMd+jhotNve4wLYuznfTHRSKCHXZAhIjeuglbYJc15Fic4Bb28Ltek4H+tZs+/lzF2vaM2j3n7jXwZgRNiyOTkPTb1IzFGhQJAAtOBAENdRDbdQhu0AqqW7czlBYZZME2ZCu+GAAQHgptw/SBn9eCLfjLOaWqF49dot6zUMMc/Z/ZEwMe6d0t0v7Xo5WDN7zleGHC6fa5/ijP7jnJp823rp+Cbh1RI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6382e4a1-6025-430b-e8d5-08ddad028182
X-MS-Exchange-CrossTenant-AuthSource: CO1SPR01MB0016.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 18:20:43.3512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fan7dr1BR61WsEpgFxuSKLvNsOl5w7XonQz5IHbBnhZth0ZZAHmGj/uneJ15K8ZOqdwIyR2aSA6dU76+1QkYgSu2PW/f62hsFZO60BKIUEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6518
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxlogscore=849 spamscore=0 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506160123
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEyMyBTYWx0ZWRfX1NfvJp8i+Wkv wG52jrjWSjPhZVyz+ni1iZ8uWg21SAsA/mduK+dKUzFVFPOfV9MEjKuCmznvIey8Z8ojSFfOEmd jxmLDNcyKxICrKR8pMprTRkwD7zJcXtaMG9JA2OIHppraVqQ0f6YVNA95DIOU/E/6I43xeCBmp6
 vFShzJXRjK7cW9ELct5pqu64XUlGA9bW6PPUsleXhLypEn82WuXx0Mp1q3QIi7qTfpTBbY0vRUW nJ0z1363Ydn7vhY1CQhamkQ6JErUjqFdnbjwxj9ZeC1+1YY4jG+Rv+P2grghpJlvX3P/DOeRgkU g+KJ1TXhVYMyNFLCbBVTh3M6TEi4MwYCnBhaz3hLkpJWF6gGOKSwZv56fopHrdXYH/OkH1U7FyD
 phAV+tonY6+dtZcsZdwR3RNevXeJzNLo7YazBva4pG8eFSPUUw4SfxGPp/TZw8gmEM6UPr6v
X-Authority-Analysis: v=2.4 cv=U4CSDfru c=1 sm=1 tr=0 ts=68506080 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=JfrnYn6hAAAA:8 a=Wj5wDGThrUsjRSlZtecA:9 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: _yw3a1XtPlq4OVqOOUkabpGgRB7sdQv-
X-Proofpoint-ORIG-GUID: _yw3a1XtPlq4OVqOOUkabpGgRB7sdQv-


Peter Zijlstra <peterz@infradead.org> writes:

> On Mon, Jun 16, 2025 at 07:44:13AM -0700, Dave Hansen wrote:
>
>> To me, that's deserving of an ARCH_HAS_FOO bit that we can set on the
>> x86 side that then cajoles the core mm/ code to use the fancy new
>> clear_pages_resched() implementation.
>
> Note that we should only set this bit with either full or lazy
> preemption selected. Haven't checked the patch-set to see if that
> constraint is already taken care of.

It is. I check for preempt_model_preemptible() and limit voluntary models
to chunk sizes of 8MB.

--
ankur
