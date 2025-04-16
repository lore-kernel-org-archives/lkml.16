Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F50238C36
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 10:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744799963; cv=fail; b=uAvVlg5AL4ylSxk7OuXv0jCsoL5Q9S4+xX7TSR+zsxSEF47UF2b5wfYZ+6pyQcUH/UABIfO7e7FREPnWIavlt8W7j+/LGdS4hXqbsXU+Bpa+7sySxKTxO5yD0p81C5ZaY6Oj/CLM3umB1v939nE3Oum592S3SxHQGUj7KLJyjB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744799963; c=relaxed/simple;
	bh=U0cYx5Lu+rkWpxA7+d6Pnin8sJyizVoJAxakRNDIe2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y069kQNJSp/KAsQ/tupIDT3alf+NEGRIAGMx6wQHyMzSZlNXyqqKKcTJ3nJK7miCgPG79eh6MPLpFf4kxeJr1iFe2C1SwZiJ96F3BF89YY+m2FIZ4svPdFwzbW0Ghn/xPQ/fohwyFe6py/fRUSWZiJPhk0L7gah9c/DyGcLrWts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JmJ+3Xh7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Mf+cCTfH; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JmJ+3Xh7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Mf+cCTfH"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9Mp7W031339;
	Wed, 16 Apr 2025 10:38:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=fDKk1GjDgLOi28YjcTBzkc8QK0HIn4cA/j68CeRKKL4=; b=
	JmJ+3Xh719cw63hNak6NLrRgKBMKLDxPyAKrfa47h3p1Lr7tUnPEwqD974bH3MXt
	34hRTvHcBc/MVkj1+DISQJgu8+RXUKbgvklBprOJwDNYV1XqlQld3u/MIuI+SlUM
	EcFMjPMPCOtdKx6TTNazyMvwQwn7KlhPIq2w+D7I4yNLH5FCT5H3pihEVZrw3z5v
	0VCkUazuhvEkTf8s19TEbNjHVxy2QZPc18cVhcQO0mBoR0r331c3pw4Tajzt3Ew4
	umf28HLhUXOlNivq33XAy/D5C1EtGWVs5I7Vwp8dXW60Ogt+YDXNzycwW8wzzOYq
	2EUJ7lFrBXnJzWqzbo0vrA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4617jubv2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 10:38:55 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9i5MT038859;
	Wed, 16 Apr 2025 10:38:55 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2049.outbound.protection.outlook.com [104.47.70.49])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460d4sq062-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 10:38:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oDruz/I/UE6GPLwUCTy3gOuQlsICkbZVn/nw+HsiH2WTxPEEiyJCQ9ZyR+9Li2ifeFMIANQxO5+SzjrC7WRMRWrPswfQ1sCyD0uNT6p2S8UCrNPpLptHPvzADYqPkBVb2JsQVo7FWgkg077NDyMncxS9P4pHU1TdfdmXY8I0GkBB9++ovP8bBVmIuMlI5oWHJbJznxdumm4aIiW9nMk7GT+kB98wo/LueYwEaAawtmUK8UN4pPJ7pkGAuL12u7Me4WV31kWyEd3Z7Vp6E6HmFOBPgYhPh5PgrJX9n/rK4/jMOXdXm0oWjY2KXMbdEkWFIgsx+vaWbNfqxLFIsc7BcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDKk1GjDgLOi28YjcTBzkc8QK0HIn4cA/j68CeRKKL4=;
 b=CXHWmS2ZcQCxi2I91/Zb+oHzr2b79fR7jvy1IOXesaSsQuJ7A5KOEgWIUJD/VRPEgxLv3FweyIm+h0Roo/gmYQwNMszlhCixT0ccCVQTWx4pcApixY7KoazMXyGNSRhOsWgjJOVdO/4LzitgPV8VV0wPDxywPop5lVKlBJF3ger//3LSCj7WNkrxtVr6Cp4/WKcCf8cVxK5nSOj1+u2RgYDfJ3Iod1dNfGvU/6MiBWexFPkDLSw3yhWLckBJk8eQy4iUlW8fhXwj1JPtVqItlhO69Uq5TKfOhmxSS4ksinZoUY0ia6rD8VmHpZYbs5a1hETqz0Rh8P+YWaTE+z4x/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDKk1GjDgLOi28YjcTBzkc8QK0HIn4cA/j68CeRKKL4=;
 b=Mf+cCTfHc9CGT7ncztLONZsl9cl9rRIBtpXn3JBdSrlEFdaxoe5TB9CQTeM7ahy7eeuC79JTc8MxuUzUg090AELiG/4fCbo7TAYSc75stPxs3/P9v/dnuuSWrSKPEkvYfj4F7AGYAuZT6no+XILz8exIVw9ur8HmU1PD7BdjPzw=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CY5PR10MB5916.namprd10.prod.outlook.com (2603:10b6:930:2c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Wed, 16 Apr
 2025 10:38:53 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8632.036; Wed, 16 Apr 2025
 10:38:53 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Suren Baghdasaryan <surenb@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Matthew Wilcox <willy@infradead.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        SeongJae Park <sj@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>,
        David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: [PATCH v2 1/2] mm: move mmap/vma locking logic into specific files
Date: Wed, 16 Apr 2025 11:38:36 +0100
Message-ID: <bec6c8e29fa8de9267a811a10b1bdae355d67ed4.1744799282.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744799282.git.lorenzo.stoakes@oracle.com>
References: <cover.1744799282.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0133.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::8) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CY5PR10MB5916:EE_
X-MS-Office365-Filtering-Correlation-Id: 95c9673d-3a22-4f6e-2bc6-08dd7cd2e1a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HZrSLcBB7pG0AijNKn0UTGMzsCAR0grIiDFksdTFqVjveEKkNlZKQIwqWJ1e?=
 =?us-ascii?Q?STVpwJ9J8bjwWd5oQQWoHLA3lluI56EH4VJ09p3WynyQW2XBlVzL9hX3MGTA?=
 =?us-ascii?Q?yvlnAUVPF72whhyySU91IP0nbHu3Z/Xj/y3LIufZNbXf7ckKj95APBpoH+Ng?=
 =?us-ascii?Q?zE7zYJsoCd9Xs3eShobYEppqFJRbgDWdqbR2bjC4PToQ5x+zp8vVyn849Rkd?=
 =?us-ascii?Q?GQKi9YHlvCjdjAGRUS98Q/oJ33MzK2K8Za8yh79qI1Dxmc5YcnherxqGYvH6?=
 =?us-ascii?Q?W397VvJG1jQOQPIitfeqxqcvczQmJfLbgGNqus5CQ/2ailHJAnrvLd0qh9gX?=
 =?us-ascii?Q?S6LWuCSIFGfFIGFfccWTLkhoRuCA4H4wDTh0TKfy0fVOCvrC+Z1Vu/328jUg?=
 =?us-ascii?Q?J99lqRcgwdnc4jMk6uEzcRzJP8H8I89TKbSwCWrlE/0fCbko7XNV5FxkE8Ow?=
 =?us-ascii?Q?Vy9nnez1q3FKTApgaq9eqHmHrg4mVDuqZ/hLSLRZNVySoHXgzYskFXMzEuV3?=
 =?us-ascii?Q?m+2QQtTA92R/smoJS6euhev0ex2Q4wqzlhR45XC5slMeAo7ZGdeOHaoao4rt?=
 =?us-ascii?Q?AfHS3AET/cCv2RfCbjr8eAurepMbRkcRG+YCYjp9jtBuEcwMDeCrQ4PEPAZD?=
 =?us-ascii?Q?jLgbsJ/JO+F34iJDZIDbtEs3F5HGYQXlhdCN7+kTmnGqKbKAaq3ee8DLZzbs?=
 =?us-ascii?Q?O17gnt5IgkosJIBaiKW1nWiUWQkLSpPKuSuobW3X2FdJHx9icZYCmqdJNDD2?=
 =?us-ascii?Q?wsM/BryYH8efo3FbO3gU+mjNvvUUMmsceZJAMzoqokNvKsjHYsEVPoYhc5X0?=
 =?us-ascii?Q?OibR8ZujUa2uCwyLEHiL9QwpjzDJk8EQRAatBLAiBz1Md6NAOlsIxlq08V+K?=
 =?us-ascii?Q?fly7TPXqHON8lEJu21zDCaQjTRI91AI7ThaagOK6iiq/mfGJEKztGscXlSEz?=
 =?us-ascii?Q?IujCx6RQYEBTp0CU6qCZsolGw72cQVj+fSDCGpmCuu8W1mrn1p2tznSDpRlR?=
 =?us-ascii?Q?SEfTPoYRtlf5jQLPAVgsCLEvil2rU/dd58isedIaos6cPKHNSU5cQZVISOO8?=
 =?us-ascii?Q?ln+gRjJ9iIqEstJAe89gflnEr7d3NtUb5J7YY0tLkYubg8wxbGv3a33W2Jxk?=
 =?us-ascii?Q?eg2ksd1Y8bOIVZHTuceTNLk0KI7jFiJYaCsluzsjv348kayKmzFXNddjfS+i?=
 =?us-ascii?Q?bdRjQpUEQXD50IeX8exNjlllGZpeDlOReM5kZd3OoYQ1tSDGCLBj6+SDpZdB?=
 =?us-ascii?Q?XwcjJmwDAKN5jESzaso+PEcp8Rif+HhdLYctfhbQdFWoyTHGjnmHg07xb986?=
 =?us-ascii?Q?i9xNQ3jcJSAt++RQOBh1nLcynZsyAwUcha6qiO3Y47mb853dv3cd9nUCwd5W?=
 =?us-ascii?Q?4kPSa1tfKMt4beo94hmDun6uM5KQmljQReAzWLvFNg/vx4TUoWc5ybI8W8Y1?=
 =?us-ascii?Q?599Gy1O0Y00=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vFmBdxmAeocEu/eqz62RojNPPrG3V1P7OzQLcqYMFCSgOG/ZV2mkE5kNa/eI?=
 =?us-ascii?Q?HACXgZT93eGpp3HdxzRwleErcMVnKXybE8E53Fmk7Edxh7QiqHssRpIeHL+2?=
 =?us-ascii?Q?FMBatr/Nao7IUrLAUmLQdRsWUTGSKggKS8AOoRdRsNHIVzbI8GYpbzczwWvP?=
 =?us-ascii?Q?aD9lvvAXHgpeOslVe4HlF/6T4WRfLzj9KWpeAG4Y0hEsSbLJOaSl4tYrhly2?=
 =?us-ascii?Q?Nja+EHRUmNkGTPHAae8vpH3WxSEMxV7MoBlNOnSLs3wyzth7u6B7NmfYehaH?=
 =?us-ascii?Q?SVnQlqgPpe1ASe7X4WQd3jJt0W038kp5+4wgj3s1K4fHnGhxIoMtoRn94nKt?=
 =?us-ascii?Q?f6XiAqi6z53yKoRe9mSOntCVwNP2ceXFXUATmaaV1hEZtdOdfUU88hrHIXZ9?=
 =?us-ascii?Q?ed1TzjrtWHtxfladZ0yhhPm7Wh1LgewGgCpczpA1Jr+ceGyfNV87W94PCQ3X?=
 =?us-ascii?Q?Tz/3EZ2Job/VprvENBu+VpvPk3MJgmCeK6phL7jjgf4d4Ft0bREvqlnKCR8O?=
 =?us-ascii?Q?+0vXln3hRfrL7afzBZ31dvgrC1JYFnLvDDLO16K9niIyVDIjENld8DCiZnXG?=
 =?us-ascii?Q?/XUwVytmcVXpUCdwFFLrEO1Tqa6DkTL1p6Iu6B0/ucsiPPlAMDf9slW4Xtgq?=
 =?us-ascii?Q?YQnX5keBHM9Q/O6mcJBUBz7tsVAl9U1F0s6nS6ybcjJo82+SW1wF7K3m416s?=
 =?us-ascii?Q?C00BJRAVU98vxPWX+6KSFLDe4xqbCuKv8XYzVM4c/CgRjYV3Tnd8UtY9ZdSA?=
 =?us-ascii?Q?CAeFVhP0wG+9ZvUrZ+KkVBMk59RKXj+byrc0nwP8C11zyCWBunqgdAEJQuRx?=
 =?us-ascii?Q?Hn+p1OlOKJYU+7vepdvpq9lEPj1SvBs5VFdUEI9VzQhUGr23F4gA+pwt1Fs3?=
 =?us-ascii?Q?fMx6RoliGPx4Fj0S3nNxX0u08o6c5WoYtcVkwkriutNy5qCEqH6BL0lDN4Xk?=
 =?us-ascii?Q?3l7ztlAGN6AQIX+Ah8ik5B7G1ZC8fAZf7aPCP6L5h1Y/Zrwwd/3mOJX/SbGk?=
 =?us-ascii?Q?K1ipAWtADJxwUUfAanjHEt7kepirpu/lKgqIeFUsq7TCnMd1tkOQ0gv9LhSY?=
 =?us-ascii?Q?IIeUVeFm2i9oFu6Dr0AceUFht+HnG47GIXPRhBik7R1ODruozHms0COiZN0j?=
 =?us-ascii?Q?N34lptNG20XUHk7O82A37VIQLmgZdyUUoqpAwl8fHroEKNO7zQLccGQ9FaiR?=
 =?us-ascii?Q?cSznN8VL2noaBYPlyO2dNS+e5l9PUkA++xzpXHHf0Usp/+YELfy2XHmWDsrf?=
 =?us-ascii?Q?Z/1qMZaj2YLMmhlzYw1r+Sl8LjQdP9V8LIuD/U3+5YCbOjeXtgR0y2uIQu/9?=
 =?us-ascii?Q?au69JniwVGrCQvlkKnmmSHh3t46llRdXAj2Wa/IkzVJMNVYvZgD4QRuxGcN2?=
 =?us-ascii?Q?bAHYXw3ztY/A5Bo1I3uBEqho4Cb9qDf/o1EDYOCyGNYtX+ZraUwhS3pLJ9gU?=
 =?us-ascii?Q?1LxZAPfUvsj+aDAz823CkunuZQnFX1rw2u7O/ucu6tjGhSENpT+Ovb8cRIAL?=
 =?us-ascii?Q?jHBdtWEQqQ8Ca4nFBH+KUD+OFqgG1ejoTaxAbkcydbZ6na7Rrc0yxWdaVWnP?=
 =?us-ascii?Q?DxlLxGyI3DTJ/+7uyYyPfy5MciTDm7xjkQEP8JHqnRCVQjG9uLwMr57+3Kfn?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KINauEIZlk0ec/4dCfvvk3+bxExUHgiMeZmhMkHiuzcrRjmR/Joli0EhS4jHPFRV8ajIN6teZd5UtMbfP4/pkatSBcswIUH38nPR3NnahcAp6VhCIVcTr85l5L9iesD7Gh7aAgOe7qrIieeAloR8krJSGWjfTl/rPRZXQEwJB82FtMlaDiVEdxFixVnIp37SYXinWNGZYhR7y4z/pZyVDO68OswfLns7Yl+3DIvfTfjiQEapXJUYBgKLDBL7/bccCPE16MXWg4q1V0wTkihAdgX8kkMepICBJTO7t69Ab2EqIINTYB0nHs8X8oGNqjIBJfk948FQHZFcGkaTjNgDl1hO2PxnNvVsIGUm6mPeXxKPpIRx9xfSuS9qqCkQkq6pZ+KiEoy3n84hR1o/0DuYLGlusREfoWnTiIzPqtkiQrygCeI+y277c6EnDa6hiINd5b5Tr4eF0AWmbpHtlOReShS/iOyFFh6Zvf8GDjdFYNFkbzSP+Ceh7gbRGdxSG0B+UguWRNQrOojvtpZGhLpTgYQzEH6p7SMqa+fa46gnphNvqoVBnO+W+BdYyRUqz0Wb/ytcWJQTzCDrreL5CyrNsZd0cIdTxKo1ANrfoZAzPDw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c9673d-3a22-4f6e-2bc6-08dd7cd2e1a9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 10:38:53.0095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JFu2zwnD339LoiEO+5ubJHcAMrW8ovYZ7vpUWdCAX+5SwnkehQBsZwB1gNN8R3GTAZZmWgiWOBwdn+b0GrlgX8YvUUY7Cpc83hyn0VYZMSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5916
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504160087
X-Proofpoint-GUID: ey8D22yoFqj7zr1fZE26lvY8F-4spWRP
X-Proofpoint-ORIG-GUID: ey8D22yoFqj7zr1fZE26lvY8F-4spWRP

