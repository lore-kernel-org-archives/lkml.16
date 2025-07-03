Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E8229992A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 19:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751571132; cv=fail; b=ofFNhYB8QK365TT6/CHwtijyawxGRcsDVTTQaXbX2PlC8lxT7YYvoZvlYfGi/SjawKDIKBr4DWmD7XZwziIfBEZlTrPJsFZHwKClKaJbBueLU37mLQcIGXeUm3cZQ2IJgNQu5j0tyj+G3gUuMwFbdTC7SruNLYAL8OHhOUxoAjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751571132; c=relaxed/simple;
	bh=pBf4/d35zwEtT7HMfH3LUI7QgwVIl164rLqwFVjUiDw=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=p9PKrcpzqixvPxlOofbF58cElf6kxfhEgUSfAQ1OFiGBKqenWl02MN1OqX9IZ0SZG/tJEH+2DbbsHTlH/7gX4CnqRyRYQCETevgE5YZt+uH0TEmQcxB5tesVn4NM5mPiq/DKD3Qs7T3CmmDAxmMyGdLILXGlTaRrvIu9pE6JNpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XXdMTF6K; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Dz3lTEhL; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XXdMTF6K";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Dz3lTEhL"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563HZ5Hv027874;
	Thu, 3 Jul 2025 19:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=2uJ3ujdoL2KJgchM
	mhJh3YUJ8dzDRY3Cqs+Uw86oeRQ=; b=XXdMTF6KU1Y/cHvV5bILnejocTmBjHvt
	ePdm+wM+E5ZWrvErqkIF6EoH1hA0/I+IUmrl+tC7stU2GvoWmTf9hjKrC85EC8E/
	qV0iBwSy1VnHV/O40c1oVm56aDelLfA2oI+ujRdc1HRNpUTnOAz107ZSa6DGWH6S
	lqN6VoxCn+LmWlecScA0aefDK6QLHFjeqa3DSVPlWCU4ZlBkZRHBJ3zgCEMI///g
	QhaE0HRLpjIUn5gbOtZCogB1GFH2w5Fz6wDgxs7aytM9TYyKE/bBb6mrbEmEMoA1
	VwKO+0iHJDUN+Etc9x31eVk8gO9kyBhUpAdKW1XX3UHYKE9FsAqQDQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j8xx9nx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 19:32:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 563JEWXS032568;
	Thu, 3 Jul 2025 19:32:04 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6umam6w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 19:32:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zl6/cbYdLg3TSLquHKSWAHv+K33XRwfOxWTOuFyayS+9ZzxKxgnhFgM8OAW/Xi/iIbb9LktVxC96sdTmInAjwoNAi0zR8iJskU06fd/Rg2hdrwE+BUTlIojB75oB4M1zV7DC0SJA5IL7LRKljoSWIkA+25IZfZYXFLUHALRbpeHZ4XJIji09Jf4Klm9rXIwBDOvGqDXNKwS/36pNKQ8ugeCA7NGL27Y/A0RoN4J7gNJqFqEHOqMz2mAA98VT/SjcQ5rvuBZTwT6ulMWOS2lO5Mk9MNv7lHbY3BkV/VD+aaoIon0GJdqjNcPc26493eoLVeH5kTIPKrlupqqnkio2MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2uJ3ujdoL2KJgchMmhJh3YUJ8dzDRY3Cqs+Uw86oeRQ=;
 b=GAJCE4H6TKHMNYsW7rwgX7b+YN6nh1jeEiaQdRqTtoKV8/mSICPVqIv+DRYvSuUztkP3B+LmK8L3DS0j9nfH2xYiiCVXZ0BjJRjbeLmi2dC9CvIBRzluPK7zDe43pqTXsF9XXEwNvEwLR8BEg7VIt4eanU2Aq/zNfw5draMTbmYFPLfmPsERCm3vxzrV4waAnVYFoaLgol0xLcNCwX6QVuOiEZMjzlfq+0V/BmpuYLxwDcoPtMMfj/KmjLrwnZmfjJPLJJBUMd+S6gCswoXGrsMyDK0QICQ77dSV7Ts7xb75xZD1OBsCjo2WoJkQoRw8k+MQEfu3W3hAVc341b8nrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2uJ3ujdoL2KJgchMmhJh3YUJ8dzDRY3Cqs+Uw86oeRQ=;
 b=Dz3lTEhL8gkDcCxkL9c0E3/TT8OGCQ+fMG4Syd2YO3pOvZFpbTUAzVRr+k/Gb9wMCjXajnG2Q3khvwWvwEDSCGRTYksvDxSzMlYfIFeOiDfaRHuIMAfsgtJfEiNgbaq2stLVqQubZLDjCr6e9onqikWgIdURaAAlvufjWGfvR3w=
