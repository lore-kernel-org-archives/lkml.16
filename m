Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678BF226D04;
	Tue, 24 Jun 2025 17:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750784981; cv=fail; b=X3RQGeipz+yJbtgtp+9qjlhe8wTU2jqjd9dq5UshVWuU3henjVqM4Z4LdFe5T6E+cT9JEhYjRtMNVjmcoOymx11uO4lHq0PsCJgzmdPS5LVqkDj6TOIqMvXpVwA0XAWmaXwoo4ORwPC9oQAcKySjYpiRf84vIJ2IeCS4raKTHyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750784981; c=relaxed/simple;
	bh=Ipro6aVQwTi7WgyW0+KN6S5yyZ596sur/YYuvWvvzB4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iSGxVBm9/5fy17a+PuW4gy/9/Rx1g5+FxjfmbGXPQP8HC+R/+xdGfp/o0xYPJlDidZ07htxQp73lwXQ+gXzs3UKYzAyh7kF6zqyOvg688zgBFOIW2MLcCTBUixWUKQNhxSQUeIY+GezNOiSF38/w+OGug+sBRPMdg31fJYDHMes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mlwKNm64; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CFzF9vr1; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mlwKNm64";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CFzF9vr1"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OH4k8Q014371;
	Tue, 24 Jun 2025 17:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=opPjxhWFt9kZu6TEhie7ZAv2UGgaBTkyNMqoMu5dgmg=; b=
	mlwKNm64HY6mA8VQ2eWtNMVPeLdNogNXTsvp0/Lz1WTLKy6DQD7AsjCuLdHYoV1f
	6FvEAOmJP95mrRY6Vhe2otpHYjs/cpMmma1X5IxTPIK+P5W00fbBkvq3rpfNtf+B
	huPgoV0AOP3N/EZM64kNnIgeejUIQKf2h11TRs/rXAvsy9wBmBT+3tOfRfuMfrDR
	xxmbTZ7y6CwTRq0JBC9hlh0X34naYtEPM0REzClyy47Kdstgj2mZ4dC5IGwl6eMB
	YwgWaigQU5Kgive4CDDY+9sdCkUV1muKnCpV0Y+qKysehXITq7lVMvr89ENabCpf
	zKNT54Z2A/Ucwcy3URrTKQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egt1cgen-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jun 2025 17:09:28 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55OGQ0VQ031509;
	Tue, 24 Jun 2025 17:09:27 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehpqder8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jun 2025 17:09:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KurhSxFWgGpI4bYO+bWq/2yTG+cf+XALDi2pdMEv2qPJFbV5J7YZK1TM2CVmqqiYpcH1yits2taHSSQcjqIrd85H1PN3s5t0DXB/594WUSwZHRd5UGW/EPa3/RY+y8kNH4MFmPPMMhXu4iKCyPTyT/1vpUyGl2evQ8ic3CYqLnvDdrQarpDep6k0pQnuAkayypk0f2ztD+6jbWkOqaWr+t8cbOl2yHUOltgQL5kuyTCYwfdnGEXb/uwANtvdT9noh5YbsZe3wtKNcPS5laG6H+GwSNcUkmsU8z90ESOQtvJUmALrk7/RDv1LPfXjCDaFNQDjZnqQ07++TmritfC3/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opPjxhWFt9kZu6TEhie7ZAv2UGgaBTkyNMqoMu5dgmg=;
 b=pZ051Hoh9VxhNvAZOwsuiBDbEWio8kbeNr6Zg+hkSjgjcuzKAg5qOqzR/fPv2/xM9Ppm5xKCuCs7MB5HA84pnaa4AeIIB+z4liKx+31ammAXSAo7xQfZdAomjzmF7PWjmFukE3icwF3NbG0roZtTYtyRcZycZy00fXaOr4mBNRQYQ5DHAChuhf9AOwZFVPvb+GHcJSdUtulckr0sL0At1QNItDQ0P9gEpdJDcBbaJvWYApj3AaQQAJ8picf7UiS/rEfua6zWuSMdRhiDdRcxBTjjv2hlA+4IuJW2oo8eVQnTo8A1DFYMYZGxC2mc14eWzYZSdPiMfBFRmlhP/Smnpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opPjxhWFt9kZu6TEhie7ZAv2UGgaBTkyNMqoMu5dgmg=;
 b=CFzF9vr1ul3DKQqVvbzHqfG7lJrHxiz7wa3pf9jnXI2BSbV32lajnh6NkSpSx+KIBqJaaMXjZtASB0kwgQjnokcrM3UM2myJXHxGAFBFv4dqu6FBkURwKU9gcKZkta5xUEQZUzGvvv9tSOFu7p+GEHrVu+wjgnIs+/DPIq5LDCo=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by DM4PR10MB7528.namprd10.prod.outlook.com (2603:10b6:8:184::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 17:09:24 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%5]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 17:09:23 +0000