Currently the VMA and mmap locking logic is entangled in two of the most
overwrought files in mm - include/linux/mm.h and mm/memory.c. Separate this
logic out so we can more easily make changes and create an appropriate
MAINTAINERS entry that spans only the logic relating to locking.

This should have no functional change. Care is taken to avoid dependency
loops, we must regrettably keep release_fault_lock() and
assert_fault_locked() in mm.h as a result due to the dependence on the
vm_fault type.

Additionally we must declare rcuwait_wake_up() manually to avoid a
dependency cycle on linux/rcuwait.h.

Additionally move the nommu implementatino of lock_mm_and_find_vma() to
mmap_lock.c so everything lock-related is in one place.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm.h        | 231 +-------------------------------
 include/linux/mmap_lock.h | 227 +++++++++++++++++++++++++++++++
 mm/memory.c               | 252 -----------------------------------
 mm/mmap_lock.c            | 273 ++++++++++++++++++++++++++++++++++++++
 mm/nommu.c                |  16 ---
 5 files changed, 504 insertions(+), 495 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 5eb0d77c4438..9b701cfbef22 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -671,204 +671,11 @@ static inline void vma_numab_state_init(struct vm_area_struct *vma) {}
 static inline void vma_numab_state_free(struct vm_area_struct *vma) {}
 #endif /* CONFIG_NUMA_BALANCING */
 
