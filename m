Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5211519A6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 06:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743576729; cv=fail; b=ZwuD09YjrhLjbWFfpotdXXejMvpTlqalfuprrdnfKcC6d+S9ywYxb5OXeXukefgOn/RslahcpwmYNiJi8TZxYBc6QOP3mY6QK4Xyul9P5NRMNCx+gY7iN+hk2WouJghVjw/Ri2pJEkzfINXPCbBEYCIIj0uHUPDUuUHeRW9vwAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743576729; c=relaxed/simple;
	bh=UtbrkXrBF5HlSP+rrRTyE+NGjubqDuzGS8qnnKE9sxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ONMY9ZdkyyWyQDGtrp6N4A618Hs8GruVv5WPxaq7RkuroGAbVQizUF5cGpfwbz1tKuJJj7ywTiHCvmtY1O8cXNeEFvPmyZzZjsCDH29kD2Z/1OHVlH3alw/q6eV8PqfhLiG9/9Iv7PkV96HAYZcUEIqo0axlZ8EtVQARHr3yUMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hB5dzzjN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LZGjwmB2; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hB5dzzjN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LZGjwmB2"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5326g2Ao012649;
	Wed, 2 Apr 2025 06:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=yyqxDAs7soM65LoGoH5XvccJcMpBYgob6Y/1hHpN9rQ=; b=
	hB5dzzjN7pVR1HaDfzYYr8aUo1eSHGby1j3B3OWmDyWvdG8Qr7iEvwCeD9D47htm
	rAHd5h12oBaROIUnpfhzQ5i9FOd3/W8r91jOBPR1Q4ecFmA+UdloDUjOqv8pFsh3
	1MgqahlYi4Km3cKZGMuqbEMB0wA2XjEleK8sUovhzY2FUoaXiIm6WMgwXMagOvt2
	Po/VYuT8GCPdFPRCsQqsUNj7M+lscXOUG/xFW/85iy+fYH6ZEV0cs37JvYfwFR78
	UMtnScPPRpg40eHZE3xKPQsG019xcikDowpOfBYZaSyU5jsuN/SLrubF5NWdOO72
	WAzcP0u6EFQmSvIg3obUow==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p7sassp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 06:52:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5326IeIb004515;
	Wed, 2 Apr 2025 06:52:04 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45p7aagpgm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 06:52:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s7EHaYU/qfrSshEd2rPRdAq1nyyRp6hhxhTGNyrQ++wFwnth0JaOWZoIcl7r+8x/vlnCeLP2oYmjjYeaatvIVWvHOIIXgdnLaiDbSnvzPaK7eQKFXfQYxs3RiQB2IrAlJOCQPeTlHkw0T/zkTarTXGt8mbxac6GE/Xk+7X0IrPShu8qUnApkxF/U+iQIBOvXQ+xOim2bWq6ogwP42mLp2ZfSxGCbYh86nmG+Rs1X2jLv8GcLyKZmpQ6p9QvvNWU3XNMdNx8p7wKBrf7/UtE4baJO3xo3OZ3EtVRLAs/tQKeLZ6JjdYo+XgOOT2H69Rwdwc0bczCzxEBKvanymUCw1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyqxDAs7soM65LoGoH5XvccJcMpBYgob6Y/1hHpN9rQ=;
 b=y+p3Uknty1jBkHcu4E5cPbMeHMJJs7IOtmcV706FW0bg38HqWGV82wKvdRaIWFZR9qqI4RNy2QaDUSrtClelDqhvEu+SrrSRD/ULq5FMPkjnLbQSFXI7FA9qLFIffSfQ1E8qsDnseqE2UcPpOEoiZMg788F+4oeEMhxlQ3h/yMYmJjwDV13lE+S3l8+Q6YMpMtOh02XhZxX2jW8RDZ9COS7fYstGtTcdtbuzBbMZccZo/ORKtDW5p79/DPTmX+6RiddwCQIM59ZLON3HOWFQyYf7c5+x9keNlzYmh2s9/gMnDJl7sYzHqS7L53c0vS4WZJkz4+FUiOWDTZUQLduISg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yyqxDAs7soM65LoGoH5XvccJcMpBYgob6Y/1hHpN9rQ=;
 b=LZGjwmB2iombbQgErRPCGFEPTtFBJU1I3p/ewpkNGvDKTh8K3PEdlcFdly5PXQ/mMtKGsGjOZycuOVLwPMRFvzg3ftohvDFkJsDSoUD7d8g1K5lnSuj5Lb045ibrITJvj0WwgqQfkobGkUxS+ziaYhq37tx8GgyjfET3t/5U8S4=
