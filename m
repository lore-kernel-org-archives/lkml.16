Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA9D21C18C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 21:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744754401; cv=fail; b=tTWai/IaLOPKSYYSw2xln1wlRUa3R7XVBs5/ASB3y16dGYNU/oPHYclUu9dtmjU3retNTcaW9BPYIaxaISFgjcJVELYPi2bu7CN1r51gh+4HKvHui3fZjP0ebOV7PASb3s59WqPsZW8rV8I9gYFHPKhQ23/IBx6sqwM/Z/iv4bY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744754401; c=relaxed/simple;
	bh=qAQemR8i3UOVJEAPcQBMql4exOC8BoLKc6m7EyorOhY=;
	h=References:From:To:Cc:Subject:In-reply-to:Date:Message-ID:
	 Content-Type:MIME-Version; b=Rg6+2Y8BphEMMH7FFYkdOZa23/2HOPU4tysoZB4goM/KYlcGJJxmBKakV2E21VX2DFwusPaeuPhRwY5yWq5sEI5NvEcMR3oMwEy9Jhfr2wOiAiLLnIQnssrLapkzsFKjeC4FSCIG/k2YFx5RFJ9GWlxYcLYIxqF0cTj/ruEuZgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RQDyw8FJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LYXyj+Ty; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RQDyw8FJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LYXyj+Ty"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FKu481017081;
	Tue, 15 Apr 2025 21:59:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=NeTOsZkexEZJNnXY65
	FK2eW9B+3DGXFJDH3O1EIsXnQ=; b=RQDyw8FJBEiBqtdQGxxMm85Krx9CFRslma
	orWX3MuUBba7VcuyEJFmu05kxVEU6CGLi5rhOSaiQCFkmuPAAnkKbZUHG2V7H8gc
	gzXccarIxE6WLBRES0mrFdTiULm6S6fangAfiQWcTTr3KPKRIkhycEbje1ZMPz88
	IWhi7DSLEyA8Dqu0d0c8pD5TEcG3iyr8zZIn+izhIlMf15nAQuXMBh7rHOod5rZX
	2DcZpyMVxkWB+//nVILo/AYo/DXDu9lRflzm8SHBLqLPbJ/AXYbVkQ1VMRNiQn0h
	GiAER0CauyI0WxfaDdlmZkI/TmTM8jYETcCJCiPlpcEK6s1ZB7fg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46185mtqn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 21:59:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53FLj8fM005672;
	Tue, 15 Apr 2025 21:59:32 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d5vxyt4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 21:59:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vzsZStL26O2SNYlKiyXKB7cT5hOjavIhzwRBE1iTDnI+C+PL2yl+VLNiM/eMZ8Oe29yNgYtNh9W1R/s46I366onCSLAkK+LjzzGaqYf17LNwFKHlyKnKTCzhgH4MkHZLHJJAc8tjR82EL0kRC5c+42AeoLauN6rItbWwN6uYJLuPpCAI4xWUTAlZ2Wfj8ycTDZAcI9BSP5l+bd7F+4QCMuN+DUAslFLlVNzjjpmbaG0R/N+wmWdTM9KhCRsBJTupLzu1ADG/Z/WVAyytHEnjk1ITYS5nCgeDhVBoBAlczVAjzXxD1FX5Pq84pOtUPPN4DdjlKwz3bq1I+8SV3WUWwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NeTOsZkexEZJNnXY65FK2eW9B+3DGXFJDH3O1EIsXnQ=;
 b=uT6J5+VkL/8OKiXjU29SDCEJpF8A40fWimg55/KIOrjNID/zu9MTOUfMRdkL7MXm5+qPXejVdkJPHy82a59VppXxeAE74gHfDjD9OiwNX6MGUSZae4flKTyLDNalDcTIeJyj/Lci29TvMyFcvr97U9z+SaIiQwtc2T1cJ6ZPeviIrYoiBa8xvQgoWjv7jEB45WtI7IyL1p6C5SyNpoxSwxQzrKlgrLfkm7UEr48cXzS/uvoJKdTLk6P1A0QABsGz9MgGDXy+mehPTCauWY3buhv+qxlexXTHTz7OmOkXppGWotoiCXGElL1a+O1MXT7e9A+de00AE1HeUakN5aWhkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NeTOsZkexEZJNnXY65FK2eW9B+3DGXFJDH3O1EIsXnQ=;
 b=LYXyj+TyMcPdHQBP1oIsG2NOIsxIHZRHZG+QgFimGocX452MCKOPKUxPDFMSfZ1OUW7lNQM1eanoqmvh3+duzbSWi3KCcjqjwWMq2U1DG7WWtRnTMn5oW4kOl+1p9Z0k77MefkLT5VrK8ok/Wu5ym202F50OWCRMBAsz54Wa9fo=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by DS7PR10MB5999.namprd10.prod.outlook.com (2603:10b6:8:9d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 21:59:27 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%5]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 21:59:26 +0000
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
 <20250414034607.762653-2-ankur.a.arora@oracle.com>
 <Z_yr_cmXti4kXHaX@gmail.com> <87wmbm1px6.fsf@oracle.com>
 <Z_1raKrmWzXIZ0G_@casper.infradead.org>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Ankur Arora <ankur.a.arora@oracle.com>, Ingo Molnar <mingo@kernel.org>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
        torvalds@linux-foundation.org, akpm@linux-foundation.org, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com, mingo@redhat.com,
        luto@kernel.org, peterz@infradead.org, paulmck@kernel.org,
        rostedt@goodmis.org, tglx@linutronix.de, jon.grimm@amd.com,
        bharata@amd.com, raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com