-#ifdef CONFIG_PER_VMA_LOCK
-static inline void vma_lock_init(struct vm_area_struct *vma, bool reset_refcnt)
-{
-#ifdef CONFIG_DEBUG_LOCK_ALLOC
-	static struct lock_class_key lockdep_key;
-
-	lockdep_init_map(&vma->vmlock_dep_map, "vm_lock", &lockdep_key, 0);
-#endif
-	if (reset_refcnt)
-		refcount_set(&vma->vm_refcnt, 0);
-	vma->vm_lock_seq = UINT_MAX;
-}
-
-static inline bool is_vma_writer_only(int refcnt)
-{
-	/*
-	 * With a writer and no readers, refcnt is VMA_LOCK_OFFSET if the vma
-	 * is detached and (VMA_LOCK_OFFSET + 1) if it is attached. Waiting on
-	 * a detached vma happens only in vma_mark_detached() and is a rare
-	 * case, therefore most of the time there will be no unnecessary wakeup.
-	 */
-	return refcnt & VMA_LOCK_OFFSET && refcnt <= VMA_LOCK_OFFSET + 1;
-}
-
-static inline void vma_refcount_put(struct vm_area_struct *vma)
-{
-	/* Use a copy of vm_mm in case vma is freed after we drop vm_refcnt */
-	struct mm_struct *mm = vma->vm_mm;
-	int oldcnt;
-
-	rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
-	if (!__refcount_dec_and_test(&vma->vm_refcnt, &oldcnt)) {
-
-		if (is_vma_writer_only(oldcnt - 1))
-			rcuwait_wake_up(&mm->vma_writer_wait);
-	}
-}
-
-/*
- * Try to read-lock a vma. The function is allowed to occasionally yield false
- * locked result to avoid performance overhead, in which case we fall back to
- * using mmap_lock. The function should never yield false unlocked result.
- * False locked result is possible if mm_lock_seq overflows or if vma gets
- * reused and attached to a different mm before we lock it.
- * Returns the vma on success, NULL on failure to lock and EAGAIN if vma got
- * detached.
- */
-static inline struct vm_area_struct *vma_start_read(struct mm_struct *mm,
-						    struct vm_area_struct *vma)
-{
-	int oldcnt;
-
-	/*
-	 * Check before locking. A race might cause false locked result.
-	 * We can use READ_ONCE() for the mm_lock_seq here, and don't need
-	 * ACQUIRE semantics, because this is just a lockless check whose result
-	 * we don't rely on for anything - the mm_lock_seq read against which we
-	 * need ordering is below.
-	 */
-	if (READ_ONCE(vma->vm_lock_seq) == READ_ONCE(mm->mm_lock_seq.sequence))
-		return NULL;
-
-	/*
-	 * If VMA_LOCK_OFFSET is set, __refcount_inc_not_zero_limited_acquire()
-	 * will fail because VMA_REF_LIMIT is less than VMA_LOCK_OFFSET.
-	 * Acquire fence is required here to avoid reordering against later
-	 * vm_lock_seq check and checks inside lock_vma_under_rcu().
-	 */
-	if (unlikely(!__refcount_inc_not_zero_limited_acquire(&vma->vm_refcnt, &oldcnt,
-							      VMA_REF_LIMIT))) {
-		/* return EAGAIN if vma got detached from under us */
-		return oldcnt ? NULL : ERR_PTR(-EAGAIN);
-	}
-
-	rwsem_acquire_read(&vma->vmlock_dep_map, 0, 1, _RET_IP_);
-	/*
-	 * Overflow of vm_lock_seq/mm_lock_seq might produce false locked result.
-	 * False unlocked result is impossible because we modify and check
-	 * vma->vm_lock_seq under vma->vm_refcnt protection and mm->mm_lock_seq
-	 * modification invalidates all existing locks.
-	 *
-	 * We must use ACQUIRE semantics for the mm_lock_seq so that if we are
-	 * racing with vma_end_write_all(), we only start reading from the VMA
-	 * after it has been unlocked.
-	 * This pairs with RELEASE semantics in vma_end_write_all().
-	 */
-	if (unlikely(vma->vm_lock_seq == raw_read_seqcount(&mm->mm_lock_seq))) {
-		vma_refcount_put(vma);
-		return NULL;
-	}
-
-	return vma;
-}
-
-/*
- * Use only while holding mmap read lock which guarantees that locking will not
- * fail (nobody can concurrently write-lock the vma). vma_start_read() should
- * not be used in such cases because it might fail due to mm_lock_seq overflow.
- * This functionality is used to obtain vma read lock and drop the mmap read lock.
- */
-static inline bool vma_start_read_locked_nested(struct vm_area_struct *vma, int subclass)
-{
-	int oldcnt;
-
-	mmap_assert_locked(vma->vm_mm);
-	if (unlikely(!__refcount_inc_not_zero_limited_acquire(&vma->vm_refcnt, &oldcnt,
-							      VMA_REF_LIMIT)))
-		return false;
-
-	rwsem_acquire_read(&vma->vmlock_dep_map, 0, 1, _RET_IP_);
-	return true;
-}
-
-/*
- * Use only while holding mmap read lock which guarantees that locking will not
- * fail (nobody can concurrently write-lock the vma). vma_start_read() should
- * not be used in such cases because it might fail due to mm_lock_seq overflow.
- * This functionality is used to obtain vma read lock and drop the mmap read lock.
- */
-static inline bool vma_start_read_locked(struct vm_area_struct *vma)
-{
-	return vma_start_read_locked_nested(vma, 0);
-}
-
-static inline void vma_end_read(struct vm_area_struct *vma)
-{
-	vma_refcount_put(vma);
-}
-
-/* WARNING! Can only be used if mmap_lock is expected to be write-locked */
-static bool __is_vma_write_locked(struct vm_area_struct *vma, unsigned int *mm_lock_seq)
-{
-	mmap_assert_write_locked(vma->vm_mm);
-
-	/*
-	 * current task is holding mmap_write_lock, both vma->vm_lock_seq and
-	 * mm->mm_lock_seq can't be concurrently modified.
-	 */
-	*mm_lock_seq = vma->vm_mm->mm_lock_seq.sequence;
-	return (vma->vm_lock_seq == *mm_lock_seq);
-}
-
-void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_lock_seq);
-
-/*
- * Begin writing to a VMA.
- * Exclude concurrent readers under the per-VMA lock until the currently
- * write-locked mmap_lock is dropped or downgraded.
- */
-static inline void vma_start_write(struct vm_area_struct *vma)
-{
-	unsigned int mm_lock_seq;
-
-	if (__is_vma_write_locked(vma, &mm_lock_seq))
-		return;
-
-	__vma_start_write(vma, mm_lock_seq);
-}
-
-static inline void vma_assert_write_locked(struct vm_area_struct *vma)
-{
-	unsigned int mm_lock_seq;
-
-	VM_BUG_ON_VMA(!__is_vma_write_locked(vma, &mm_lock_seq), vma);
-}
-
-static inline void vma_assert_locked(struct vm_area_struct *vma)
-{
-	unsigned int mm_lock_seq;
-
-	VM_BUG_ON_VMA(refcount_read(&vma->vm_refcnt) <= 1 &&
-		      !__is_vma_write_locked(vma, &mm_lock_seq), vma);
-}
-
 /*
- * WARNING: to avoid racing with vma_mark_attached()/vma_mark_detached(), these
- * assertions should be made either under mmap_write_lock or when the object
- * has been isolated under mmap_write_lock, ensuring no competing writers.
+ * These must be here rather than mmap_lock.h as dependent on vm_fault type,
+ * declared in this header.
  */