Received: from CH3PR10MB7959.namprd10.prod.outlook.com (2603:10b6:610:1c1::12)
 by DS7PR10MB5168.namprd10.prod.outlook.com (2603:10b6:5:3a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 19:32:00 +0000
Received: from CH3PR10MB7959.namprd10.prod.outlook.com
 ([fe80::2c43:cb5d:a02c:dbc2]) by CH3PR10MB7959.namprd10.prod.outlook.com
 ([fe80::2c43:cb5d:a02c:dbc2%6]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 19:31:59 +0000
Message-ID: <bf397c89-bd76-4559-908e-cc921e554b71@oracle.com>
Date: Thu, 3 Jul 2025 12:31:57 -0700
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: tglx@linutronix.de, linux-kernel@vger.kernel.org
From: Himanshu Madhani <himanshu.madhani@oracle.com>
Organization: Oracle America Inc
Subject: System hang with latest kernel v6.16.0-rc1 (rc2 & rc3)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P221CA0030.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::35) To CH3PR10MB7959.namprd10.prod.outlook.com
 (2603:10b6:610:1c1::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7959:EE_|DS7PR10MB5168:EE_
X-MS-Office365-Filtering-Correlation-Id: e1aa837d-839e-4651-a43f-08ddba684743
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dUFDR2kvNnhKOTdyZkhjV0xDSWRJdWZ3cjVRLzhwQkRnWjUyWEJmblZMeU9l?=
 =?utf-8?B?YTBLZEpUVVBwSlp3WmwxNk1xbTFEbVhFaHlFNUVpbXpHMWJmUHMzQ0Fkdldo?=
 =?utf-8?B?N0Y3OFhVY2RQdGhVdDcvdWNYNmtaeiszUVBHVGpjUzJJM2o1WUdGSkV6Ympl?=
 =?utf-8?B?MXZhNGpoRWdBdHdtNWxmYTF2N1phR0NGZk9FUVZ3aEpkaVYrZkpCVFQ0Wkhv?=
 =?utf-8?B?MDlETklzd3IwWHNXTHRhRkljTk52YkdYVVNsTFhmVjFOUnNPd25NNjFGaURs?=
 =?utf-8?B?YzRjZGdiMnJXUjlMdlhkNWIrU21vR0w3ZnpSNWRFdWUyYTE1am1MQlRaeSt1?=
 =?utf-8?B?Y1FUTzZESkxlUGVVd3ZCLzNTd29TVm15V1pnd1JnckRNQlJwRDZ6blBiN1dD?=
 =?utf-8?B?UEI1UVhXQncyYjdkMVhreGtBMXY3R25jTTVsUG04V3ExWFRwVGpMUDArUWtY?=
 =?utf-8?B?Tlo1WW5EWkRvc1BVWGN4eUNXbnpwSjB1TWEwWThmUjJhK1k3NzZ2dlRsclk4?=
 =?utf-8?B?WkZ0QkFCNkcxYzRQQnNWcmtxN0xkTUt3NnFHT0NlK3Z1Q0ErRmo1azJ5bDg0?=
 =?utf-8?B?WjE1ZUk1SEt3ZURLSWtlKzU3ajd5eURhSWY5Qm90dFBIZHhHc05xZDg1WHNa?=
 =?utf-8?B?Q3lEakVjQ0MxWUdNd0RGOG9IeS9ub0RCanRWcUN3UzNhNkhjd0JlOC9rM0NX?=
 =?utf-8?B?SVU3MzB4ZGVsQWxIcnBpZXYyOFl6UTEzRUZBVWMxRG1LcXAwY0tzVGtNVm1W?=
 =?utf-8?B?Y3cyVTVBeWhkWDVwTE9MZHBTbEtqbTVaVXZBVTJ2cjBIQVoyc2VCbU9ERzJU?=
 =?utf-8?B?em1YdzBnSnJnVmsyVUR3cFBmelFMaS9LR0UxMVV3ajlnQ1JRWTl2cXNmK29j?=
 =?utf-8?B?Ry9YV2NhMVFFclBkT21KaU43VHVDSWxENm5JeExxMmFqdm5qa0NyV2dvTHFT?=
 =?utf-8?B?WWxYYkxzanRxOHppQ1ZtTWdzMlEwSVBLT0Z2R1BsYXNhdjVVVUxRUWJPaWxB?=
 =?utf-8?B?V0FWZjh6dkpnblVheWd1S3Q5aUdoWDI0WUlwQnZ3ZVhiMk9Ca2RSenA3RnlL?=
 =?utf-8?B?OHdYQkhvKy9XTnFtQnl2cTBRZXJDcS9VcUlpbkZ2K3hmWXMyeVNrV2gyMnB4?=
 =?utf-8?B?amVSTWY1YnhRekZTcDBMM2RMTTBDZ0JGcnZoMTFzUVNUeThkbmFvSytQenlN?=
 =?utf-8?B?VXN3KzEvU2ZFU0ZIN1NsYUo4REVocDdjS05TQW1haSttY0R1L0RRVFVxL0lP?=
 =?utf-8?B?a2orT1dmNFp6MDJSUC9ES3hjelk1TWVYUDB2bjhiSm5naytVMWQ0RFhqZ0RF?=
 =?utf-8?B?cGFydURiVjBETVlZbVdnZnNnNC9vc3ZBQVVTcW5yM0N3NWUrb1I3RVR5Q2RX?=
 =?utf-8?B?c0k1NGxuSGhPaUZNY0tsOEhZS1pVR3VNZFVONmZqVFpNY2U4bGk4TUFGT2JV?=
 =?utf-8?B?b2xXRHZLVXdxeUREZ3dUdDd4WmhMaE40RUtUdzRqRjVpaHNadFFIS1ErQVVT?=
 =?utf-8?B?ZW03N0Y1eE1MU1NNYmhBN0JEWHBWMEpYN3BKcGsvRTlycDBEUzA2VWt3K0Vw?=
 =?utf-8?B?b3lla0c0ZXFaSFc0ckNPQUFZVis5VGxTLzM4Z3ZXeE5POXZ2bXlLUEdUVDVp?=
 =?utf-8?B?Y1JXUktwdENXVDdjTUxmQUtyWjcyUnRQSFVBVkZJelM3VjJLUmtoQStFYnlN?=
 =?utf-8?B?Q2JERkNWVzBESDRvL1l5dkZaTUlKMVhoZjkvaklqRkVBbWRkTUpwTnBhYjY2?=
 =?utf-8?B?QUVSK1NoUzRuQW5PK3lPbUU4VDN6ekJvTU4wcFBCR1pCWkIzYnUzdndnQmFy?=
 =?utf-8?B?YmVMbEw3dHR2cC9ORTV4N0czdm5LNExlNWJaZ0pHMmQ1eC8vTjc4eHlPZWJG?=
 =?utf-8?B?Y1A1SnVmVS9sTXRyZ1M0WmJQczdMOGVDekRkdTZJNWpMSThBUWZLa3FlQTJp?=
 =?utf-8?Q?njAHXHzoU6E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7959.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGdKeWxDNnRJVkhXc2dmcVJlRUJwajZ4TnJqcXJWcHdaSU5TYi9waFVhMmxH?=
 =?utf-8?B?V0YzZTNKejdEdTkzdGVBczdwSHFlYktXVHI5SVdFVjY2bzFGYyt4SHczQXdi?=
 =?utf-8?B?am9DM3drVW8xY0x3ZXYwOWZ6eGx2MTdUaXh6VkQyZSszaElCc0hZbDNkc0lE?=
 =?utf-8?B?VjZTV05tK2Z2WlVBUWNlOGFTWXVyNlM4eWRMSlpZbkhYZE8yT2ZVMDEyVWRN?=
 =?utf-8?B?S0JEK1BOUUVXb0RkejhLSkdyU3JWbUNCVFZVNTZldTViUXVwOVVnNGU0ZHZZ?=
 =?utf-8?B?UTlZMnFrY2F1Z3M3eVU1bDZSZjRZTUJTREF5clVra01OMWZIN1BvS1IvcUpm?=
 =?utf-8?B?M1lEK2FDOVNtU2RWS1hEK0QwcWZpb0d5SXNoS0FPTEtmR1VHcWliam5ZcExa?=
 =?utf-8?B?cDRkWDZyU0ZubW9OWXV6MjJzTTUxTURCT05ibGlGUTV6cmxIanJkTDFQNVg2?=
 =?utf-8?B?RTg5YVFsM0h4dUxXK1pMZ1hjZEVCN1VVMXRYOVd2eVlrelpHYUVIdVJDRFNH?=
 =?utf-8?B?aFI1K0hCaW1yNnRKRWZxTHJaVUhTbVVqMzZsUm1KeWZQRDRzVHJtc0NOR1I4?=
 =?utf-8?B?enZra2VkTUwzdDBxVkxUVFlLR1YwM2d1K0JUSzNIc2tnUzhmaTl0Zm94YzRQ?=
 =?utf-8?B?ZVhPUG9nLzdweHhCb0RibVY4c0FZK0lGYmxCQmF1aWFNN2N6SHVKR1BlLy84?=
 =?utf-8?B?R0o2NDlFZS9STzdtdmhralR2Nks0eHdGalBpZ2s0Q20xL1lCd0IxdWIzczVk?=
 =?utf-8?B?Vys4OWpXUnFVWDZGQTZYaTNnMGNtbmhJdEtIak15OFhzTmhzeCtqVENoc3FE?=
 =?utf-8?B?Z1ZEbk5yM01HeXZMZXNLMEUzK1JSdGJReDRlS1Q0T0FTYXZFYnZqU2RBZmdr?=
 =?utf-8?B?YWhteTM3dEp5dk9CVktrbThMVnNjanZvVGJqSkM2SnBRRHdkRHpEV2w2RHdv?=
 =?utf-8?B?eFNKVEVvRHNMcUpUUkt5V05qbDFEb0ZTUUNIQVNhdUxLdGlaSVVGTStYWXlU?=
 =?utf-8?B?NHk4TGxzbG1vZzVqcEJLYWxka0MwS1FiZmFzcVVreVNUTEJHVlVXZTlRRHMy?=
 =?utf-8?B?MmtBUkZLeXhpdHBYRkFQRnRlLys0YytRL1ZWQ3h5S0VHVHY5YisvOUtRVGgw?=
 =?utf-8?B?TkVjMU80UzF1dmdJQms2N1RXcWt4TzJtelhhb3FzZUptaHlLQURBQjdWK2Y0?=
 =?utf-8?B?WVFHYm41M05lcmNEdTkyVmRTQlp5WTlyZ3QvNlpFL1RqVTF2S1VOWHNvbVlD?=
 =?utf-8?B?WG1uMmRHbHBFZzN6cktxY0FzOGJPOHVzUThZbGJaMnMwbU1ROVU5QWNzd1BO?=
 =?utf-8?B?empRL3NxSEhjd1BrVFNXQ0ltdDdHZ2Z2K1M1ckZhOTRKZysrMEdlbjViLzNF?=
 =?utf-8?B?RmY5WmlYZW1mVnlCYi9jWXVuTXVFSXhhVTB2WW0wQlhFU3ZMRk5Yak4zRkpO?=
 =?utf-8?B?Q1lHYTRtTXVXZlRqN0g0c05iSkhNVVZVSXdyWDJveUlPb3RFQXRDMVY0NHR2?=
 =?utf-8?B?anpPQ0dxTER4OW02c3pObndzU3BneG5KTmIzdTdqbkEydUpJYUJUblJZN0FB?=
 =?utf-8?B?QS8zb2o4QWhBdG1PMXJCYkNJUHpQNXdudkpsUDVHaTRiS3l6YUUrUFFyN1JC?=
 =?utf-8?B?MFYwbTkzY3NmMW9tdFR3YXk3L2VCZHRNK2JLeklJWkZyU29JZVVzSVc0dm9j?=
 =?utf-8?B?d2RXK0Q1bVA4NHBpcFFzaUNzQ1Jhb2k0Q3liSnJzOHNOeTIzcEV5cjh4M25Y?=
 =?utf-8?B?Q2xoNDlZSi9ScnBWb3FFWmpNa3V2ZGRoTVBSNXYyK2tqVzY2RW1VQS9VNXlz?=
 =?utf-8?B?UDZ0WmEvMTh3bnpDRTBEN1hPVnRNc2s1UlpMcmo2Si8wOGU5NzRrNnZ6RCs4?=
 =?utf-8?B?Q3E3TlBzNlk0cWJCejI3ZDVqbVdGLzJZL0lxL09OajVHaVd4NlJRbTNEeS9X?=
 =?utf-8?B?SCtuVUkxRjgwbStpU3h6YzNRcllTQ2ZzdWdybGRNYUJOTHl2K3paZDhYM0Nw?=
 =?utf-8?B?MlpwamExVUE2Q1RSUy9tS09WSmliRWZZeWpTMXRrb29ObjI2R2k5S1BRZlVk?=
 =?utf-8?B?dFBSaHBoVGtCMGlNSmZJQytGNU9EYWcwY0d6ZWUxWEdSenRJaE5rWjFiNFdG?=
 =?utf-8?B?d1ZlWldhNzU2WmdYV0p2ZEpWSUlJQ0xmV1NFdmFHdTd3bjh6OXpPYzJncHFD?=
 =?utf-8?B?RUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	S5ocXt1aSiKx2ZbxpuV+57hOJ+ZUx1sXUEGOxHyJvARz+rS1Bz6kV5thphAUCUwO8theEWuoKgiIjEq+MhMg1EVU3mypCjf+5TBrKWlC0CdA/OOjMHXiJixx65GDUnFitEulGMwpiDioepGyaRV43151VakJzGhVVGhaQYg25HMQmWtjOxAsErwTBCWzGPibtI/k3dRIdJVIHS0AIVJNVx9AiiZu9oGJD+Xl1qaFKL00Uk/W2HHw3bUteaeu9HMzOHmHvtAH4oDIArPSDWUkkzksHkwZivs8j4PhCf694COHQf+B5Zsi03ASUogD34yuzrDUWX+Sc2+9hz2HZYUmypRwO7aNuAzEZIqa8OVwM4GkogGZ4cX/fQKFQ0tUHWu6oQU0eHZR0q7L3iZizhSw2zS0vsoikefGP0g5PlA2mj/5X5ksLHP2gnNpWw2CcVRYraBAKm9v/8+uIcUEYRKYcYF0uMz6Sv/v3Cpgw2sJIPv44t9CYeaCjwj/jd8hTTAhcUNsHriJljS4F5LulRB/6sMCsWEFwOgb156WsF9vO7av3BmCqFV0F6uNmD0cLjC8MWNhu6frTLA7eEL34gKYzgehXfRjdrG+hwB1Gl7rxhU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1aa837d-839e-4651-a43f-08ddba684743
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7959.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 19:31:59.5819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kcb72X+jrydZkjVQSINEBm0KpgSc1BKuthcEjouYol3fS2PQu5AxidvmFzYGDltCer5IW0Doz0/N5DtlLngarDF+Hm/8jAluAFHKUpogqYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5168
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507030162
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE2MiBTYWx0ZWRfXxk7VU6lrWyzZ l2pKKeSUj7h0xn1Ot7tI0V95zgK9Yi2SQ3qeFgz+569VA1rtROWniI5S0okrA1fsq9X2IIx8csP G+rO47MK6o5ds23/7JCU+hsYr4/afaio55vdrIg9+8UGQylbbxZOQDc4QBiRFWhBeOSxYeLtj+W
 /7P0G+xSeAdr96B8jtaNjIGN3vDPi/MufQ2Iv2A1G6SCxb4fddmgapVTwkubsFXwuApRba7Bxra 8fDAbY2j/ufTnE+lEIHdEVvlTVWvGqxTsPabqRdFZFtHkhRP8WbN+4wA9DOet89k7lXjufrpJRt JvZ1B8xa7iznS4CtAZyunp+SHeblH/iqKhGguPDo1V87+ZGbc3EDS7fvUNIJMCnwMpC4+j1CEX1
 8uwYSF/j2AEu2he5CMEVb6MdGVJdIXFVZfwyM26+kjjBJPmpZgY9B2jg9q4P92P0WZoG6XxT
X-Proofpoint-ORIG-GUID: WtG0Iuxc7P5m6oA_KSDM2Y4ZvAIGy72E
X-Proofpoint-GUID: WtG0Iuxc7P5m6oA_KSDM2Y4ZvAIGy72E
X-Authority-Analysis: v=2.4 cv=QfRmvtbv c=1 sm=1 tr=0 ts=6866dab5 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=Z4Rwk6OoAAAA:8 a=DBqSyeBtshblr0tJIuMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=HkZW87K1Qel5hWWM3VKY:22 cc=ntf awl=host:12057

Hi Folks,

We are seeing kernel hang while booting after new 6.16-rc1 kernel is 
installed.

Here’s stack track that shows up

[  297.656683] systemd-shutdown[1]: Rebooting with kexec.
[  513.790993] INFO: task kexec:19038 blocked for more than 122 seconds.
[  513.868087]       Not tainted 6.16.0-rc1.master.20250611.ol9.x86_64 #1
[  513.946210] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.
[  514.039923] task:kexec           state:D stack:0     pid:19038 
tgid:19038 ppid:1      task_flags:0x400100 flags:0x00004002
[  514.172122] Call Trace:
[  514.201356]  <TASK>
[  514.226438]  __schedule+0x2d1/0x730
[  514.268161]  schedule+0x27/0x80
[  514.305717]  schedule_preempt_disabled+0x15/0x30
[  514.360954]  __mutex_lock.constprop.0+0x4be/0x8a0
[  514.417232]  msi_domain_get_virq+0xcc/0x110
[  514.467279]  pci_msix_write_tph_tag+0x3c/0x100
[  514.520441]  pcie_tph_set_st_entry+0x125/0x1d0
[  514.573605]  bnxt_irq_affinity_release+0x35/0x50 [bnxt_en]
[  514.639258]  irq_set_affinity_notifier+0xdd/0x130
[  514.695534]  bnxt_free_irq+0x6e/0x110 [bnxt_en]
[  514.749746]  __bnxt_close_nic.isra.0+0x1eb/0x220 [bnxt_en]
[  514.815404]  bnxt_close+0x3a/0x100 [bnxt_en]
[  514.866498]  __dev_close_many+0xab/0x220
[  514.913423]  __dev_change_flags+0x102/0x240
[  514.963464]  netif_change_flags+0x26/0x70
[  515.011424]  dev_change_flags+0x40/0xc0
[  515.057304]  devinet_ioctl+0x3aa/0x7a0
[  515.102142]  inet_ioctl+0x1d3/0x1f0
[  515.143863]  sock_do_ioctl+0x7a/0x140
[  515.187667]  __x64_sys_ioctl+0x9b/0x100
[  515.233545]  ? syscall_trace_enter+0x10c/0x1d0
[  515.286704]  do_syscall_64+0x84/0x940
[  515.330502]  ? refill_obj_stock+0x143/0x240
[  515.380543]  ? __dentry_kill+0x12e/0x190
[  515.427459]  ? __memcg_slab_free_hook+0xf4/0x150
[  515.482698]  ? __x64_sys_close+0x3d/0x80
[  515.529616]  ? kmem_cache_free+0x3fe/0x460
[  515.578614]  ? syscall_exit_work+0x118/0x150
[  515.629695]  ? arch_exit_to_user_mode_prepare.isra.0+0x9/0xb0
[  515.698453]  ? do_syscall_64+0xba/0x940
[  515.744330]  ? mod_memcg_lruvec_state+0x1a2/0x1f0
[  515.800608]  ? __lruvec_stat_mod_folio+0x83/0xd0
[  515.855843]  ? __folio_mod_stat+0x26/0x80
[  515.903801]  ? set_ptes.isra.0+0x36/0x90
[  515.950723]  ? do_anonymous_page+0x103/0x4b0
[  516.001802]  ? __handle_mm_fault+0x394/0x6f0
[  516.052886]  ? count_memcg_events+0x15a/0x1a0
[  516.105008]  ? handle_mm_fault+0x24a/0x350
[  516.154003]  ? do_user_addr_fault+0x221/0x690
[  516.206122]  ? arch_exit_to_user_mode_prepare.isra.0+0x9/0xb0
[  516.274887]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  516.335330] RIP: 0033:0x7fc96e903bcb
[  516.378086] RSP: 002b:00007ffcc7f78518 EFLAGS: 00000202 ORIG_RAX: 
0000000000000010
[  516.468683] RAX: ffffffffffffffda RBX: 000055dc432d8f80 RCX: 
00007fc96e903bcb
[  516.554080] RDX: 00007ffcc7f78680 RSI: 0000000000008914 RDI: 
0000000000000003
[  516.639482] RBP: 0000000000000000 R08: 0000000000000007 R09: 
0000000000000007
[  516.724882] R10: 000000000000005e R11: 0000000000000202 R12: 
000055dc095468dd
[  516.810278] R13: 000055dc095468e4 R14: 00007ffcc7f78680 R15: 
000055dc432d9020
[  516.895676]  </TASK>
[  516.921808] INFO: task kexec:19038 is blocked on a mutex likely owned 
by task kexec:19038.
[  517.020728] task:kexec           state:D stack:0     pid:19038 
tgid:19038 ppid:1      task_flags:0x400100 flags:0x00004002


Git-bisect point to this merge commit

commit 6376c0770656f3bdf7f411faf068371b6932aeca
Merge: 5e8bbb2caa4e 29857e6f4e30
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue May 27 09:01:26 2025 -0700

    Merge tag 'timers-clocksource-2025-05-25' of 
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip

    Pull clocksource updates from Thomas Gleixner:
     "Updates for clocksource/clockevent drivers:

       - The final conversion of text formatted device tree binding to
         schemas

       - A new driver fot the System Timer Module on S32G NXP SoCs

       - A new driver fot the Econet HPT timer

       - The usual improvements and device tree binding updates"

    * tag 'timers-clocksource-2025-05-25' of 
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip: (31 commits)
      clocksource/drivers/renesas-ostm: Unconditionally enable reprobe 
support
      dt-bindings: timer: renesas,ostm: Document RZ/V2N (R9A09G056) support
      dt-bindings: timer: Convert marvell,armada-370-timer to DT schema
      dt-bindings: timer: Convert ti,keystone-timer to DT schema
      dt-bindings: timer: Convert st,spear-timer to DT schema
      dt-bindings: timer: Convert socionext,milbeaut-timer to DT schema
      dt-bindings: timer: Convert snps,arc-timer to DT schema
      dt-bindings: timer: Convert snps,archs-rtc to DT schema
      dt-bindings: timer: Convert snps,archs-gfrc to DT schema
      dt-bindings: timer: Convert lsi,zevio-timer to DT schema
      dt-bindings: timer: Convert jcore,pit to DT schema
      dt-bindings: timer: Convert img,pistachio-gptimer to DT schema
      dt-bindings: timer: Convert ezchip,nps400-timer to DT schema
      dt-bindings: timer: Convert cirrus,clps711x-timer to DT schema
      dt-bindings: timer: Convert altr,timer-1.0 to DT schema
      dt-bindings: timer: Add ESWIN EIC7700 CLINT
      clocksource/drivers: Add EcoNet Timer HPT driver
      dt-bindings: timer: Add EcoNet EN751221 "HPT" CPU Timer
      dt-bindings: timer: Convert arm,mps2-timer to DT schema
      dt-bindings: timer: Add Sophgo SG2044 ACLINT timer
      …

Following further in this commit, I only see this following series that 
had changes which may or may not be related to hang.

https://lore.kernel.org/all/20250429065337.117370076@linutronix.de/

I am not very familiar with this subsystem and was hoping if somebody 
can spot the offending commit and possibly provide fix for this hang.

Note that we tried with rc3 as well to see if there was fix applied in 
later RC and still see same issue.

[  525.390801] INFO: task systemd-shutdow:1 blocked for more than 122 
seconds.
[  525.474133]       Tainted: G S 
6.16.0-rc3.master.20250625.ol9.x86_64 #1
[  525.570969] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.
[  525.664681] task:systemd-shutdow state:D stack:0     pid:1     tgid:1 
     ppid:0      task_flags:0x400100 flags:0x00004002
[  525.796878] Call Trace:
[  525.826116]  <TASK>
[  525.851195]  __schedule+0x2d1/0x730
[  525.892917]  schedule+0x27/0x80
[  525.930478]  schedule_preempt_disabled+0x15/0x30
[  525.985718]  __mutex_lock.constprop.0+0x4be/0x8a0
[  526.041993]  msi_domain_get_virq+0xcc/0x110
[  526.092031]  pci_msix_write_tph_tag+0x3c/0x100
[  526.145186]  pcie_tph_set_st_entry+0x125/0x1d0
[  526.198346]  bnxt_irq_affinity_release+0x35/0x50 [bnxt_en]
[  526.264015]  irq_set_affinity_notifier+0xe0/0x130
[  526.320291]  bnxt_free_irq+0x6e/0x110 [bnxt_en]
[  526.374507]  __bnxt_close_nic.isra.0+0x1eb/0x220 [bnxt_en]
[  526.440175]  bnxt_close+0x3a/0x100 [bnxt_en]
[  526.491264]  __dev_close_many+0xae/0x220
[  526.538179]  dev_close_many+0xc2/0x1b0
[  526.583014]  netif_close+0x9d/0xd0
[  526.623693]  bnxt_shutdown+0xb1/0xe0 [bnxt_en]
[  526.676874]  pci_device_shutdown+0x35/0x70
[  526.725871]  device_shutdown+0x118/0x1a0
[  526.772788]  kernel_restart+0x3a/0x70
[  526.816588]  __do_sys_reboot+0x150/0x250
[  526.863504]  do_syscall_64+0x84/0x940
[  526.907300]  ? __put_user_8+0xd/0x20
[  526.950059]  ? rseq_ip_fixup+0x90/0x1e0
[  526.995937]  ? task_mm_cid_work+0x1ad/0x220
[  527.045971]  ? __rseq_handle_notify_resume+0x35/0x90
[  527.105367]  ? arch_exit_to_user_mode_prepare.isra.0+0x98/0xb0
[  527.175166]  ? do_syscall_64+0xba/0x940
[  527.221040]  ? do_filp_open+0xd7/0x1a0
[  527.265882]  ? alloc_fd+0xba/0x110
[  527.306556]  ? do_sys_openat2+0xa4/0xf0
[  527.352434]  ? __x64_sys_openat+0x54/0xb0
[  527.400389]  ? arch_exit_to_user_mode_prepare.isra.0+0x9/0xb0
[  527.469150]  ? do_syscall_64+0xba/0x940
[  527.515023]  ? do_user_addr_fault+0x221/0x690
[  527.567141]  ? clear_bhb_loop+0x30/0x80
[  527.613017]  ? clear_bhb_loop+0x30/0x80
[  527.658895]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  527.719332] RIP: 0033:0x7fc3ec504777
[  527.762091] RSP: 002b:00007ffecd62c4f8 EFLAGS: 00000202 ORIG_RAX: 
00000000000000a9
[  527.852685] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 
00007fc3ec504777
[  527.938085] RDX: 0000000001234567 RSI: 0000000028121969 RDI: 
00000000fee1dead
[  528.023485] RBP: 00007ffecd62c700 R08: 0000000000000000 R09: 
00007ffecd62b8e0
[  528.108878] R10: 0000000000000001 R11: 0000000000000202 R12: 
00007ffecd62c568
[  528.194273] R13: 00007ffecd62c548 R14: 00007ffecd62c568 R15: 
0000000000000000
[  528.279672]  </TASK>


-- 
Himanshu Madhani                                Oracle Linux Engineering