Subject: Re: [PATCH v3 1/4] x86/clear_page: extend clear_page*() for
 multi-page clearing
In-reply-to: <Z_1raKrmWzXIZ0G_@casper.infradead.org>
Date: Tue, 15 Apr 2025 14:59:25 -0700
Message-ID: <87fri9w0g2.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MW4P223CA0013.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::18) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|DS7PR10MB5999:EE_
X-MS-Office365-Filtering-Correlation-Id: a0a96812-1bcb-476d-5051-08dd7c68ca0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Nf+FqXBqka2nCT2xHC/2S+ELvRBK6S8wjfuybw0SzaXSAubdYMs6DpmUpWuY?=
 =?us-ascii?Q?yrxCF3Lm1Sc7JZJgnC4VWbdntjdksP/6whJNGB8MqCQx6jYVKl2shrPIYLL8?=
 =?us-ascii?Q?/Kq1/HElHuFBGOhe8q2H0+JPP6M5sd4ibXtKBqINDDVpnqE/uVRgMI9vw7T3?=
 =?us-ascii?Q?3GJuPBemwiHpht7RvqSQ+8agQ1FmdQGkwUGNp3fdwEO5/cZvjP5v1hWTEdAE?=
 =?us-ascii?Q?/pkYYvEfUDN2kjtszXn9xpuEeZlT4TNk4sHvBNDYaK1W9rwM24n2ONcqxqKr?=
 =?us-ascii?Q?VxACk7YPHoLAckTUM+TsZDkBQ4fP2BzljIdx2PTydWRYdWt9iD2GuX1320Gb?=
 =?us-ascii?Q?aCcexCaA6x/bSjjuN5BGnrdEHuJZWUlMTVjFQtTpjk1q6YHNgafLnl8cYu+4?=
 =?us-ascii?Q?z8p9yZAfjD6W61mzl66g/Ayhfka3QnRE+jfQmAAcblBdlwvwce8SXELlO9ng?=
 =?us-ascii?Q?cVDNvb6OoKWe2KuY5oSbIwLQ0n6vMYWrSl7VyI9eg0wjoNVxZ/JxdpGqPLS+?=
 =?us-ascii?Q?4rrTOo+0U7ssapX0vrm2wEREUXztZQv/BL/sp4TnhkZuQhBM2RLSqmZYZD32?=
 =?us-ascii?Q?XZq+kzXPPaYcVzUJHqfpmzRHYI6DkZE6YRjhEkzFQMIbTQT2qupxd/3S6HDL?=
 =?us-ascii?Q?wtOw5T5nD9fzmoFrOvvg54l8gc3PN/jWC7zd/hSUdXc6QhxwYB5OG9ZY20Xj?=
 =?us-ascii?Q?sOwyrQVJKzTAFbYKxl5E3xomy+Q5+A516vL+dsZm+MwBkHNYuUuFqpPPZZD/?=
 =?us-ascii?Q?QsV3HWB0qoFCWLHkNaHsyBIMRnDX2+8FzfF6BWXiWMAlwqDKMLyftL8QWC47?=
 =?us-ascii?Q?dHCFvfQ6VwWz8pIIpAViXKFhV/eLyU4xUPELexcTkDn4bpRNUrzhPyvkGb1j?=
 =?us-ascii?Q?vhyzCJ2ND53Ds4bL2FnzJhv9e4M0OBARFX7ofmjZp+tHUVSyyl+ERiNgFS9+?=
 =?us-ascii?Q?2qL6v7QQ+lS0z+sUW3k51QQygwoJ7SErs6DfPqz0VZ1TEjeAV/sTuMS9rvRJ?=
 =?us-ascii?Q?j35OCwbi8kwPF5o/43CD/k3ndosuaMx8haLH2xJVNgt22q735tOvT2sJZG+/?=
 =?us-ascii?Q?h2ZUa8nnqFIQKw2Bm8Y1aFWC0KNR94djzNu4Pcki5ssQO5R1jQosV290mAhj?=
 =?us-ascii?Q?+72HsXDdIicOCorMjG7+ncV9wkc9OljRYcCKWqYYD74TD6NeNW6Wa14aMQ9X?=
 =?us-ascii?Q?7lGhmWzwrwPA5aTEyuJ51TNZGQOQoRgifDz9A+7HINo5y8YSQzyB38AEV43V?=
 =?us-ascii?Q?VmgOmX/PKO+xER1IzhxbSYDMaHR2X2rh/kBRU1JsRyXUzUcBCIKLnySkUOHp?=
 =?us-ascii?Q?LOJtmgdB+xkro0rPW4hlyQVTqF/ulekEU+jMcaaju1HtvzE+WgyEr4Obhfxl?=
 =?us-ascii?Q?FNrvxuKgOYaiP9KbiTBA1dRjRPPHzUJAhgHfjgh07uErzAaailoXigZwSpx3?=
 =?us-ascii?Q?oRsvvrxrxDY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w5x5SbFA1ImRL54+NHpt+KRdelI4RR/U6UIWohqnSiFjc9N1omMHO6poIraS?=
 =?us-ascii?Q?wKPG3iv3CIuBkRgsfqg/AXtsX8HxA1wIHxdA4A9U8ioQiTjB169fClxjemSW?=
 =?us-ascii?Q?zVmeUkFnln9QJ5HMXUXKoL1eDihKIWNUqSZtX676rKUaYDajLrTvCYK4nQYh?=
 =?us-ascii?Q?3usSXP2ekpYtHPswqcp+/EpFN3T4Av48MqT22duzl7IBAQrhjLs61yE7Xjaz?=
 =?us-ascii?Q?SBxTXtigA749Lpo/ADKec0JT0X87zl8LcccVErIYUgldv96yfH4/Q/o7Gs8L?=
 =?us-ascii?Q?ZPn+cvMs6IvXHMpGEdkHw1vSfk5tD+9K5vVGRsJxvvH0s1KryUnfhbO7CmJ0?=
 =?us-ascii?Q?vs5v2aN9HBKilm7DbKgHEhxkGzSUAqpdLwBpx6FCBRd418eNK/oQ0cK3p+jg?=
 =?us-ascii?Q?h7uWee7EaCZsKzcxGGdhpsY9uFClDVB6p+2uDSZpbLMqV6SuCWgbmXjoi5zb?=
 =?us-ascii?Q?Q/aSgdHeLCzqm9/GIDegBcn5yt/VuwZtAal8+2envcnodh3YMOtKk2umrEXG?=
 =?us-ascii?Q?lB9TkX5reFIEnYI9NQXKNJARvihYz1HSSAqd3edQDdoFuIqE9OC7FbvVlFWZ?=
 =?us-ascii?Q?kFILRAGBPsn+97peUdql7ALyOBU6sDosKidg44gzZ4vxETeKxfqO+gYDtGo2?=
 =?us-ascii?Q?NCQ13Y4gFtxCVqyuleF/WmVX+o0ZtBE+JXHAhoVHD9JqsV0NaZaCBvoSwsPO?=
 =?us-ascii?Q?agjxRkXe821ud7E2RkyPRYsvT9pJOfULbxfd35d10tnmBhjJeOI3McIjx9b+?=
 =?us-ascii?Q?xE4VoB5B8WkmIJiWutChlPQZJ0p0gKKBPVQK+yerup32i6TbBnYka541MuKI?=
 =?us-ascii?Q?fFm8+vSR6OmqycwaxD5JBfCbTTepnqH8HM3WoIuzTHu8BAQb9BBu9/J5Q5Nx?=
 =?us-ascii?Q?4M4DNW6hNec0PFt+oJXr4FTMN6ACpbBV2TiuKGqXvWXbLMXlvlj717zkLzXb?=
 =?us-ascii?Q?Oa0p+e530unGi5Y71AnsoGhaFZ2R+pt0IELG4sLzKb1Q5lToq/KiOGJ4g7TF?=
 =?us-ascii?Q?ISVoE17oSvgs7Rn2do82irFn/uQ6Uuhl0Gx0qwdf9MUwJ6t2DJOWwqdK7yV3?=
 =?us-ascii?Q?uzucdL8hj+kykKphNYFrdtBzc4aQk6dYnjCRhKTlk9OSUqGFtymVENF6z4ZX?=
 =?us-ascii?Q?52wMl3eTyjbQkptFc3t0KGbYca5Ch2lsbQd9UiN1X7dKr/tmrpqMU2Z8u7T1?=
 =?us-ascii?Q?/BN9syXJpkjUOBvHv5YbEdrc0v8lYHUAtdqz0nBC2XLy+NJe1Q57rL77sl0m?=
 =?us-ascii?Q?u1UtvTPF6yKAHLR2p7C00mrUeMT9cnTVnP+QJlbsjH4betDp0pSRvlFXc6fi?=
 =?us-ascii?Q?RvQ6lpkMkYahYl2LkwEhofjjP62KNfbswYQeeSOayidfGBiauuIPriOl9R31?=
 =?us-ascii?Q?vSVr4WhYieOvN54suJ9cfmWxX/yudqCdKIH22ZqzmJvi3wOoYUJHgjsO2SmV?=
 =?us-ascii?Q?UMjVYZdiop6Zi0UXOLEcTd8/Y0wzWG/XFYg5x4gZNDNFxD4b/37Y0a4OI0Fm?=
 =?us-ascii?Q?aUkTfAolCkC8G8lAtztsHV8vZrNORUBxzHRIBNhYCanzhNKVk3N0eB+gADJb?=
 =?us-ascii?Q?NbvhTxBPbfjxSR7XlNU96g4XHYyID33yQun8zmdl07udS0h7lfAtjuvm/QOK?=
 =?us-ascii?Q?UA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	n2trpkBpJXLJWuxgpNN0ptY9stcGNo5nq2tJjVeIjhQsUI9O/ySxa4/cqhoyNC9HniNA25PJ5OoEBBft7VMUorEtyF4mIevYUu7A4Cb20/V6O7nmQzNWMQKRLzLC+rwxaNUuPMqpiXxPLj98z5dH5v84BuTq/gnPPKmuWtPsHhE4KKgFw+Iva6whMWS9Iap+U8bOrzco3MwhYAImYkcSmNfWNmSbFgIx7dXFW1kQycZ751k1vKM3kpPAmoZPR2OYxzbHhfs1WeqLe+rsZHS3V1LzJ7RV3Y/JfN+fLDaeJW3t7XqyjBclEB40JP1UExIbg4ceFmLcCcRVpBeuCccuLWOvDWv8DgiHJ40DgzOjfS2Y3XaW26zR/lX4u9p78ctkwCaCG55AbdSRYwA3EX/5ymRVj/XeNho2WgiiL5OKjGw7AuSOEjdr671FLbzB9L+sjS8j0TLJLP1Pf7IP/DPS8KVrOljfTO2RLE31ukJT1kIA3fD5XK4gYUR2xQJ9I5rgVLLT2dXRn7rSTlwIt5xMdoEHLEeXv1vWNfXgt46B8yAaQpPEp9mq/4WUnwZ15YYIBOW9Zlbn4QuWLMaE3wt21C8pnMOWrmOIb53JDwAYcqE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0a96812-1bcb-476d-5051-08dd7c68ca0c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 21:59:26.6572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lmmZ1ZGcLz84l5Lap8eiUoN5G1vuNPLC1hRVMPSxZXdlEcEj1XXXgkwRxlQZtHRtLIO8sR4SX3pPHvxJm76tRKf9+RmW7UQxKf+7/hKfMnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5999
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_08,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504150156
X-Proofpoint-ORIG-GUID: y9XasGkMCQ7F9Vx43F3rsdi6LhEe8PGa
X-Proofpoint-GUID: y9XasGkMCQ7F9Vx43F3rsdi6LhEe8PGa