-static inline void vma_assert_attached(struct vm_area_struct *vma)
-{
-	WARN_ON_ONCE(!refcount_read(&vma->vm_refcnt));
-}
-
-static inline void vma_assert_detached(struct vm_area_struct *vma)
-{
-	WARN_ON_ONCE(refcount_read(&vma->vm_refcnt));
-}
-
-static inline void vma_mark_attached(struct vm_area_struct *vma)
-{
-	vma_assert_write_locked(vma);
-	vma_assert_detached(vma);
-	refcount_set_release(&vma->vm_refcnt, 1);
-}
-
-void vma_mark_detached(struct vm_area_struct *vma);
-
+#ifdef CONFIG_PER_VMA_LOCK
 static inline void release_fault_lock(struct vm_fault *vmf)
 {
 	if (vmf->flags & FAULT_FLAG_VMA_LOCK)
@@ -884,36 +691,7 @@ static inline void assert_fault_locked(struct vm_fault *vmf)
 	else
 		mmap_assert_locked(vmf->vma->vm_mm);
 }
-
-struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
-					  unsigned long address);
-
-#else /* CONFIG_PER_VMA_LOCK */
-
-static inline void vma_lock_init(struct vm_area_struct *vma, bool reset_refcnt) {}
-static inline struct vm_area_struct *vma_start_read(struct mm_struct *mm,
-						    struct vm_area_struct *vma)
-		{ return NULL; }
-static inline void vma_end_read(struct vm_area_struct *vma) {}
-static inline void vma_start_write(struct vm_area_struct *vma) {}
-static inline void vma_assert_write_locked(struct vm_area_struct *vma)
-		{ mmap_assert_write_locked(vma->vm_mm); }
-static inline void vma_assert_attached(struct vm_area_struct *vma) {}
-static inline void vma_assert_detached(struct vm_area_struct *vma) {}
-static inline void vma_mark_attached(struct vm_area_struct *vma) {}
-static inline void vma_mark_detached(struct vm_area_struct *vma) {}
-
-static inline struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
-		unsigned long address)
-{
-	return NULL;
-}
-
-static inline void vma_assert_locked(struct vm_area_struct *vma)
-{
-	mmap_assert_locked(vma->vm_mm);
-}
-
+#else
 static inline void release_fault_lock(struct vm_fault *vmf)
 {
 	mmap_read_unlock(vmf->vma->vm_mm);
@@ -923,7 +701,6 @@ static inline void assert_fault_locked(struct vm_fault *vmf)
 {
 	mmap_assert_locked(vmf->vma->vm_mm);
 }
-
 #endif /* CONFIG_PER_VMA_LOCK */
 
 extern const struct vm_operations_struct vma_dummy_vm_ops;
diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
index 4706c6769902..7983b2efe9bf 100644
--- a/include/linux/mmap_lock.h
+++ b/include/linux/mmap_lock.h
@@ -1,6 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 #ifndef _LINUX_MMAP_LOCK_H
 #define _LINUX_MMAP_LOCK_H
 
+/* Avoid a dependency loop by declaring here. */
+extern int rcuwait_wake_up(struct rcuwait *w);
+
 #include <linux/lockdep.h>
 #include <linux/mm_types.h>
 #include <linux/mmdebug.h>
@@ -104,6 +108,206 @@ static inline bool mmap_lock_speculate_retry(struct mm_struct *mm, unsigned int
 	return read_seqcount_retry(&mm->mm_lock_seq, seq);
 }
 
+static inline void vma_lock_init(struct vm_area_struct *vma, bool reset_refcnt)
+{
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
+	static struct lock_class_key lockdep_key;
+
+	lockdep_init_map(&vma->vmlock_dep_map, "vm_lock", &lockdep_key, 0);
+#endif
+	if (reset_refcnt)
+		refcount_set(&vma->vm_refcnt, 0);
+	vma->vm_lock_seq = UINT_MAX;
+}
+
+static inline bool is_vma_writer_only(int refcnt)
+{
+	/*
+	 * With a writer and no readers, refcnt is VMA_LOCK_OFFSET if the vma
+	 * is detached and (VMA_LOCK_OFFSET + 1) if it is attached. Waiting on
+	 * a detached vma happens only in vma_mark_detached() and is a rare
+	 * case, therefore most of the time there will be no unnecessary wakeup.
+	 */
+	return refcnt & VMA_LOCK_OFFSET && refcnt <= VMA_LOCK_OFFSET + 1;
+}
+
+static inline void vma_refcount_put(struct vm_area_struct *vma)
+{
+	/* Use a copy of vm_mm in case vma is freed after we drop vm_refcnt */
+	struct mm_struct *mm = vma->vm_mm;
+	int oldcnt;
+
+	rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
+	if (!__refcount_dec_and_test(&vma->vm_refcnt, &oldcnt)) {
+
+		if (is_vma_writer_only(oldcnt - 1))
+			rcuwait_wake_up(&mm->vma_writer_wait);
+	}
+}
+
+/*
+ * Try to read-lock a vma. The function is allowed to occasionally yield false
+ * locked result to avoid performance overhead, in which case we fall back to
+ * using mmap_lock. The function should never yield false unlocked result.
+ * False locked result is possible if mm_lock_seq overflows or if vma gets
+ * reused and attached to a different mm before we lock it.
+ * Returns the vma on success, NULL on failure to lock and EAGAIN if vma got
+ * detached.
+ */
+static inline struct vm_area_struct *vma_start_read(struct mm_struct *mm,
+						    struct vm_area_struct *vma)
+{
+	int oldcnt;
+
+	/*
+	 * Check before locking. A race might cause false locked result.
+	 * We can use READ_ONCE() for the mm_lock_seq here, and don't need
+	 * ACQUIRE semantics, because this is just a lockless check whose result
+	 * we don't rely on for anything - the mm_lock_seq read against which we
+	 * need ordering is below.
+	 */
+	if (READ_ONCE(vma->vm_lock_seq) == READ_ONCE(mm->mm_lock_seq.sequence))
+		return NULL;
+
+	/*
+	 * If VMA_LOCK_OFFSET is set, __refcount_inc_not_zero_limited_acquire()
+	 * will fail because VMA_REF_LIMIT is less than VMA_LOCK_OFFSET.
+	 * Acquire fence is required here to avoid reordering against later
+	 * vm_lock_seq check and checks inside lock_vma_under_rcu().
+	 */
+	if (unlikely(!__refcount_inc_not_zero_limited_acquire(&vma->vm_refcnt, &oldcnt,
+							      VMA_REF_LIMIT))) {
+		/* return EAGAIN if vma got detached from under us */
+		return oldcnt ? NULL : ERR_PTR(-EAGAIN);
+	}
+
+	rwsem_acquire_read(&vma->vmlock_dep_map, 0, 1, _RET_IP_);
+	/*
+	 * Overflow of vm_lock_seq/mm_lock_seq might produce false locked result.
+	 * False unlocked result is impossible because we modify and check
+	 * vma->vm_lock_seq under vma->vm_refcnt protection and mm->mm_lock_seq
+	 * modification invalidates all existing locks.
+	 *
+	 * We must use ACQUIRE semantics for the mm_lock_seq so that if we are
+	 * racing with vma_end_write_all(), we only start reading from the VMA
+	 * after it has been unlocked.
+	 * This pairs with RELEASE semantics in vma_end_write_all().
+	 */
+	if (unlikely(vma->vm_lock_seq == raw_read_seqcount(&mm->mm_lock_seq))) {
+		vma_refcount_put(vma);
+		return NULL;
+	}
+
+	return vma;
+}
+
+/*
+ * Use only while holding mmap read lock which guarantees that locking will not
+ * fail (nobody can concurrently write-lock the vma). vma_start_read() should
+ * not be used in such cases because it might fail due to mm_lock_seq overflow.
+ * This functionality is used to obtain vma read lock and drop the mmap read lock.
+ */
+static inline bool vma_start_read_locked_nested(struct vm_area_struct *vma, int subclass)
+{
+	int oldcnt;
+
+	mmap_assert_locked(vma->vm_mm);
+	if (unlikely(!__refcount_inc_not_zero_limited_acquire(&vma->vm_refcnt, &oldcnt,
+							      VMA_REF_LIMIT)))
+		return false;
+
+	rwsem_acquire_read(&vma->vmlock_dep_map, 0, 1, _RET_IP_);
+	return true;
+}
+
+/*
+ * Use only while holding mmap read lock which guarantees that locking will not
+ * fail (nobody can concurrently write-lock the vma). vma_start_read() should
+ * not be used in such cases because it might fail due to mm_lock_seq overflow.
+ * This functionality is used to obtain vma read lock and drop the mmap read lock.
+ */
+static inline bool vma_start_read_locked(struct vm_area_struct *vma)
+{
+	return vma_start_read_locked_nested(vma, 0);
+}
+
+static inline void vma_end_read(struct vm_area_struct *vma)
+{
+	vma_refcount_put(vma);
+}
+
+/* WARNING! Can only be used if mmap_lock is expected to be write-locked */
+static bool __is_vma_write_locked(struct vm_area_struct *vma, unsigned int *mm_lock_seq)
+{
+	mmap_assert_write_locked(vma->vm_mm);
+
+	/*
+	 * current task is holding mmap_write_lock, both vma->vm_lock_seq and
+	 * mm->mm_lock_seq can't be concurrently modified.
+	 */
+	*mm_lock_seq = vma->vm_mm->mm_lock_seq.sequence;
+	return (vma->vm_lock_seq == *mm_lock_seq);
+}
+
+void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_lock_seq);
+
+/*
+ * Begin writing to a VMA.
+ * Exclude concurrent readers under the per-VMA lock until the currently
+ * write-locked mmap_lock is dropped or downgraded.
+ */
+static inline void vma_start_write(struct vm_area_struct *vma)
+{
+	unsigned int mm_lock_seq;
+
+	if (__is_vma_write_locked(vma, &mm_lock_seq))
+		return;
+
+	__vma_start_write(vma, mm_lock_seq);
+}
+
+static inline void vma_assert_write_locked(struct vm_area_struct *vma)
+{
+	unsigned int mm_lock_seq;
+
+	VM_BUG_ON_VMA(!__is_vma_write_locked(vma, &mm_lock_seq), vma);
+}
+
+static inline void vma_assert_locked(struct vm_area_struct *vma)
+{
+	unsigned int mm_lock_seq;
+
+	VM_BUG_ON_VMA(refcount_read(&vma->vm_refcnt) <= 1 &&
+		      !__is_vma_write_locked(vma, &mm_lock_seq), vma);
+}
+
+/*
+ * WARNING: to avoid racing with vma_mark_attached()/vma_mark_detached(), these
+ * assertions should be made either under mmap_write_lock or when the object
+ * has been isolated under mmap_write_lock, ensuring no competing writers.
+ */
+static inline void vma_assert_attached(struct vm_area_struct *vma)
+{
+	WARN_ON_ONCE(!refcount_read(&vma->vm_refcnt));
+}
+
+static inline void vma_assert_detached(struct vm_area_struct *vma)
+{
+	WARN_ON_ONCE(refcount_read(&vma->vm_refcnt));
+}
+
+static inline void vma_mark_attached(struct vm_area_struct *vma)
+{
+	vma_assert_write_locked(vma);
+	vma_assert_detached(vma);
+	refcount_set_release(&vma->vm_refcnt, 1);
+}
+
+void vma_mark_detached(struct vm_area_struct *vma);
+
+struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
+					  unsigned long address);
+
 #else /* CONFIG_PER_VMA_LOCK */
 
 static inline void mm_lock_seqcount_init(struct mm_struct *mm) {}