Message-ID: <cf197270-bdca-4624-a2ad-9bb56429b5b7@oracle.com>
Date: Tue, 24 Jun 2025 22:39:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [External] : Re: [PATCH] clk: microchip: mpfs: Fix incorrect
 MSSPLL ID in error message
To: Conor Dooley <conor@kernel.org>
Cc: conor.dooley@microchip.com, daire.mcnamara@microchip.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250622180352.4151679-1-alok.a.tiwari@oracle.com>
 <20250624-monotype-disorder-aedee5ef7cfa@spud>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250624-monotype-disorder-aedee5ef7cfa@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::18) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|DM4PR10MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: 51e55f5e-2d58-4710-e9bd-08ddb341ddd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UHNWUmgyR25lc2lKYVVzR1VhTkVHVGNyR3JIcEZjTlJSYTRmMDI2RVdRbGFx?=
 =?utf-8?B?NnNHQ202RzdOeWFtOUR5RExrTmY3MjB3RzJoSjBpcGlheUEyN0xBeEc0ME4r?=
 =?utf-8?B?d0ZNWmhHemVOU3Q5VEhXNExKUXhGanFRZ29waFZubVNlMDVnNmV1cFlkaWRq?=
 =?utf-8?B?ZTB4bW5qMkFzdEo4U3N5YmNRdytYZ1JDMDFpd2s5eG5yYkRiTmQzR2JLbENJ?=
 =?utf-8?B?TmhEODhIZHZqT3lLbmRWQWhaaURnQWZ2RkdoVXcwTm5DdklFM20rcHAwUktG?=
 =?utf-8?B?QWFXN1UxczBhdU5BcXM2SU1IM054S2pUUkxFYW4vOURIUGhYMzNVbG1ZUWh3?=
 =?utf-8?B?QUh4c21TYk5Lc200Unp0MnNlcTJXZXU4cFB6TEgzeThuZmdwY1BrUmpYNUt5?=
 =?utf-8?B?dlRzT2RxL2k4OXk5TzJwa2FMZFpQU1VmUkZuMDJKS0o2aGhTU2VGNytYc2lI?=
 =?utf-8?B?TFFYKzFzSjVpdDg4bUg0QUdiaW15cVo5dXVHUzN3eU5IYlV1eS9QRTNyUTFo?=
 =?utf-8?B?RVZ3Slk0YzZtTy9Ga3ovbmlhM1BtTWQrRUZXbkRhU1BxMWZzWWVFN3Jrcjln?=
 =?utf-8?B?aFJUQXlqM3kxcWtHU1BIRnRJSGRSV01oV1VJQ1RlNTlwRjU3NXZQM3JNb0Uw?=
 =?utf-8?B?Q1F6TDZyQVBzZ21FMHF6Qk44Q0p1RGJoQnlqVUdRR2Q4RHlETFViQ0tZNy9t?=
 =?utf-8?B?UnUzM1J2YmN6VUorMWM3SmZ2dGgwZUR6dUg2UDgrcTFIa1pYcDVMT3NnNnNa?=
 =?utf-8?B?MUhqZHZ6dW50emJOV253dVc1eXhqaGk4b0R1SGtWZ0pzNjNHQmdJNFA5SEtK?=
 =?utf-8?B?bWFPbFI5LzlNL1c4STYzR1FlNkZmU2RaVlBCMU56TGxHQVhJbGFWQU42cmRJ?=
 =?utf-8?B?UzFTTEJtalBkSFU1cEhYM0loYndCMFRHOWoxWjRzaEYzdUgwRGh0eEdCelI1?=
 =?utf-8?B?QkUvNzRiVmlOM3UzMlc3UENxLzcxTFdKaGhTK3U0RW1YY1c0RDhncWVJTmlG?=
 =?utf-8?B?T0RaWHA0R2VjOE5HVHVjdGllMXFPZHduNmwzUTA2WEZ5WWdORiszdFhnR3NM?=
 =?utf-8?B?R2ZTeUxEUXM5aVBnUHNVMHpDb2pYZlpzMHdCZUE5Zms5NENWWFdFem5BcmlB?=
 =?utf-8?B?cjRyYzBWeFRZS0ZxYVU1am44Ukc3R0daR0ZkUDJJTkV6ZmRvWE9ZR0hTWStR?=
 =?utf-8?B?dFZQcnRmbFlJWk94cHRldlJNcE1aUTllb2dacy9veVQ3UkV5SFB3c2d5SEo1?=
 =?utf-8?B?TmxoNU84ZWxhWUpPdi9raStXeFJobFU3TWtEVlpiREdLWndoODBTWkJUd0Yx?=
 =?utf-8?B?RTNDYlhxeVczRUR0UFFQN05pejVQUGpDNjdaL1NDTnlDRG9zdGF1K3UzSW1O?=
 =?utf-8?B?OWtrWGRjeUJmSmE3ZENpbSs0YVg0Y2o4UUo5Slc4dVZ5NURZUm11aEFUcmtO?=
 =?utf-8?B?VzF4U1NiNExGc2xUY0JFbWpFQy9nMkNoSkRJNEp6VSt5dFRvc2NCZHBvRDlK?=
 =?utf-8?B?azM3bE5NcjNGUnBQVGN6QjYwRmFFM2RYVHgrVUdkWHU3dDFRQmZJcXdIM0k0?=
 =?utf-8?B?UnpSa0xnWnRrbDFuMCtsSkRNekFldUg1SUxCcnJuQlpUdDg1U2plYkVCQjNw?=
 =?utf-8?B?NXU3dE94U2lSbEx2V1ROcjNrNEUyQkcrQ0kyMStJakNKdlB4bXhtTWtFNGpR?=
 =?utf-8?B?aDdacGhmZnAxWUhqbVRaV1pqZUxtQzU5TG1BSzJsOGs5VjBHSlJLaG1nL1BB?=
 =?utf-8?B?QnllUkU2Y0cvYjJtOHJYMXByVkN0UnR4c1RKRm9TWVBneklOUlpTWnJROTUy?=
 =?utf-8?B?SWU5cmRISkNJbGZ2TWVPV3NPUjZkdUtqeWpkNEY2TWZNUGMvOVdoRE9RcWJs?=
 =?utf-8?B?aDhHQ01Jd1RKUGM1Uk9mZFFBblFyTEtOS20rQmdEZGNiY3gyK0ZVUFhKZzB0?=
 =?utf-8?Q?YTjz/OKqiOI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aldiMEYwWEtNc0VyNGZ4elNybzZlSkM2Q1JVT2xZYVJsdkdhejk4VnhLQjdn?=
 =?utf-8?B?Si9rTjZRckF5VXJTd1E5bVpIc3pTMGRPM0lYdzlndG12Y3pCRFlBRm9NdDZN?=
 =?utf-8?B?RXYzblFUeXYyVTArcVpLOHY5Z29jb3lmdDdlNXd1UnZmTnpta0ZnN2dnMU4w?=
 =?utf-8?B?R0tUTDVKRUNFS3dDZjByaHZoU2UxSnFzTUUwN3JZWCt1dUJNWlZzOHM5RTlr?=
 =?utf-8?B?YlhXd212Wmk2TmVrZXBvODdXK0tyUGg4YTNadWNxRFh3SlVLVURrbVpDOVo3?=
 =?utf-8?B?WWVaNm9FYkYzRTN2S1J0aDhWSklQbUlYeHNXSjJNdWlvbjZRNFROcHpWT0Er?=
 =?utf-8?B?N2tpQlFRblVaQ3VveERxWjBYWGJJalA2VEtOZFdUN3loS2Z3aWp4WGhFUUt2?=
 =?utf-8?B?SjhPUWlvelJVOWVFdWRZYzBLVFJydEM5ZWtXN21mS2ROSkMybHFaSlJhVk9E?=
 =?utf-8?B?N3NJNlplYlg3TXVrVnBPVzlBR1d0Smk0ZFN3R2VBekxNTEVyanBhcXZKMlVR?=
 =?utf-8?B?SUQ1VnNqZktoRUowWGhSNmY5c3dtMy82dGdXeVc5dzhUcyt3dEZReVgrRUVF?=
 =?utf-8?B?dmFLUjFnZU1PL2EyTTJpY1dBNS9oL1dpQXZLL2FabFMzVzg5SjRNYm1iVmNY?=
 =?utf-8?B?SnRlWUpiS2h4dmVTeW9xbkgyWjBhbHB0WlFkVERIYk9mcUVlUHdhU2lhQlVO?=
 =?utf-8?B?U2NGSFRQZmNSbkF6WGVxMk45QzBpZGI0dTk4K2tiYkVKL3ByL05BNThraHY1?=
 =?utf-8?B?MlRWS1BKa2VxR1NSL3lNOHNkSUdtZ3AxbEZrc1E4TklvYXQxbkUyVWgxQXZP?=
 =?utf-8?B?aEx3TERnV3pOMUxteHBaTWVtOGdrbUhBVnRGekNFYlREV0l2dURlRm5CZWlU?=
 =?utf-8?B?azUrU1FPcGZ0QW5mMFZsN01KTW5pVTh5RjM3N0lLQ0pnRHlMd0ZyNFlKOHRC?=
 =?utf-8?B?eFVSbzNnNmxqQkpRMzE0REl3TEJxUVppcjZDNTl2Q216Mm1kTEJnNUFDQVBr?=
 =?utf-8?B?NkY2cDJ2Rk1BeXBlaU1TUHZnV3pnTGpYYzBwNjBoYzFScGdwNndRU1U1TkNY?=
 =?utf-8?B?THV6dDlTbHRiYTFSc0ozUTRNOHJHWHZpV3F4eGRwdldweUlKUjdlbytFVGh5?=
 =?utf-8?B?YVBXSVpyMmx3ZnpQcVhaY0czMVlNMmI4cTBhejZMWEQ1WDRGTU4rZU5HTmxS?=
 =?utf-8?B?Mm5wV09ZaDhGNmpmcDlhNExxSUpYcUxqZWRITEhNam95dk1UU1VEMnhiM01o?=
 =?utf-8?B?eXZBb1JtMnFJb2NMbXZXVjhBWk1iWEIrMkxEOEtEbjJlbStZR0JIV2tjd1lp?=
 =?utf-8?B?Y3lmUDQ1YUEyTHJwaWdmUjZHYjRQc1c3eUVGK1NUL3c3U2JQN2JYZWpaaEVv?=
 =?utf-8?B?ZjNsdndJVjlRRWkyMklPN2hrbmZKM1FpdU5hL0ZGNWVwQ0FvUGY0TnhnT1g1?=
 =?utf-8?B?dUJ6QSs0RE53a2lULzJESSs1aytnUm9ScCt5QnpwdGNNbDFUdmVraWdLdVlw?=
 =?utf-8?B?U0piSEJJVWV5T3BxaVpidnpvd1ZxWHVEQkVWcVYrU0Z0UEQwK25qU0Q2cmtq?=
 =?utf-8?B?elkrZ2RBNzZiQkVybVhFNktVc3VFSWYvNTF1UDlNeThyTzloS0htNHJ0Tm95?=
 =?utf-8?B?WUF1eEloUEh4azNrcXJaaU5GcXJ0dEhBSXByWG92dW5LSFdrMDRHZzUyeGVN?=
 =?utf-8?B?YXBuaGtXMUJ6YkliTXBhTDhxSXJUNEhTMHdneTQ5Y3ZIZDhXZHovOVNqNDVT?=
 =?utf-8?B?anNLeGV4R1VaUlR3aTRvZDhaRU5BZjZGbEF1QUs3ZytCd2JrVkhjbWxrcDZl?=
 =?utf-8?B?cGZCMkh2VnFaVDQ2OENXNG5MbnZaZlF6QmhKWjJ3dlFjUEQwMUwyNzBCdVdH?=
 =?utf-8?B?b0ZBd3BOV1JLMCtiSFVYOEUvSzVBait5SzRxbTRGZGZNZ3F2a3V3cFlVR2xz?=
 =?utf-8?B?alZUSFlvbFpyUlR1QnkvaGpSMmo4dUJyckpOLzNuaGEwaEZKZ2pJVXhTN1Zs?=
 =?utf-8?B?ejZqUHFHS0cyd1ErZzBCRzZtVUpSOWp5a3o2cWtlc1djWU5MdGxwWGpvOXpp?=
 =?utf-8?B?a2ovdkdGeGZ4SWo2UXIxMXVVTE14ZEVnRnYyWHMyUWk2dGppWDdwdjJJSUJ0?=
 =?utf-8?B?SWRyRTRtNGc2bDYwMXZVd1FLUHB5NXlBSmR6Z1loNVUzYmxsTjJyRlkvdXJX?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ict7bO3Vzx0r7d+WXAks2e3y7tuQe4gQirPLuUTK1egx7QBbfRlQmWGblFlh6wGY9R9r45X+kQcaSsICj0v85p2DhIHXr0GAHwtSJf/GkPPKFm4iEb8XnSP5eW2w+kNZ/vq52eH2zRJDLrDKBo3bzFwQ0L6NLopsHzlC6uA1iasNWouZdoYwBlavqEhl+0Ky9UlW5FQm9j+ferg5EVDCakDA7KeWZCeF3iLiCVO/1kBF5S88O5MKJqyUSJQwCbGrJP9hwhdmGTVWIE8KaMa8bRETvcQBM7eVaVdBxRSKFUPsJlwtM4JFac0TylBQroZoR1lHlqjD8eHewl/tkMshyFrRHN4W5QK8xr0xZTr5EVKtQBu5Ohi5o3SCxDcXuAPcqtl29/tNe77hmVebJwve+UBjE0N1hamXfX6ey5/r8ZGMHnkM5+IEo0c+8DwKSI54g/Y2JbhuVS7MJMZ26AwyE1zpVa78eCUI+YrCGzjQi3q5uOBor6p/6wndcp2JO3+kRTMdL3ORnM3GE5p/jPfSraWkiRoGvjYRbqCEYUGqXw2L7+iEBkTgNh++ReuwmK1gwoSbLX6wjsMptGMVv7i+XuMnUiNxGR7UpUwAQzNqdJI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51e55f5e-2d58-4710-e9bd-08ddb341ddd1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 17:09:23.5683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w0N/AOpdtXUv5/xKVH7AHc5fnog0OAZbkA6ns5rjb/TS+/Y+iaiKXSv9kISOmxLlz0TV40TwmQRyD32mTErknbD8esrgEdXER259fCRzxXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7528
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506240143
X-Proofpoint-GUID: sX3KTkPmCyWSgWvyTZJe5z6tXFID60qX
X-Proofpoint-ORIG-GUID: sX3KTkPmCyWSgWvyTZJe5z6tXFID60qX
X-Authority-Analysis: v=2.4 cv=cpebk04i c=1 sm=1 tr=0 ts=685adbc8 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=G0oFdk7xhxc1ACI7OrwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE0MiBTYWx0ZWRfX2wsOfFuj4AJR Pmqd3zA19sudGeVH9hGL4gdkX0oveWX6PNCIp3AzlzkIzmXsV/y5shoCRtUAcFbt6zcHqs0jpEC niCuu+1/eOD/y6ryhbEba0u2xRe2D/7eCy3BCZDS8Pb6BJ5hV4lpW4Jfr3CDnNmGcCPWSKEj9Is
 DCxgW86ci5AmEdXJ1yyWygOu4z4/Ju2Tobotun8ITMbAMJDbgYTjzMxFQN8VblM7rb1ddMh8OJe 3UimogAMD3e8KYBlipPVxuVU5pU/uKtJui9gD9442Fg4NlRVtBDVwzdrwF1xB8kKNmCjTl1v+KX vyrYG8TxwJ0VVZJRxV0y/N/ZFgYXhHs6VqO+z+NCF2nwyQjr3Fmab54ED8AJ50bZZTH+Wb2Nsj/
 kIerSMffmhTLV3ZJ6PUjKX8A3NcA6IyLXe+AsCmImh4bd7g0a80iaeEe4/u2u2VR74esBnOt