Matthew Wilcox <willy@infradead.org> writes:

> On Mon, Apr 14, 2025 at 12:52:37PM -0700, Ankur Arora wrote:
>> Ingo Molnar <mingo@kernel.org> writes:
>> >> +void clear_pages_orig(void *page, unsigned int length);
>> >> +void clear_pages_rep(void *page, unsigned int length);
>> >> +void clear_pages_erms(void *page, unsigned int length);
>> >
>> > What unit is 'length' in? If it's bytes, why is this interface
>> > artificially limiting itself to ~4GB? On x86-64 there's very little (if
>>
>> I was in two minds about the unit. Given that the largest page size is
>> 1GB, decided to go with 32bit. But, as you say below, there's no reason
>> to limit the x86-64 interface for MM reasons.  Will fix.
>
> Actually, I think there is (and we went through this with SPARC, if you
> remember?)

My google-fu is failing me. I don't think it was this thread:
 https://lore.kernel.org/lkml/1490310113-824438-1-git-send-email-pasha.tatashin@oracle.com/

> We _shouldn't_ be calling memset() with a large size (ie
> larger than 4GB).  If we have that much memory to clear, we should be
> doing something smarter, like using padata to get lots of CPUs clearing
> individual portions of the page.

Agreed. Or even offloading to an accelerator so as to not waste CPU time.

That said, whether to invoke clear_pages() in > 4GB seems like an MM
policy question. Not sure it makes sense to limit the low level interface.

> I don't know how relevant this is now that you're going to be using
> ALTERNATIVES.


--
ankur