Received: from PH0PR10MB5563.namprd10.prod.outlook.com (2603:10b6:510:f2::13)
 by IA1PR10MB7538.namprd10.prod.outlook.com (2603:10b6:208:44b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.39; Wed, 2 Apr
 2025 06:52:02 +0000
Received: from PH0PR10MB5563.namprd10.prod.outlook.com
 ([fe80::1917:9c45:4a41:240]) by PH0PR10MB5563.namprd10.prod.outlook.com
 ([fe80::1917:9c45:4a41:240%4]) with mapi id 15.20.8534.040; Wed, 2 Apr 2025
 06:52:01 +0000
From: Siddh Raman Pant <siddh.raman.pant@oracle.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] published: CVE-2025-0927: Fix up JSON schema.
Date: Wed,  2 Apr 2025 12:21:52 +0530
Message-ID: <80cd3f46783cd5702b3abd40c11f3f08f64717ec.1743576485.git.siddh.raman.pant@oracle.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <2025033057-CVE-2025-0927-1436@gregkh>
References: <2025033057-CVE-2025-0927-1436@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0015.apcprd06.prod.outlook.com
 (2603:1096:4:186::7) To PH0PR10MB5563.namprd10.prod.outlook.com
 (2603:10b6:510:f2::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5563:EE_|IA1PR10MB7538:EE_
X-MS-Office365-Filtering-Correlation-Id: 6441631c-23ed-4a24-3eb5-08dd71b2dea6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MUpQbXZZbURLeGdabjNWeHYzS0hiYW9VdXdhYUhyTGdrdFJCK3dJVDkvV2lP?=
 =?utf-8?B?bS9zc1JzU2xtM1dUMXIrNTRXdnR2UUJoZXoyZm9VczZSNTRKZm5maXpnVjl6?=
 =?utf-8?B?TkZmNXpObEZld2V4Q1kzeWJYSjNmNkNjcy9TVmJWZ2hWS2RvUUxTMFFPOVRo?=
 =?utf-8?B?OUdOM3dVdlNSVXJ3NkJSZ05IMDJTVExaK2NIZ0FqeDQ5dS9ZSm44Z01jMVZT?=
 =?utf-8?B?UHBYZ1A0QnluendhaEtGd2hRdklySWYzbURNZWM5KzZncElpNEZUWmY0MFdV?=
 =?utf-8?B?Z24yTGVDNkJVZ0lVemo1REFLdmNlK3ozaFRxaEJob1NOaU5kZ3JodU91TUNL?=
 =?utf-8?B?dWxUYURkdHlzQmR6ZUZMdW4yNlZhVFpCMFIyQjJwSmRxcFoxYml4alIvTk4v?=
 =?utf-8?B?b3lqRHQ3MXdjaHQxbkY3SlNuZWFYb0JtdENGc3dZd0I3ZzFtZTZuVXBEL3hT?=
 =?utf-8?B?TFliUzlPeFpiVHpJc2t1VEUrdDkxVnRGYmJidEZPSGR5a3d4RHdRb25VTzY4?=
 =?utf-8?B?SnBFclRadTJFbjB4VmVRSVJFUVFCbmR5NWdTODFzaXg2dHZqalNsYnNuYnNW?=
 =?utf-8?B?Ujd0MEFOeWJ5R3JrQlMvaTNnbHI0L25scjI4YzRKVmc5QVVkLzZxaWhGTTR2?=
 =?utf-8?B?MC9HaGNQWjJwc0w1NmVvUEdhMFNLaUdJdDBuOFBPa0lUbXZaMjgxeHNzNlFp?=
 =?utf-8?B?aHRkdGI3UDdpbEdyaTFSV2J6aWdPTEdQR1NHbnk3dndyNU1tTnpoWWxOOE5X?=
 =?utf-8?B?OXpaMHRqSittVUdKQldNWGUyRSt1bExyQ3BrZDFSSitIUUVzUFQ4aThnTjhM?=
 =?utf-8?B?bnhicmhwOXNJcVBoMndSclFqaU1WaVJ1WFlYZndsRE9XbFE3ZTRCa1htUUp2?=
 =?utf-8?B?aEJnSU9OREtEckZDLzVpYWdGeTdXSnZvczhORlNBeUdQNWdkQUwwZ0xFNi9S?=
 =?utf-8?B?Q3g2ejVVdEVTSHAvSWdId1grVDlwYUU4QWFBUmFtZmlXUVRxYklRMER4VHAr?=
 =?utf-8?B?MlBPRkd1Y1FxczdqaENCbUdndGFFWnpJNlRaUzJMLzRQZkpMWllTNnR6MlJk?=
 =?utf-8?B?RktUa29kUjhnMUpOOHBhUGQ0bkVSODdJb2VEQ3owREtjRGF6cVl4NEZKQ2VU?=
 =?utf-8?B?SjZHeU0vRzNlZzhFdllhdkZGRVZPRnMxbXkzb3F5Z3dEbFJ0bUlFOXIwMFNZ?=
 =?utf-8?B?UkEySjFmMFBSUTVxdU93THgyMTJYd2xZaVVhQlN5YnFQZ3pJOWZiN2lUazRN?=
 =?utf-8?B?eUxqamczQXNRRHBBL3hPTnFhWnlxNEZ1a3Nmb2d0TE4zYzMwVTdSSG9wMjJJ?=
 =?utf-8?B?OFdTNjFQaGoxbFhHNlpuWExTVjhmMFRxSGs3ZTNOUmRTU0s1UURKMVRWZWVj?=
 =?utf-8?B?MWRPMGsvK0RadnI1OGdiZ0hKRGlEVjU1akQyK1Y2Y0pUeExHVjRYaXdqaGZD?=
 =?utf-8?B?dUMzZk53cmcweUFGbXpaaTFvUGxHL2pRWS9aczlsL0hDZnQySjhKMUxhYWNL?=
 =?utf-8?B?YXhUYkttWWU3dXE0L3YwWVBLZWVMMTdySEs3aUR3Y01IcUwvZndYRXdxOWRC?=
 =?utf-8?B?NVU0TUtra25ZcDJJL3JTenQ2UUl1eUFPMGRnLzNwaWk3d0hudkRZa21SSldr?=
 =?utf-8?B?a1V3eGlQQjJ6bmpCb3k1djdBU0FUa0hxRHRNYnl6MitXazIraHQ3eWw3dlN1?=
 =?utf-8?B?RUVERkM5WFJwcGgvSGp3VkFqL2V4cTE4ZHVGQjZERTZHTzQzTHdGejJPd0Fn?=
 =?utf-8?B?cU9XcmNoL0lNNFpqVUYvOHNkVkFDOGZva1VHZmh1Yko3dUVYU1B4SVc0WExK?=
 =?utf-8?B?Y2tyUGJhSUxLNlpBU3g4dz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5563.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWo2cStwcncxNEVxdE1kcjZMck1Ya1JNVnZhZXd4a3M0NTZHaWZGcktFd0h0?=
 =?utf-8?B?dVI0QXRiQzNmeEQwK2RZMzFQUjlEWVVMRThzSnFMQ29UYlpGd3IvcTdtTTVU?=
 =?utf-8?B?OHRYSGxNazQ4UnY3WFdvQVl1RysvanlMZk1TdnNPZnhUaFV3VEJmZWJlWklM?=
 =?utf-8?B?UzVCUHNlMnRiUWpBbkgza1R1emtFWHJmVHp5K0Q5UkQ3Uk5TRGtPMWsxR2lm?=
 =?utf-8?B?b3pUUUJLeWhlZjBKY1JEblUrZjV2UGdMcE9nbytGaDBGaDU1TVZRSTM5NTIx?=
 =?utf-8?B?bzBmNjZGbUlDMFFOekFoN2cyaWlnTXVDcGQ4akZlL3d1UXhBNThJS1BpNzRx?=
 =?utf-8?B?ekpNVk5DYlJ1cGphcmtGTG9zREs4dWNIRjdPcG15Z2NaRThCcXVtLy81OXlF?=
 =?utf-8?B?TndlWHkrd0IyLzZqQUxpcjVNUWlKOGxtbm55MXdaczk1YmtjenQyVG93elFW?=
 =?utf-8?B?cFJiaFhra2dMMHVMOEVpdDdkTlVla21PTUFlN0lML3FROTIyVmlmdWd3bzlW?=
 =?utf-8?B?T2xsRjJjMkt6SEJubC8yenZMQWNGL2FqRURvTVNGSGM2QlQzU3g0UjVyTys3?=
 =?utf-8?B?eTFTNWwvakk4dW5QREFYWkUwZCtiOTZTalMwanJYSTRXdkJBOGxLVk84cVl0?=
 =?utf-8?B?cXNjZU5WM0RRdzg5VjJOTWJ0T0NNRlVZMVdRd3FIclVJN2txZUJrczYybGNv?=
 =?utf-8?B?RHBkeFJyTml1OXdKZ2E1MmVLcVREQm5PejFkeWliT1lqY2hycnJra2tJY1Zr?=
 =?utf-8?B?TGNYSklsOTRpd3I2Y1hTMmU4ajIwaHluVGdZRkgzbXlWWEtRV1pKN1UrcHBS?=
 =?utf-8?B?VEpqd1ZoWDVuTGNBc1phTFZ3L0VJU0pCWlVBWkJsN3VQb21UVXZzQ3dmRVdn?=
 =?utf-8?B?WmRUUzREd1NPT0FVaUtkOS9UZzFReTZtLzNSUFMxdmY1eGJiVUJWWmx0dThQ?=
 =?utf-8?B?L3Z6dUg3K3IxL2Zndjh1Z2t3SHdINEQ3NEJYbzA2Sk11V0tmdHdjT1ZiaytF?=
 =?utf-8?B?TzF3dzBmQUU3d04rTmNaMHVDQjdDaUtIMWgyYmt6THYvMFZieEFZQjhDSFhs?=
 =?utf-8?B?Sm1KQTNhNmFjNjgvNFEvdkdBN3BsckdURkRrVERrMDFTR2R0YStFUFpGOHly?=
 =?utf-8?B?dmNXdVpYUklTcDd0S1g5Nk0yUVY1NVM1OTVqNzBCakorNUpOQ2hZcEhBc3Z4?=
 =?utf-8?B?dEZMUjNWakh4bHphajE2aEJoZnhDNmEvYTJQdy9Rd3hvc0ZmcUhSV1dPZjJX?=
 =?utf-8?B?UEZkVTVnVmFJcFRzN0svUVlMOGl0UVplK2JmL0xNOUlGNVZVYmhIR1psVXhY?=
 =?utf-8?B?ajZldno0bFlVM0J5UFdaNDRWdDdRWUJTQXZPRTFNTVBMSzlGNlVmaElaOEFi?=
 =?utf-8?B?Y0dla1htK0hsblRnRXRHQU1GU2dEbEQybUFXd1RRR0Vmb3dvbHZIbGNHSmlJ?=
 =?utf-8?B?ckhzbVA1djJENWZXQTVFc05icGZ0YjRuWXltRm9VQWZBcHl0cHFUWXN6amRM?=
 =?utf-8?B?cVl2dlZOZ0dmMDNKOXJQNStrcUVScVZrMytmSmVzdkJuaDBYS2V4S1R4bDda?=
 =?utf-8?B?dnlDQlU5NytrdWVnWXNJbXA1UDlDSFF4Y0ZiRzZ4QjNPTTZFOXZqVW1VSGpt?=
 =?utf-8?B?R29QNFUvcGlYaGhiekZ4bEFuWHdPdW9PSHZiWCtOdXhNQVVTdzhDRFFYWXFK?=
 =?utf-8?B?S0V5b0pha2Z4OXBKZFdmaGVLNnlqdit0ZjRFeG1BZTl4dUh4WVVsVHg2RHla?=
 =?utf-8?B?aGNRR0dNRzVPRHVvOWNTeEhpbGxBY2FpSHJOc2hteklsV3FaYkNUSFJPcW9F?=
 =?utf-8?B?MWVLL2pvQXdWRGt6c0JMMDBXYnNMUTRiQ3dqaW5HWW4vWkU5VU51TXlpY1Mz?=
 =?utf-8?B?SG1Va3JhR0lpNG4xUzRDZnhFQkxRUGJSU2FGZDdublJyRUg2STVyaStUVDM4?=
 =?utf-8?B?SUw1anVOSTdqK0dWaDZSV1VtVW5rcFhzM1JIWFNvcFJjeXU5U3RFZkE1b3kr?=
 =?utf-8?B?SjJqWVNFeUJDWmh1bFpTOXpkamxZT1YxV2Rxc3VMMTY2bWdkVVNDYzFhV1Zl?=
 =?utf-8?B?U3VBQmljS21jWWZVa3hKdWxBcSt2Wk54MTdJbTVvRXdyS1NHbFRMSGFIZGdC?=
 =?utf-8?B?eFRmdG9kWDNqdzR4alFVSnFSK2g1SkpEK28xTjJiNFFveTkyRm9QWHcxelRa?=
 =?utf-8?B?SEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	K75HtcFB27hW3Pk8ckLb2/kRnN5PjFXTnGRZijyll6nRzEjA+jbHtpxp/9dmNOQayp7PArlz4qhzCFGp/PZjrKd9LyMVlkRO4h8+p5y1A1pUmJlW3CVrh08E8wEg9qKMC02vguEBZD4C4MEhQk/PsnM4YghgA16Crc6/hCNzPlEu6C3+bMgfMbL0mSIMs4TOZfaPHrgoW8KyILME2VTs2nhCmi3g/jLSzCGgRrceYQ0y8gtf2XRSkgIZCi8qMl1eZDeA51j7v8eWw8gq7KcDZ5B981xCydRM7mxfQ/ycRJl4IqkufbaKnRxj/RfRq8W1dyJb5QeQ1Cxs3nVD5qxnbUSb6GMt7rPy0tb6ytM3L3LEKGpuKPyrulKxXxqUnWTR73pJL221oxj67jhc3Ie6QQyjuuY4rPjW6sm4/wbJmFrpXINZFS1z3QdoUX2gwArF1dha3n/HvLAhisiMt4bR90aMWPyBJCAXrRqqj7O75TRHrFHN1Ax9bKSqxDnwV7Rtd3IEgmU6oItG9WeOsVkQ1wYmP7vl55MDMK8J8I/6OrTXNV8XhlHrPMk+4okId42pkPpQxosObaS4Hi9TYIAdA9OGciMEzXCw15Xyl+ibLhk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6441631c-23ed-4a24-3eb5-08dd71b2dea6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5563.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 06:52:01.2234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eMZ23PuChko1WHokp43PWjMxCBhuJyVDMUZQPAlwWwprcLY5myYlvcNQTOEMgOCmgPZRj7QFfs7IGsCsJ2lrNe8hQgMSGIX6F44bfSHfGBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7538
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_02,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504020042
X-Proofpoint-GUID: 1BV9afNGW3fe_YsmCpmvz-oR_AkHd8Ja
X-Proofpoint-ORIG-GUID: 1BV9afNGW3fe_YsmCpmvz-oR_AkHd8Ja

It doesn't match the schema of other CVEs as it was not generated
by bippy.

Fixed by hand / manually.

programFiles were added from the info in mbox.

Signed-off-by: Siddh Raman Pant <siddh.raman.pant@oracle.com>
---
 cve/published/2025/CVE-2025-0927.json | 36 ++++++++-------------------
 1 file changed, 11 insertions(+), 25 deletions(-)

diff --git a/cve/published/2025/CVE-2025-0927.json b/cve/published/2025/CVE-2025-0927.json
index 0a61961ede76..743e70d4b100 100644
--- a/cve/published/2025/CVE-2025-0927.json
+++ b/cve/published/2025/CVE-2025-0927.json
@@ -4,8 +4,13 @@
             "affected": [
                 {
                     "defaultStatus": "unaffected",
-                    "product": "Linux Kernel",
+                    "product": "Linux",
                     "vendor": "Linux",
+                    "repo": "https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git",
+                    "programFiles": [
+                        "fs/hfs/bnode.c",
+                        "fs/hfsplus/bnode.c",
+                    ]
                     "versions": [
                         {
                             "status": "affected",
@@ -17,26 +22,10 @@
             "descriptions": [
                 {
                     "lang": "en",
-                    "supportingMedia": [
-                        {
-                            "base64": false,
-                            "type": "text/html",
-                            "value": "In the Linux kernel, the following vulnerability has been found:<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  <br>A heap overflow in the hfs and hfsplus filesystems can happen if a user mounts a manually crafted filesystem.<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  <br>At this point in time, it is not fixed in any released kernel version, this is a stop-gap report to notify that kernel.org is now the owner of this CVE id.  &nbsp; &nbsp; <br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  <br>The Linux kernel CVE team has been assigned CVE-2025-0927 as it was incorrectly created by a different CNA that really should have known better to not have done this.to this issue.<br>"
-                        }
-                    ],
-                    "value": "In the Linux kernel, the following vulnerability has been found:\n               \nA heap overflow in the hfs and hfsplus filesystems can happen if a user mounts a manually crafted filesystem.\n               \nAt this point in time, it is not fixed in any released kernel version, this is a stop-gap report to notify that kernel.org is now the owner of this CVE id.      \n               \nThe Linux kernel CVE team has been assigned CVE-2025-0927 as it was incorrectly created by a different CNA that really should have known better to not have done this.to this issue."
-                }
-            ],
-            "problemTypes": [
-                {
-                    "descriptions": [
-                        {
-                            "description": "heap overflow in the hfs and hfsplus filesystems with manually crafted filesystem",
-                            "lang": "en"
-                        }
-                    ]
+                    "value": "In the Linux kernel, the following vulnerability has been found:\n\nA heap overflow in the hfs and hfsplus filesystems can happen if a user\nmounts a manually crafted filesystem.\n\nAt this point in time, it is not fixed in any released kernel version,\nthis is a stop-gap report to notify that kernel.org is now the owner of\nthis CVE id.\n\nThe Linux kernel CVE team has been assigned CVE-2025-0927 as it was\nincorrectly created by a different CNA that really should have known\nbetter to not have done this to this issue."
                 }
             ],
+            "title": "heap overflow in the hfs and hfsplus filesystems with manually crafted filesystem",
             "providerMetadata": {
                 "orgId": "f4215fc3-5b6b-47ff-a258-f7189bd81038"
             },
@@ -45,21 +34,18 @@
                     "url": "https://www.kernel.org/"
                 }
             ],
-            "source": {
-                "discovery": "UNKNOWN"
-            },
             "x_generator": {
-                "engine": "Vulnogram 0.2.0"
+                "engine": "Human fixing output of Vulnogram 0.2.0 for Linux"
             }
         }
     },
     "cveMetadata": {
         "assignerOrgId": "f4215fc3-5b6b-47ff-a258-f7189bd81038",
-        "cveId": "CVE-2025-0927",
+        "cveID": "CVE-2025-0927",
         "requesterUserId": "gregkh@kernel.org",
         "serial": 1,
         "state": "PUBLISHED"
     },
     "dataType": "CVE_RECORD",
-    "dataVersion": "5.1"
+    "dataVersion": "5.0"
 }
-- 
2.47.2

