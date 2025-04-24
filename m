Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142701B424A;
	Thu, 24 Apr 2025 06:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475081; cv=fail; b=tnxAeg9OQyfiFUtxVcUrMHnFUJDlJ6z9lPS1G4vXcc+gzJed5pn3sLXBgKoZrKxjqDzfyRG9iaVRMcIsqDKH0Zq5d9vNO7buSqhZMoUrVzyevcdTUsfXuJfiB0uAKsQqdWq9IN3IJ0xrJn2u2B4GIOm/iSG0j0QtTUJooozzyxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475081; c=relaxed/simple;
	bh=wWq+NZW9nYO/FfblCk2jJH6JaUphXPZZRO+Rt7MUAEk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=H5bVZjPLwnZ4M+YGMtyf3bdjpwrNSYy0OF+Iy4hjgHLpF47TQdGlsyrxPVaZ+iivXLG3vRj9dBPp07wEyrAdryU0HgNY/AypH9gJ39qvFEgpzuR9WHNtT4RY1NLCZINILYDq+jxmXmiR2n0FAvY2dyRBWLggp5mhNPesk00Z0lo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jAsTzpOY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gDWkouu+; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jAsTzpOY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gDWkouu+"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O5rVeh010332;
	Thu, 24 Apr 2025 06:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=78JsBIKFgE+ZWIbAs0blc8fkG9DOLbQ33uJmLO75QZE=; b=
	jAsTzpOYURQ/qypggLYzKcBcRfGCZLRX1tx1YftetkniTbEGXSXCpWmRuHwxklif
	aXUBJQnPeUNdAS7o8oS+vyFm2marCKA5/LtA8T1UR2EwZSAafCHpU5ByGk1CGMqB
	zKLwRT0JOVzKzNARG+htnb9cTm1jpmu2/w5besyx+1pAa725tAGuTa9NONcbUK4G
	eI2YWmxdAUJnKAhLPFucva/batEWPX5vWIETjEw6Wr7CY+1uCyU/q3qbkapaGfy8
	AuriPdqdxhVRZOVbE3ffWHkLc5K9Ncr1Wqvda5BEz56y6//9qoxGS3NkVsWsBlHZ
	F+clh35gKtypQJ9A0FbkpA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 467fhe8118-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 06:11:12 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53O5TFqt039312;
	Thu, 24 Apr 2025 06:11:11 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazlp17012033.outbound.protection.outlook.com [40.93.1.33])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 466jkgm8vx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 06:11:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PCkg6WZq9YmjoTichBTpqSwNsJIQPUvQNDQHyvXpT0AsvFjLe2m4wl0mzw/rQfj+cdII/QiTXG7+xbMPi7vk9GVh+bkXDwXMyaBMrwYa98jabq+mS9/0TwIqbNuZlVixKUmwEx5+CS8z3VaRkkWK+TZk3DuK3es9PO+HTgiIwb5TOb401Q6GI5rrLwk2z2H743XIVVw31kCRO6iq3sbWSeu4MwDnmqLtAsb2K4XWaOLsqOI9jUg0FpCk/BtEbiWiRfyuE8Pm/ODbQdpzcRmbvGqUuDe1oUXsYXF6ne1yLfju6JVKRkjOGGZ8x8cq4xocMpNu3xVzjzPKt1ZmDlfoZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78JsBIKFgE+ZWIbAs0blc8fkG9DOLbQ33uJmLO75QZE=;
 b=v8PWADDYiIU3dLrbT3thwwZIiUnBSWTRPegEwaLY3suPz+fExV0/bmH1lUpEEWMSSv3VwYqMS3GzRm0OHgwByErD4Z1rZ7MpxAlxFsUK741bzEHlgf0owbwuIAk5BwbpOSbI1RdXsoh7iUNUkLJYbKpmXNXOvCDfEvmLwtBSihm2yeElYwThLUlfWOsj0dnL0o+Ycxteb9S5AOTRKmGkG4Vp3lWje1q5YhT0vhgYtaZ+KL4ZxgZRKgd34n94mOgCzxJjlW58Mi9Eiq/U/U1IQgCP6b8h6pTe5NLysylBXO7IAHbW/PGtECsYCWMO5xMsheI1oiM/hvbZTm+zabc8ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78JsBIKFgE+ZWIbAs0blc8fkG9DOLbQ33uJmLO75QZE=;
 b=gDWkouu+fuXIFDeq0C+uPl6p+uWD/gPYHjFQ/H8GFdhfY865bN1AxnGUEO7jRHWdJQjZOy+QLUrbjV2DuPPQfxEZ3LRcXolyvbBsQ8o3GCsFqmzrd6u86nobCZ+PMk5lYMSHwdhTknZVq6Rx1MDLU+WicYvffZIdrzsZrBzXIK0=