On 6/24/2025 9:29 PM, Conor Dooley wrote:
> On Sun, Jun 22, 2025 at 11:03:49AM -0700, Alok Tiwari wrote:
>> The error message in mpfs_clk_register_mssplls() incorrectly
>> printed a constant CLK_MSSPLL_INTERNAL instead of the actual
>> PLL ID that failed to register.
> Huh, that's weird. Did you actually encounter this happening, or is this
> some sort of patch based on the output from a tool?
> I ask because I don't see how this could ever actually report a
> constant, when the array it loops over only has a single element.
> Feels like we should just do something like the following (if we do
> anything at all)
> 
> Cheers,
> Conor.
> 
> diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
> index c22632a7439c5..ed6d5e6ff98ec 100644
> --- a/drivers/clk/microchip/clk-mpfs.c
> +++ b/drivers/clk/microchip/clk-mpfs.c
> @@ -148,22 +148,18 @@ static struct mpfs_msspll_hw_clock mpfs_msspll_clks[] = {
>   };
>   
>   static int mpfs_clk_register_mssplls(struct device *dev, struct mpfs_msspll_hw_clock *msspll_hws,
> -				     unsigned int num_clks, struct mpfs_clock_data *data)
> +				     struct mpfs_clock_data *data)
>   {
> -	unsigned int i;
> +	struct mpfs_msspll_hw_clock *msspll_hw = &msspll_hws[0];
>   	int ret;
>   
> -	for (i = 0; i < num_clks; i++) {
> -		struct mpfs_msspll_hw_clock *msspll_hw = &msspll_hws[i];
> +	msspll_hw->base = data->msspll_base;
> +	ret = devm_clk_hw_register(dev, &msspll_hw->hw);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register msspll id: %d\n",
> +				     CLK_MSSPLL_INTERNAL);
>   
> -		msspll_hw->base = data->msspll_base;
> -		ret = devm_clk_hw_register(dev, &msspll_hw->hw);
> -		if (ret)
> -			return dev_err_probe(dev, ret, "failed to register msspll id: %d\n",
> -					     CLK_MSSPLL_INTERNAL);
> -
> -		data->hw_data.hws[msspll_hw->id] = &msspll_hw->hw;
> -	}
> +	data->hw_data.hws[msspll_hw->id] = &msspll_hw->hw;
>   
>   	return 0;
>   }
> @@ -386,8 +382,7 @@ static int mpfs_clk_probe(struct platform_device *pdev)
>   	clk_data->dev = dev;
>   	dev_set_drvdata(dev, clk_data);
>   
> -	ret = mpfs_clk_register_mssplls(dev, mpfs_msspll_clks, ARRAY_SIZE(mpfs_msspll_clks),
> -					clk_data);
> +	ret = mpfs_clk_register_mssplls(dev, mpfs_msspll_clks, clk_data);
>   	if (ret)
>   		return ret;


Thanks Conor. This patch based on static tool.

You are right, there is only a single MSSPLL internal clock, so the loop 
isn't strictly necessary.
We could either remove the loop entirely (as you suggested),
or alternatively, just tweak the error message to something like:
"failed to register MSSPLL internal id: %d\n"

This would help distinguish it from the error messages used for the 
MSSPLL output and cfg clocks.


I also noticed that similar generic messages are used elsewhere, like:
"failed to register clock id: %d\n" in mpfs_clk_register_cfgs()
"failed to register clock id: %d\n" in mpfs_clk_register_periphs()

Would it make sense to update those as well for clarity, or do you think 
it's better to keep the patch minimal and leave them as is?


Thanks,
Alok