@@ -119,6 +323,29 @@ static inline bool mmap_lock_speculate_retry(struct mm_struct *mm, unsigned int
 {
 	return true;
 }
+static inline void vma_lock_init(struct vm_area_struct *vma, bool reset_refcnt) {}
+static inline struct vm_area_struct *vma_start_read(struct mm_struct *mm,
+						    struct vm_area_struct *vma)
+		{ return NULL; }
+static inline void vma_end_read(struct vm_area_struct *vma) {}
+static inline void vma_start_write(struct vm_area_struct *vma) {}
+static inline void vma_assert_write_locked(struct vm_area_struct *vma)
+		{ mmap_assert_write_locked(vma->vm_mm); }
+static inline void vma_assert_attached(struct vm_area_struct *vma) {}
+static inline void vma_assert_detached(struct vm_area_struct *vma) {}
+static inline void vma_mark_attached(struct vm_area_struct *vma) {}
+static inline void vma_mark_detached(struct vm_area_struct *vma) {}
+
+static inline struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
+		unsigned long address)
+{
+	return NULL;
+}
+
+static inline void vma_assert_locked(struct vm_area_struct *vma)
+{
+	mmap_assert_locked(vma->vm_mm);
+}
 
 #endif /* CONFIG_PER_VMA_LOCK */
 