Received: from DM4PR10MB6886.namprd10.prod.outlook.com (2603:10b6:8:102::10)
 by BN0PR10MB4983.namprd10.prod.outlook.com (2603:10b6:408:121::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 06:11:08 +0000
Received: from DM4PR10MB6886.namprd10.prod.outlook.com
 ([fe80::bdcc:98f5:ebd5:cd38]) by DM4PR10MB6886.namprd10.prod.outlook.com
 ([fe80::bdcc:98f5:ebd5:cd38%7]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 06:11:07 +0000
Message-ID: <1eb55d16-071a-4e86-9038-31c9bb3f23ed@oracle.com>
Date: Thu, 24 Apr 2025 11:41:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: CVE-2024-49995: tipc: guard against string buffer overrun
To: cve@kernel.org, linux-kernel@vger.kernel.org,
        linux-cve-announce@vger.kernel.org,
        Simon Horman
 <simon.horman@corigine.com>,
        Dan Carpenter <error27@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <2024102138-CVE-2024-49995-ec59@gregkh>
Content-Language: en-US
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
In-Reply-To: <2024102138-CVE-2024-49995-ec59@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0205.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::6) To DM4PR10MB6886.namprd10.prod.outlook.com
 (2603:10b6:8:102::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB6886:EE_|BN0PR10MB4983:EE_
X-MS-Office365-Filtering-Correlation-Id: 902dd247-d1b1-40b6-aa2a-08dd82f6cd31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QTh2WWc1MElaTDFwK2hHOUJHcWcvazBqcktaQlgraCt4Nm5GU1RvWGxIZHVj?=
 =?utf-8?B?VVhWNGJBbktmbFlDZlNTSlNCZUtWbTdnbjJTRW92NmRBb0Myd21kV1ZTczJ2?=
 =?utf-8?B?L05hRnJRTWRacmRwYi9wMENNYTJmVkdha2tMYVVIa0VTRGEyekdMUjdiVUV2?=
 =?utf-8?B?ZkpENE1YSS9aM3YzMlpJQ3gwZENMTWY0d3FaZkR0QlZwMUZ0QUxjSDJQN3Vt?=
 =?utf-8?B?Sms1aGRoOFo4Z2cxMEo5NHgwbGk4ZjBDTmhzcGduRkhRc0F4bERLa0FmQjZI?=
 =?utf-8?B?NU1JaFJ5dHdwNGUzV2tBZk9VTEtlQXJMSWhPR3NIa0ZZdFN3ZXRaU01oZHdp?=
 =?utf-8?B?OTRJN3NZblg1U0pNODVab2R0ZjZaTTNocWx2WjJUb2YxdENwMSt0VDVQK2Ri?=
 =?utf-8?B?MTc4M244NFBEMjZpcDhFUUZ0RzF0azUxejN2aGM4VTRUMkVKcXVSdmdZanEz?=
 =?utf-8?B?c0Nzbm5tb0J0SnlPbm1NZ1RGL0VQQ2NsODlpZU53YWNNZmVER01UeHExRGlI?=
 =?utf-8?B?ZlMvSG1QVlJWMkl3cEd5MFRmMHJ5R1NzeTNDeVRLVEdwTkptMTgzTjNqWk0v?=
 =?utf-8?B?QzJxa0JmV25JM3BSTVFpWDg5cDNwMmpab3FOZGdvOExkenU3VWZRZVV0Zlc2?=
 =?utf-8?B?dmFwdENKWVloNTdGWVRFZXdFZHU1VVltdWg3ak53ditDR3puUmdVa0lWb0Jq?=
 =?utf-8?B?aXAyd3dWZU1NL1pOZWFlU2VzU2xSYkFUS3MxZzRCQk1ENlpZTUlqMWM3NFlr?=
 =?utf-8?B?NnlpdkczRDVnYnNiRXU4UEZBbUlkMHc2OHhreTJFNG1mYStRTkYwSktTZE05?=
 =?utf-8?B?SFk2VmVTUXdBdXBKa0Jtb3AxNXp3WWkyVmpZemtCVEtXaXFva2krbkFKVWNS?=
 =?utf-8?B?NXpqT2laUysrS1hKSHMyN0Vqbm5Zd2NiZTF4WG92UStyQ1pwZy8zd29jNUht?=
 =?utf-8?B?U3I4WDA5dnFvTGM1REZ6NkhvSDdubmlQUDNJZ3o0anVVZk0rS0tpZml1MXhQ?=
 =?utf-8?B?NWlyWU5qNkZZV0dSUFl1RzF5SkpESlB4NXdoeUJHQWJwRnlmUyt3QnJwRHpV?=
 =?utf-8?B?UjdiVmdGYitwTERiSklydFhKVkhZMkNtNzlOKzZoNVpzS3dBVWx0YzVBWm5Q?=
 =?utf-8?B?WVlLUGdJSnBKM3ZzdlFmY0RSc2lnYUlySkVjdnMrcjdjV0d4dE0zMnFQbUdL?=
 =?utf-8?B?amlTc3hZYWtyaXBsWHZja0hFWVpRN0lnUWVvcUpFeFM4a1hKYUZJWVNMeXRl?=
 =?utf-8?B?azFpT2s1bWErdFlaQU80Q2Vid1JMbnJhN0hZMFNhMmVUU1p5Y2JSOE5Sd3E1?=
 =?utf-8?B?dVhiNVdNMEdiTnBVQk1YdDdEY3NKeVUyc0w5eEVGdklCRGJQdFBibm1EWEs2?=
 =?utf-8?B?QmxOR0FocTlQZE5pYUorQ0lYbUhqKzZ4UXhudS9POTVmU3lHNmkzaEhITHFO?=
 =?utf-8?B?VDBHYmVNaG5ITC9aOUhueUdYajdkRU5neU9HR29zcFFNMUtaRWk2Z0R1emc5?=
 =?utf-8?B?NS9oY29nNmhJNTA3VGtoOVRrdDQ1ZmZ0a2NrNVdqcldNakRvenVKa3JiUkpk?=
 =?utf-8?B?T29IUVBBZnZXVTdGNVNIMFNzZ1VaVFFwZ1ZIeU1uaDhDUmFFWGc0REU5bEJ6?=
 =?utf-8?B?NWowM2RKUnQ4MlBVOC9taW5KOTVQUm9GeURobytiMU1EQ2loMWRQUExrc1Nv?=
 =?utf-8?B?WVpiSStXem1XTTNMa0UvaGJjZ1hndTZNR2pQWUlqSlBFQlRrYlpjaTZjSDJ4?=
 =?utf-8?B?ekF6eWhQcjVmeUxscHdwb3RGbWFlbmd1cDdBeWgyZHBNdXRCWXptVzF4UE9v?=
 =?utf-8?B?K2pNNDh5S0NLTlc0S204ZFZ0S0d1VkdaODIyVkZzTXIwTm1BdGJqMTNzM0k1?=
 =?utf-8?Q?P3ACoo/h0256J?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB6886.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUxLT3I0VkpZQjNFQ0xZRXludW5mcFVtM2JEc3E5dmxGejFUMHA0cVRyVW80?=
 =?utf-8?B?UHJDdkU2SUxqS3BUSE5YRkFxMnRDZ3BqaGQvaFloUVhOWU1lUzRMckpDdEFN?=
 =?utf-8?B?bkdEV0dTTEUxdzk3bUpCd01STUFKVXB4aWhnYzlWcTRLZWlUUFZuZGJkbktP?=
 =?utf-8?B?YUtnVzBGczNkcHh1SjR2ZU9GRUxCMVdzTzE0bm9HbWY0Y0dNYVRXMlY4ZTBh?=
 =?utf-8?B?RDJjek1YdVNpeVdudTFKRVBicWRKNlJ4eU5EYllPbjBvMTlEaUtCeUFnOTZO?=
 =?utf-8?B?cElPdURFL1JpMUlna3RHUS9BN3BxT1lzQXhQRkZ1VFZxWkdiVzFoYXp4MUJv?=
 =?utf-8?B?V1hLdEJiM05YVjJsYWM3VWtuQTdOZVpUZnBOMnIxSGhjUDMrOE00b2drc0gr?=
 =?utf-8?B?WlRpVTRjWTRYZ0ZvS1JxNVJjcUJGT1ZneEE4dDM1R2h0eHpaR296bkNFWDBL?=
 =?utf-8?B?ZElHYVFjL01tYzQzeDlDaGlBQ3RrWTdyYVNuczYwSTJNMkR2aDNJMlZVVDFY?=
 =?utf-8?B?N1U5RitsSTBram91c2svUWJBTkVGT3RIeFVWOXoyeVNWYldXYUpuRFQ5TlpH?=
 =?utf-8?B?TTVxOStZVjlSdHU2WnNsaTYxQmd4aFNDZjBLek1aM2IzNXRsa2wvbXArUm8x?=
 =?utf-8?B?SmVUOUVHbTFTaDh6dllJVENSRWRiNm1HRFJiblVxSmM2dlVKNXIrSDllMTJs?=
 =?utf-8?B?aE9lTCtGclQ0SEpxY20wNm5IOVg3SWdidnZ6U20ydVhMU1pvYUZzTzNJNFVs?=
 =?utf-8?B?K2R2SW1FbzBNd3ViVC96a3lDbEJMV2JGVlVjR3FHVXJBbzQ5ak1lbmNGWVhK?=
 =?utf-8?B?MFUrYllLSmRGN01sV3NhbEFkRmlGZGUrWFBXN3lmWGl0UkZ0RWpyU1BtVlAr?=
 =?utf-8?B?eWl2ajJmWDA2YTR6VFI0UVJkdE9hd0JoallRTEZTend0MjhZZFpNNCt2SWpr?=
 =?utf-8?B?WlJyQUMwZHhWblV1WTdXL1lIWXJCb29pV2JXYXNVUHhCNXdFTityTnEzOFo4?=
 =?utf-8?B?TkRyMXpvcEt6WW5KNjdGS0dtMFNBcm44bUp4R2hxckdqbzdLZHhsVkh6UXd2?=
 =?utf-8?B?YVdyL3Y4cUdLR0VBVnYzRUs4QkpZTlYzT2U4emNGNXNkMWxlQmRRa3R4TURO?=
 =?utf-8?B?VGpYWHl2WWRoUDlmZGhydzZPK1V0Z2l3Vys0aCsvbS9MNWtrOFdTbExOc2FV?=
 =?utf-8?B?SDRPditEVW5pM1JKQjhSNGtXZVFKKzBhdnZXUHczaDZaNkFkbkhXVUhNSmkw?=
 =?utf-8?B?aG5LNWRQdWZIN0RkRmdLRldPeWpOVUlubUJnRFY3Q2dobkZja1g2UmxEMFBI?=
 =?utf-8?B?Rmp4bDlXdXcyR29YdjljVUttQlExZVNhZjlnM1NlY2x2VDREdzJmemh5Vnl4?=
 =?utf-8?B?UUlKcnlBQThZcnZHTlFTNWlJbDhZd1J2UHVhRjNnc1hwcG1ncStSZnoxTjlk?=
 =?utf-8?B?blQrUE5jeEVPMDdIaEtycnp3SHNNVWNBUGVERzNBSmZSVDc4MHZ2QjNlNVFl?=
 =?utf-8?B?VlAxelRhc0d0WDEvRjl2QkRiaXYwN2txeFptZ2NSbGlVdSt1L1dxSGF5aHVr?=
 =?utf-8?B?bEZJS01MeGZ2TUgwUVVTVFRML1pmU2tScWpUZGpxT0xTNzAvVFZONXJoaDNa?=
 =?utf-8?B?NjhYcUhJc3B0Qi9NakJPTmNWTDFhc2c0WmRIMExMQnRKSzZJY0s4ai9ZY3Fs?=
 =?utf-8?B?Wm9janVYRzlYMGpPMldKb0Q1M2w5Vkk3eGl5K2Z1WG91WVEvdEFJMCtVOU5G?=
 =?utf-8?B?aTJmejdubDU2VEJONE1Nbm9MblpacTBEVEV2c3JRZXVOc0t3SnViNHNHVHhP?=
 =?utf-8?B?M1czUVNyZ3FvNHJtNms4RmFselVlRnRhSXJWcTB2YW5vSExKMHY1OFdXR3hv?=
 =?utf-8?B?RFN6TlllWnV0ZVQvMHhYMDNqM1BVOWdvZytoM3dHTXBWUW1NL2VTU0c5VytF?=
 =?utf-8?B?NmswWlg4NXd0NlhKRUFKam04Y0x6VERvWUVKTEpFN0NPSmNQOWZEVVlGMDNr?=
 =?utf-8?B?TWpYdjRmU0p0dUxESTdVRVhSWHlZWVRlWHFCQkpGcFErVEwyd0N3blVTS2hZ?=
 =?utf-8?B?cWZWbVh0Um8ybm9ITFBML0Roano2Q3VpR0J5MGhTTE5QZXlYYlRmS09YVlZh?=
 =?utf-8?B?ejk5cGVMZmxLTVZtRXhkTHc3V0R5akV6U3V4bkJjelRKV1FvNW9pNGNqbFpt?=
 =?utf-8?Q?z3INp/nNnCE1+nEXUWYK7Ig=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GSuQLEDysu4zQFhSFudy9f9Nyjjpal95mWmAjf6bmb48LK9hGVXkr5iWLYe23MPjC0tKoGazW010azhSB/RytvXy0rZlBr/kjXQQW3QVWXxwsb8D0eMvf1aZXy66sTdRFgHxk9U3IVVJWEQT2a3gItJ7PmChKHwra9SB9RT1wPX2KZDpai60LrBy1e7B1FUF8IzG1XaOsOpL9mht+xam2PEIp6D62qMefjgXlH3vpIYEDgw/oNVg/gaX21Tfn76+B0Sv/PLwGJW9iGOlj51Xf/G2AgdC8lxha39IvqNkXSprKJLIsqMo9b9LtPP+/ToIqRAjcL6yjAUhbgIigquokjkXhMh+k4FDrDCgvD5KZyfPOgBjjwivnSHDKh0oaj0CAXfOQjzDQr7HI+1vccFeWP8mWoFjg8Vg215bEu3ei0W/HaZXwcEfa376/To+d6Ev4L0loOcEzVzOgU6n1sTMLFWjCQwAWRRsmSi8btpqbA5IuO0/4uYMWpslex3aAz+KAuElk41n6yHB2Oi2RRxcSDyRPMcgji/ze9sTWsIIFQx8HmkYsp1jQi+CSYcZ1BSDTs3MQH0lxggP8FW97hfTIdWdY2C3FcEou2wuD145ML0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 902dd247-d1b1-40b6-aa2a-08dd82f6cd31
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB6886.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 06:11:07.5196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oyy48X+md0nVTgZmS8vxLRUNOmiju0AIxaDW+o4X+ftqsv/trSdbThuqbOMV5KZYn5Ge9uHH2NVgFxDvCJV5VXYWRSScl/nA7+BGK/uKVBHciZy0diUXMwl805L2wDjH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4983
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_02,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504240038
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDAzOCBTYWx0ZWRfXxVCQ5dQxTXfL 6KUoin1IWvZSxeg7JwgS3yrqpNzj+/0JZ9lbbw2eE6FdlBnn4QiSex3/aKl7IYfAf1RfeqONLbj nDB0dPItHBxC4RLUy+E+YYvOxhsfXX3jwmgI//GeQaR4LzP/DCbXXSTQx6n7c1Ayv4WzPxXuj/z
 SvdsZyohbOymYcBAKSDrSqdGLV2uzC+ABqec/4aQ3qy3LZ03yHAyT1GCS9TLvdNuTEYu6w4teNC FdwoilmOYpgWm2J4xPR3pNkdQndX9/i6ybxGnElU1/WvQckC1kwLimvBJGzIJYoPLkjbW1kLpPP sC8p8XvdmAi+Eq58oZlPejgLPBbdJmASJzN1RWd2+ZL+j1UiIeY2BGmST4QxfmJyUgC3ZxNyh/L GaPmK5yb
X-Proofpoint-GUID: pTuVxHNDT9iqfG1iZLhQh54l90_YTlD9
X-Proofpoint-ORIG-GUID: pTuVxHNDT9iqfG1iZLhQh54l90_YTlD9

Hi,

On 21/10/24 23:33, Greg Kroah-Hartman wrote:
> Description
> ===========
> 
> In the Linux kernel, the following vulnerability has been resolved:
> 
> tipc: guard against string buffer overrun
> 
> Smatch reports that copying media_name and if_name to name_parts may
> overwrite the destination.
> 
>   .../bearer.c:166 bearer_name_validate() error: strcpy() 'media_name' too large for 'name_parts->media_name' (32 vs 16)
>   .../bearer.c:167 bearer_name_validate() error: strcpy() 'if_name' too large for 'name_parts->if_name' (1010102 vs 16)
> 
> This does seem to be the case so guard against this possibility by using
> strscpy() and failing if truncation occurs.
> 
> Introduced by commit b97bf3fd8f6a ("[TIPC] Initial merge")
> 
> Compile tested only.
> 
> The Linux kernel CVE team has assigned CVE-2024-49995 to this issue.
> 
> 

Looking at the fix commit with more lines around the fix:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6555a2a9212be6983d2319d65276484f7c5f431a&context=30


  	/* validate component parts of bearer name */
  	if ((media_len <= 1) || (media_len > TIPC_MAX_MEDIA_NAME) ||
  	    (if_len <= 1) || (if_len > TIPC_MAX_IF_NAME))
  		return 0;

  	/* return bearer name components, if necessary */
  	if (name_parts) {
-		strcpy(name_parts->media_name, media_name);
-		strcpy(name_parts->if_name, if_name);
+		if (strscpy(name_parts->media_name, media_name,
+			    TIPC_MAX_MEDIA_NAME) < 0)
+			return 0;
+		if (strscpy(name_parts->if_name, if_name,
+			    TIPC_MAX_IF_NAME) < 0)
+			return 0;
  	}
  	return 1;



both media_len and if_len have validation checks above the 
if(name_parts) check. So I think this patch just silences the static 
checker warnings.

Simon/Dan , could you please help confirming that ?

Thanks,
Harshit

> Affected and fixed versions
> ===========================
> 
> 	Fixed in 5.10.227 with commit e2b2558971e0
> 	Fixed in 5.15.168 with commit 54dae0e9063e
> 	Fixed in 6.1.113 with commit 80c0be7bcf94
> 	Fixed in 6.6.55 with commit 12d26aa7fd3c
> 	Fixed in 6.10.14 with commit 2ed7f42dfd3e
> 	Fixed in 6.11.3 with commit a18c7b239d02
> 	Fixed in 6.12-rc1 with commit 6555a2a9212b
> 
> Please see https://www.kernel.org for a full list of currently supported
> kernel versions by the kernel community.
> 
> Unaffected versions might change over time as fixes are backported to
> older supported kernel versions.  The official CVE entry at
> 	https://cve.org/CVERecord/?id=CVE-2024-49995
> will be updated if fixes are backported, please check that for the most
> up to date information about this issue.
> 
> 
> Affected files
> ==============
> 
> The file(s) affected by this issue are:
> 	net/tipc/bearer.c
> 
> 
> Mitigation
> ==========
> 
> The Linux kernel CVE team recommends that you update to the latest
> stable kernel version for this, and many other bugfixes.  Individual
> changes are never tested alone, but rather are part of a larger kernel
> release.  Cherry-picking individual commits is not recommended or
> supported by the Linux kernel community at all.  If however, updating to
> the latest release is impossible, the individual changes to resolve this
> issue can be found at these commits:
> 	https://git.kernel.org/stable/c/e2b2558971e02ca33eb637a8350d68a48b3e8e46
> 	https://git.kernel.org/stable/c/54dae0e9063ed23c9acf8d5ab9b18d3426a8ac18
> 	https://git.kernel.org/stable/c/80c0be7bcf940ce9308311575c3aff8983c9b97a
> 	https://git.kernel.org/stable/c/12d26aa7fd3cbdbc5149b6e516563478d575026e
> 	https://git.kernel.org/stable/c/2ed7f42dfd3edb387034128ca5b0f639836d4ddd
> 	https://git.kernel.org/stable/c/a18c7b239d02aafb791ae2c45226f6bb40641792
> 	https://git.kernel.org/stable/c/6555a2a9212be6983d2319d65276484f7c5f431a