diff --git a/mm/memory.c b/mm/memory.c
index 688f3612e16d..35cfc91d5a2e 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6378,258 +6378,6 @@ vm_fault_t handle_mm_fault(struct vm_area_struct *vma, unsigned long address,
 }
 EXPORT_SYMBOL_GPL(handle_mm_fault);
 
-#ifdef CONFIG_LOCK_MM_AND_FIND_VMA
-#include <linux/extable.h>
-
-static inline bool get_mmap_lock_carefully(struct mm_struct *mm, struct pt_regs *regs)
-{
-	if (likely(mmap_read_trylock(mm)))
-		return true;
-
-	if (regs && !user_mode(regs)) {
-		unsigned long ip = exception_ip(regs);
-		if (!search_exception_tables(ip))
-			return false;
-	}
-
-	return !mmap_read_lock_killable(mm);
-}
-
-static inline bool mmap_upgrade_trylock(struct mm_struct *mm)
-{
-	/*
-	 * We don't have this operation yet.
-	 *
-	 * It should be easy enough to do: it's basically a
-	 *    atomic_long_try_cmpxchg_acquire()
-	 * from RWSEM_READER_BIAS -> RWSEM_WRITER_LOCKED, but
-	 * it also needs the proper lockdep magic etc.
-	 */
-	return false;
-}
-
-static inline bool upgrade_mmap_lock_carefully(struct mm_struct *mm, struct pt_regs *regs)
-{
-	mmap_read_unlock(mm);
-	if (regs && !user_mode(regs)) {
-		unsigned long ip = exception_ip(regs);
-		if (!search_exception_tables(ip))
-			return false;
-	}
-	return !mmap_write_lock_killable(mm);
-}
-
-/*
- * Helper for page fault handling.
- *
- * This is kind of equivalent to "mmap_read_lock()" followed
- * by "find_extend_vma()", except it's a lot more careful about
- * the locking (and will drop the lock on failure).
- *
- * For example, if we have a kernel bug that causes a page
- * fault, we don't want to just use mmap_read_lock() to get
- * the mm lock, because that would deadlock if the bug were
- * to happen while we're holding the mm lock for writing.
- *
- * So this checks the exception tables on kernel faults in
- * order to only do this all for instructions that are actually
- * expected to fault.
- *
- * We can also actually take the mm lock for writing if we
- * need to extend the vma, which helps the VM layer a lot.
- */
-struct vm_area_struct *lock_mm_and_find_vma(struct mm_struct *mm,
-			unsigned long addr, struct pt_regs *regs)
-{
-	struct vm_area_struct *vma;
-
-	if (!get_mmap_lock_carefully(mm, regs))
-		return NULL;
-
-	vma = find_vma(mm, addr);
-	if (likely(vma && (vma->vm_start <= addr)))
-		return vma;
-
-	/*
-	 * Well, dang. We might still be successful, but only
-	 * if we can extend a vma to do so.
-	 */
-	if (!vma || !(vma->vm_flags & VM_GROWSDOWN)) {
-		mmap_read_unlock(mm);
-		return NULL;
-	}
-
-	/*
-	 * We can try to upgrade the mmap lock atomically,
-	 * in which case we can continue to use the vma
-	 * we already looked up.
-	 *
-	 * Otherwise we'll have to drop the mmap lock and
-	 * re-take it, and also look up the vma again,
-	 * re-checking it.
-	 */
-	if (!mmap_upgrade_trylock(mm)) {
-		if (!upgrade_mmap_lock_carefully(mm, regs))
-			return NULL;
-
-		vma = find_vma(mm, addr);
-		if (!vma)
-			goto fail;
-		if (vma->vm_start <= addr)
-			goto success;
-		if (!(vma->vm_flags & VM_GROWSDOWN))
-			goto fail;
-	}
-
-	if (expand_stack_locked(vma, addr))
-		goto fail;
-
-success:
-	mmap_write_downgrade(mm);
-	return vma;
-
-fail:
-	mmap_write_unlock(mm);
-	return NULL;
-}
-#endif
-
-#ifdef CONFIG_PER_VMA_LOCK
-static inline bool __vma_enter_locked(struct vm_area_struct *vma, bool detaching)
-{
-	unsigned int tgt_refcnt = VMA_LOCK_OFFSET;
-
-	/* Additional refcnt if the vma is attached. */
-	if (!detaching)
-		tgt_refcnt++;
-
-	/*
-	 * If vma is detached then only vma_mark_attached() can raise the
-	 * vm_refcnt. mmap_write_lock prevents racing with vma_mark_attached().
-	 */
-	if (!refcount_add_not_zero(VMA_LOCK_OFFSET, &vma->vm_refcnt))
-		return false;
-
-	rwsem_acquire(&vma->vmlock_dep_map, 0, 0, _RET_IP_);
-	rcuwait_wait_event(&vma->vm_mm->vma_writer_wait,
-		   refcount_read(&vma->vm_refcnt) == tgt_refcnt,
-		   TASK_UNINTERRUPTIBLE);
-	lock_acquired(&vma->vmlock_dep_map, _RET_IP_);
-
-	return true;
-}
-
-static inline void __vma_exit_locked(struct vm_area_struct *vma, bool *detached)
-{
-	*detached = refcount_sub_and_test(VMA_LOCK_OFFSET, &vma->vm_refcnt);
-	rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
-}
-
-void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_lock_seq)
-{
-	bool locked;
-
-	/*
-	 * __vma_enter_locked() returns false immediately if the vma is not
-	 * attached, otherwise it waits until refcnt is indicating that vma
-	 * is attached with no readers.
-	 */
-	locked = __vma_enter_locked(vma, false);
-
-	/*
-	 * We should use WRITE_ONCE() here because we can have concurrent reads
-	 * from the early lockless pessimistic check in vma_start_read().
-	 * We don't really care about the correctness of that early check, but
-	 * we should use WRITE_ONCE() for cleanliness and to keep KCSAN happy.
-	 */
-	WRITE_ONCE(vma->vm_lock_seq, mm_lock_seq);
-
-	if (locked) {
-		bool detached;
-
-		__vma_exit_locked(vma, &detached);
-		WARN_ON_ONCE(detached); /* vma should remain attached */
-	}
-}
-EXPORT_SYMBOL_GPL(__vma_start_write);
-
-void vma_mark_detached(struct vm_area_struct *vma)
-{
-	vma_assert_write_locked(vma);
-	vma_assert_attached(vma);
-
-	/*
-	 * We are the only writer, so no need to use vma_refcount_put().
-	 * The condition below is unlikely because the vma has been already
-	 * write-locked and readers can increment vm_refcnt only temporarily
-	 * before they check vm_lock_seq, realize the vma is locked and drop
-	 * back the vm_refcnt. That is a narrow window for observing a raised
-	 * vm_refcnt.
-	 */
-	if (unlikely(!refcount_dec_and_test(&vma->vm_refcnt))) {
-		/* Wait until vma is detached with no readers. */
-		if (__vma_enter_locked(vma, true)) {
-			bool detached;
-
-			__vma_exit_locked(vma, &detached);
-			WARN_ON_ONCE(!detached);
-		}
-	}
-}
-
-/*
- * Lookup and lock a VMA under RCU protection. Returned VMA is guaranteed to be
- * stable and not isolated. If the VMA is not found or is being modified the
- * function returns NULL.
- */
-struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
-					  unsigned long address)
-{
-	MA_STATE(mas, &mm->mm_mt, address, address);
-	struct vm_area_struct *vma;
-
-	rcu_read_lock();
-retry:
-	vma = mas_walk(&mas);
-	if (!vma)
-		goto inval;
-
-	vma = vma_start_read(mm, vma);
-	if (IS_ERR_OR_NULL(vma)) {
-		/* Check if the VMA got isolated after we found it */
-		if (PTR_ERR(vma) == -EAGAIN) {
-			count_vm_vma_lock_event(VMA_LOCK_MISS);
-			/* The area was replaced with another one */
-			goto retry;
-		}
-
-		/* Failed to lock the VMA */
-		goto inval;
-	}
-	/*
-	 * At this point, we have a stable reference to a VMA: The VMA is
-	 * locked and we know it hasn't already been isolated.
-	 * From here on, we can access the VMA without worrying about which
-	 * fields are accessible for RCU readers.
-	 */
-
-	/* Check if the vma we locked is the right one. */
-	if (unlikely(vma->vm_mm != mm ||
-		     address < vma->vm_start || address >= vma->vm_end))
-		goto inval_end_read;
-
-	rcu_read_unlock();
-	return vma;
-
-inval_end_read:
-	vma_end_read(vma);
-inval:
-	rcu_read_unlock();
-	count_vm_vma_lock_event(VMA_LOCK_ABORT);
-	return NULL;
-}
-#endif /* CONFIG_PER_VMA_LOCK */
-
 #ifndef __PAGETABLE_P4D_FOLDED
 /*
  * Allocate p4d page table.
diff --git a/mm/mmap_lock.c b/mm/mmap_lock.c
index e7dbaf96aa17..5f725cc67334 100644
--- a/mm/mmap_lock.c
+++ b/mm/mmap_lock.c
@@ -42,3 +42,276 @@ void __mmap_lock_do_trace_released(struct mm_struct *mm, bool write)
 }
 EXPORT_SYMBOL(__mmap_lock_do_trace_released);
 #endif /* CONFIG_TRACING */
+
+#ifdef CONFIG_MMU
+#ifdef CONFIG_PER_VMA_LOCK
+static inline bool __vma_enter_locked(struct vm_area_struct *vma, bool detaching)
+{
+	unsigned int tgt_refcnt = VMA_LOCK_OFFSET;
+
+	/* Additional refcnt if the vma is attached. */
+	if (!detaching)
+		tgt_refcnt++;
+
+	/*
+	 * If vma is detached then only vma_mark_attached() can raise the
+	 * vm_refcnt. mmap_write_lock prevents racing with vma_mark_attached().
+	 */
+	if (!refcount_add_not_zero(VMA_LOCK_OFFSET, &vma->vm_refcnt))
+		return false;
+
+	rwsem_acquire(&vma->vmlock_dep_map, 0, 0, _RET_IP_);
+	rcuwait_wait_event(&vma->vm_mm->vma_writer_wait,
+		   refcount_read(&vma->vm_refcnt) == tgt_refcnt,
+		   TASK_UNINTERRUPTIBLE);
+	lock_acquired(&vma->vmlock_dep_map, _RET_IP_);
+
+	return true;
+}
+
+static inline void __vma_exit_locked(struct vm_area_struct *vma, bool *detached)
+{
+	*detached = refcount_sub_and_test(VMA_LOCK_OFFSET, &vma->vm_refcnt);
+	rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
+}
+
+void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_lock_seq)
+{
+	bool locked;
+
+	/*
+	 * __vma_enter_locked() returns false immediately if the vma is not
+	 * attached, otherwise it waits until refcnt is indicating that vma
+	 * is attached with no readers.
+	 */
+	locked = __vma_enter_locked(vma, false);
+
+	/*
+	 * We should use WRITE_ONCE() here because we can have concurrent reads
+	 * from the early lockless pessimistic check in vma_start_read().
+	 * We don't really care about the correctness of that early check, but
+	 * we should use WRITE_ONCE() for cleanliness and to keep KCSAN happy.
+	 */
+	WRITE_ONCE(vma->vm_lock_seq, mm_lock_seq);
+
+	if (locked) {
+		bool detached;
+
+		__vma_exit_locked(vma, &detached);
+		WARN_ON_ONCE(detached); /* vma should remain attached */
+	}
+}
+EXPORT_SYMBOL_GPL(__vma_start_write);
+
+void vma_mark_detached(struct vm_area_struct *vma)
+{
+	vma_assert_write_locked(vma);
+	vma_assert_attached(vma);
+
+	/*
+	 * We are the only writer, so no need to use vma_refcount_put().
+	 * The condition below is unlikely because the vma has been already
+	 * write-locked and readers can increment vm_refcnt only temporarily
+	 * before they check vm_lock_seq, realize the vma is locked and drop
+	 * back the vm_refcnt. That is a narrow window for observing a raised
+	 * vm_refcnt.
+	 */
+	if (unlikely(!refcount_dec_and_test(&vma->vm_refcnt))) {
+		/* Wait until vma is detached with no readers. */
+		if (__vma_enter_locked(vma, true)) {
+			bool detached;
+
+			__vma_exit_locked(vma, &detached);
+			WARN_ON_ONCE(!detached);
+		}
+	}
+}
+
+/*
+ * Lookup and lock a VMA under RCU protection. Returned VMA is guaranteed to be
+ * stable and not isolated. If the VMA is not found or is being modified the
+ * function returns NULL.
+ */
+struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
+					  unsigned long address)
+{
+	MA_STATE(mas, &mm->mm_mt, address, address);
+	struct vm_area_struct *vma;
+
+	rcu_read_lock();
+retry:
+	vma = mas_walk(&mas);
+	if (!vma)
+		goto inval;
+
+	vma = vma_start_read(mm, vma);
+	if (IS_ERR_OR_NULL(vma)) {
+		/* Check if the VMA got isolated after we found it */
+		if (PTR_ERR(vma) == -EAGAIN) {
+			count_vm_vma_lock_event(VMA_LOCK_MISS);
+			/* The area was replaced with another one */
+			goto retry;
+		}
+
+		/* Failed to lock the VMA */
+		goto inval;
+	}
+	/*
+	 * At this point, we have a stable reference to a VMA: The VMA is
+	 * locked and we know it hasn't already been isolated.
+	 * From here on, we can access the VMA without worrying about which
+	 * fields are accessible for RCU readers.
+	 */
+
+	/* Check if the vma we locked is the right one. */
+	if (unlikely(vma->vm_mm != mm ||
+		     address < vma->vm_start || address >= vma->vm_end))
+		goto inval_end_read;
+
+	rcu_read_unlock();
+	return vma;
+
+inval_end_read:
+	vma_end_read(vma);
+inval:
+	rcu_read_unlock();
+	count_vm_vma_lock_event(VMA_LOCK_ABORT);
+	return NULL;
+}
+#endif /* CONFIG_PER_VMA_LOCK */
+
+#ifdef CONFIG_LOCK_MM_AND_FIND_VMA
+#include <linux/extable.h>
+
+static inline bool get_mmap_lock_carefully(struct mm_struct *mm, struct pt_regs *regs)
+{
+	if (likely(mmap_read_trylock(mm)))
+		return true;
+
+	if (regs && !user_mode(regs)) {
+		unsigned long ip = exception_ip(regs);
+		if (!search_exception_tables(ip))
+			return false;
+	}
+
+	return !mmap_read_lock_killable(mm);
+}
+
+static inline bool mmap_upgrade_trylock(struct mm_struct *mm)
+{
+	/*
+	 * We don't have this operation yet.
+	 *
+	 * It should be easy enough to do: it's basically a
+	 *    atomic_long_try_cmpxchg_acquire()
+	 * from RWSEM_READER_BIAS -> RWSEM_WRITER_LOCKED, but
+	 * it also needs the proper lockdep magic etc.
+	 */
+	return false;
+}
+
+static inline bool upgrade_mmap_lock_carefully(struct mm_struct *mm, struct pt_regs *regs)
+{
+	mmap_read_unlock(mm);
+	if (regs && !user_mode(regs)) {
+		unsigned long ip = exception_ip(regs);
+		if (!search_exception_tables(ip))
+			return false;
+	}
+	return !mmap_write_lock_killable(mm);
+}
+
+/*
+ * Helper for page fault handling.
+ *
+ * This is kind of equivalent to "mmap_read_lock()" followed
+ * by "find_extend_vma()", except it's a lot more careful about
+ * the locking (and will drop the lock on failure).
+ *
+ * For example, if we have a kernel bug that causes a page
+ * fault, we don't want to just use mmap_read_lock() to get
+ * the mm lock, because that would deadlock if the bug were
+ * to happen while we're holding the mm lock for writing.
+ *
+ * So this checks the exception tables on kernel faults in
+ * order to only do this all for instructions that are actually
+ * expected to fault.
+ *
+ * We can also actually take the mm lock for writing if we
+ * need to extend the vma, which helps the VM layer a lot.
+ */
+struct vm_area_struct *lock_mm_and_find_vma(struct mm_struct *mm,
+			unsigned long addr, struct pt_regs *regs)
+{
+	struct vm_area_struct *vma;
+
+	if (!get_mmap_lock_carefully(mm, regs))
+		return NULL;
+
+	vma = find_vma(mm, addr);
+	if (likely(vma && (vma->vm_start <= addr)))
+		return vma;
+
+	/*
+	 * Well, dang. We might still be successful, but only
+	 * if we can extend a vma to do so.
+	 */
+	if (!vma || !(vma->vm_flags & VM_GROWSDOWN)) {
+		mmap_read_unlock(mm);
+		return NULL;
+	}
+
+	/*
+	 * We can try to upgrade the mmap lock atomically,
+	 * in which case we can continue to use the vma
+	 * we already looked up.
+	 *
+	 * Otherwise we'll have to drop the mmap lock and
+	 * re-take it, and also look up the vma again,
+	 * re-checking it.
+	 */
+	if (!mmap_upgrade_trylock(mm)) {
+		if (!upgrade_mmap_lock_carefully(mm, regs))
+			return NULL;
+
+		vma = find_vma(mm, addr);
+		if (!vma)
+			goto fail;
+		if (vma->vm_start <= addr)
+			goto success;
+		if (!(vma->vm_flags & VM_GROWSDOWN))
+			goto fail;
+	}
+
+	if (expand_stack_locked(vma, addr))
+		goto fail;
+
+success:
+	mmap_write_downgrade(mm);
+	return vma;
+
+fail:
+	mmap_write_unlock(mm);
+	return NULL;
+}
+#endif /* CONFIG_LOCK_MM_AND_FIND_VMA */
+
+#else /* CONFIG_MMU */
+
+/*
+ * At least xtensa ends up having protection faults even with no
+ * MMU.. No stack expansion, at least.
+ */
+struct vm_area_struct *lock_mm_and_find_vma(struct mm_struct *mm,
+			unsigned long addr, struct pt_regs *regs)
+{
+	struct vm_area_struct *vma;
+
+	mmap_read_lock(mm);
+	vma = vma_lookup(mm, addr);
+	if (!vma)
+		mmap_read_unlock(mm);
+	return vma;
+}
+
+#endif /* CONFIG_MMU */
diff --git a/mm/nommu.c b/mm/nommu.c
index 617e7ba8022f..2b4d304c6445 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -626,22 +626,6 @@ struct vm_area_struct *find_vma(struct mm_struct *mm, unsigned long addr)
 }
 EXPORT_SYMBOL(find_vma);
 
-/*
- * At least xtensa ends up having protection faults even with no
- * MMU.. No stack expansion, at least.
- */
-struct vm_area_struct *lock_mm_and_find_vma(struct mm_struct *mm,
-			unsigned long addr, struct pt_regs *regs)
-{
-	struct vm_area_struct *vma;
-
-	mmap_read_lock(mm);
-	vma = vma_lookup(mm, addr);
-	if (!vma)
-		mmap_read_unlock(mm);
-	return vma;
-}
-
 /*
  * expand a stack to a given address
  * - not supported under NOMMU conditions
-- 
2.49.0

