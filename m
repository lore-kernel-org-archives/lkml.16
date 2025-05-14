Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9996F21B195;
	Wed, 14 May 2025 08:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211678; cv=fail; b=VL8jdM+4OYF+SXUCklqiBSKyHPcRdmOGDX2sUiPPpeeffBO9OKO24I9fE/FC83teMnXBdpa/3Y7P3efqcEM72FFY+z5ZnP1UI4efuUg1xiakZH75YJsgZc7WPE2FpME/ciqMNPlf8UOjgWX3qLEMkgShy7Ac2lcOMSKiS6QutCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211678; c=relaxed/simple;
	bh=XqdHjJxxWs4h6a/Eos2XSjAwoCpHXahazCuntxxymZ8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OXWzfI2JbsjwQ2zuwyqCyVaLdLGZZW7sJyBr9Ml+RNt6HO8qjVMKW5TF4V2WhXTjC6hoeFOlk9xk+Ges7Ur8y7nG/CDUMmeEOlTJFnMgWHl/DUJHmst5e7bXChdclMu4D1ZLpli5vEPQMNOtU7cm26MsjM4BdYr7UpthhcODvwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EyZp8s1g; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rAsU67R8; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EyZp8s1g";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rAsU67R8"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E0fuwu025340;
	Wed, 14 May 2025 08:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=p7MQkzZJqerI7+cSZuJnZEJ7MPqms0SsgblCxTBU0Lc=; b=
	EyZp8s1gtVwEZ2ou9KRxIRoYSlmIuz/X8sEaBxa/HZrU4gDASJ3I1Weny74gQHcb
	KbbgKi7MaBElSJLgPOoxUdvFZV+eWJwyD+URTX7G3QwLfsxow2KO2CCycoLEcNKV
	jlgc+1ePsJPDJug2/nHBGZd58Zfop4UC/ZSfHdO6btF3JIxwNPkDNs1m+4eL0FS6
	i1BIxLIYdAG4IAXQTmPv5L8YpbIVklSfg5Cmo3UVuouT2DELmicb1OiIjb7TpjHn
	9wG5//k9R0lOGZKPKrb1YdblZ2WrZkbnb+7BLeqTGDoTI19KqwPv+6xppyxvqMqS
	Ir2uYUAUN8r8Z0hQqF08cg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46mbchs1a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 08:34:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54E8AJEZ008922;
	Wed, 14 May 2025 08:34:28 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazlp17012034.outbound.protection.outlook.com [40.93.6.34])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46mc6wcf6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 08:34:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2RGLOjx24jm3PEd0MXxcEQfaeGKo+l0I9yRwOVD3ffY3abInUUwqcwsgoUDATgpR5WNm4c+dPm9KoB5vjd+iscQz9jfLMMRkpfaoPHI/RKIZZiPMTVrRexb+uT/QGZSghGT3V9lAviMzoCVvtK/RSq06AXVjOhUBg5sZI/EdN55hF1WTuTdFOsRn279TC0MUCubELP1LrqgrDEowu7SBkS8PXqSZhUb+qnx+RAqMKUutk0nLGScCMoDIJ8CoAKRrEFOfiiNLs/mvYlqAPedBgV1h6cBBoKJ+wmfnpnlWiBkunosAfrRBnc/AfFWfek6AqVKvjuJpvO64sGQvApbtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p7MQkzZJqerI7+cSZuJnZEJ7MPqms0SsgblCxTBU0Lc=;
 b=o/PS881gZYr+b7lwk+r5EluzaqDQAEXjJAf8C1F7cxOzrZh6puhYbGlJExiE6fVMiJIexNhH4rvjZKa1aQpaF94U1iYOlPnyG9J8GAujO3O06FzMV2Qgu7BRhZEfkUauwiEbUv3VFZEL3UpejByk/iwZW+v/3ptax9s3pItxTSZ3N7fo3IvVfRx4lrH6gz+OCWKNgG2jXgbvbXopR0Oa6Pc7if4j6wLmq19SQc0Hu1GyjXYDRQ7WvmpQdormR90mRx6/5lqx9/WWgNbZKsh3Ug5h88IdvAinLO9FuM983ghHqcHP7nB+G5S4GIY8oxgwSgRS2C/cSiU+dPysrnQT/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7MQkzZJqerI7+cSZuJnZEJ7MPqms0SsgblCxTBU0Lc=;
 b=rAsU67R8VSTZO07L2E1ZrOu2sc7eaCenSWNNvfhwNmsN23nhB3nxkF3Pg39jyWNsMXqfmOmTc4M731SOc+yy+IZHCjrnygug0t8PnlP1LxkVUmR7h9RULhdwbzSE55wg7g+lK09sTCmhsinhrmVB/wV++6DyOW+tpYHitfnb6uQ=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by BY5PR10MB4145.namprd10.prod.outlook.com (2603:10b6:a03:208::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Wed, 14 May
 2025 08:34:26 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%2]) with mapi id 15.20.8699.022; Wed, 14 May 2025
 08:34:25 +0000
Message-ID: <aece6449-8acd-41ae-bed6-fe5cc7d64050@oracle.com>
Date: Wed, 14 May 2025 14:04:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14] platform/x86: Add AMD ISP platform config for OV05C10
To: Pratap Nirujogi <pratap.nirujogi@amd.com>, ilpo.jarvinen@linux.intel.com,
        hdegoede@redhat.com, W_Armin@gmx.de, mario.limonciello@amd.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
        king.li@amd.com, dantony@amd.com
References: <20250512213711.3226784-1-pratap.nirujogi@amd.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250512213711.3226784-1-pratap.nirujogi@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::18) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|BY5PR10MB4145:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d636694-a433-4b50-7de3-08dd92c221f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q1lXZlgxcTNNcjlnMm5DNXZxNDU4WnlsYkdVL05WL3EzTVRZQW5DeEgvemNn?=
 =?utf-8?B?NWpsUm9YZHBqM3Ftdk9zM0M5S2FCcXhOcFNvM3R6V0dZcFdZbjJ2M2EzeEw5?=
 =?utf-8?B?RDhqWEVGRE1JZERhamNVOXBocUFjajFoRnNJZFZrdTJHSGVxM255T0tGVHdj?=
 =?utf-8?B?R2RINHlTU3ZMa0dkYUVtSzFOMytlNVZMUUNQVm80MEZKQnlaWVBOTXdEWU9m?=
 =?utf-8?B?aEVYMTk0RWk1b0dXa3cwNkxuNVE5K2lBL1BJdEtBZ25BZnliSVdONDNIeElh?=
 =?utf-8?B?c0s0ZytOVjRYTWs5ajhMYW82QzF0YlhPbXV1Q2NqQWluYmg1R0VKVVlINlBy?=
 =?utf-8?B?Ty9YWTJEczJjTDVVSXZKSERjUHIxSFoydHk0OTM0a1dNSURITmxsOHd0VG4z?=
 =?utf-8?B?SE5Sd0hCa250MGllZXVyT21pS3ZHVWhjbmk5U1N5QnRFUnhFNWNBNGxEdkNO?=
 =?utf-8?B?VDdPRDdGb255K3NUdnh2QndJdGs4UnNYdENTMlhYcFpENVpFMFpKMmFEZ3RH?=
 =?utf-8?B?eEdjV2F4NHN5VXFnY0tDK2VNOHZ3VFByaTNCYjcyL3lXVGdDQ3I0K0xRMzZM?=
 =?utf-8?B?NlBENmh1WW8yNFJOZzFQOXBlSEt3V0ZhcWR6RjREdmVGUEVqeUdjaFFSRy9C?=
 =?utf-8?B?ZHV1TEpHTnNKSXlZOEd2UExWRHIzV3hQaldnZTlGOWtnejVuWHExR3EvM3gy?=
 =?utf-8?B?S1l1eTk3RWd4Y1FKTUg4dVJQYldXWldPcFpUSTJZRjNvMXhpdUJmcUdjYmFh?=
 =?utf-8?B?UDMvTjBYK1psb2Nac3RZQ0xhaDREVVhRVzNXYXBlUVR1ai9KelVKNnJuakNo?=
 =?utf-8?B?TTBDYzR6d2ZKeG55Q2Ixd3I2REVTdlQyZk1lR2xqbWhzZkJBdzRaS0w4UlM4?=
 =?utf-8?B?S1NNdWpKUDNGN3ZZbnlmU3NmOEdBaGNJMVpmeHhSQTNRaWVUc1pFL20zeWFn?=
 =?utf-8?B?Y3lPeHl5b25nYTdxb0tYRWp4eFJlYzh4VnFuR20zZ1BmSGlPdjRpWnpKdjFt?=
 =?utf-8?B?U3g2Q0dCY21VNFI0UWpCY0xYV0tYTEpraitnYjR4SkQ4Z1dMZk50c0VRUmFp?=
 =?utf-8?B?eVY0NHRDbUo0a2NBOUY4bXlhdWwzdmNEVFJPeEVaZWVZenIyV3V1RVRHMWtB?=
 =?utf-8?B?RXB5SEE3Q0NoRVM4azFLb252Sm96U3JXeGZlNjltSUVLL0lWcHhIalRyQStG?=
 =?utf-8?B?WXliaDM5V1NzazI5ZU9sNFdYdkQrLzEyU29Sc0hwMDVqSkxTcjZtaDBleVFk?=
 =?utf-8?B?SFNKMU8xNlRSb203K3gzSjVCSEtJbGsrVVg0d0dsREdHMitDTEFPNEdNTUQ3?=
 =?utf-8?B?U2RrcW56U0x1aGM3S0kraGF1Rk5WVXlRWisvc0xkekloWmJIS25LbTBpS3hZ?=
 =?utf-8?B?Yjg4SHN2NFFxY1JlUVdMOGhHRzVPd1BCeDl5WS9wV042RE5CYjNONE1yeUhs?=
 =?utf-8?B?My9lZHMwTW8ybWpQaUVjZDNZQ3QrWDZwODZRUTNtb2NiSDcwOU9zMnVuSjdS?=
 =?utf-8?B?VmliSmpSdnBkUEZlaTF5N0lka1NrQis0UGpPTW9PSUZWc1VHZ2E3UGRrS2Mr?=
 =?utf-8?B?ZTdJZHR4WWJmSnZIdG5kWU9SMzN3VVlNKzFiVUxIY2RoVXFsVFpOYndSQVVy?=
 =?utf-8?B?VzZ2WTZ1N0U0ZVhjQUtZN1JsckFBNzV6aTBtNXBybnpGZE9jQm1vbUtvdE9S?=
 =?utf-8?B?QklvT1FHQ1JmcHc5UDhSdTU3dzI0YlRrSnVBd0NNV0dkT2h4dmFoTEovRVhR?=
 =?utf-8?B?UDZyV0VzRCtGNGNTeFd6YjhNNU1mZFc0RldrcDgxNUhwSXo5aEI1QXpzUWcw?=
 =?utf-8?B?amZCS0lsNExVcWV4SHl2anAyRjl2QW5JdGtacW5IZUdJL1plWVNndURrS3Fq?=
 =?utf-8?B?TEV6b1ZvTlVxVm54UWFtbVFUZVJOek5pVGIyOTdqR1NlZWlFajcxTFN3N0xj?=
 =?utf-8?Q?dFfVSDNxC6A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzZjaDIvNkFZV1U3UkFXSkJEYU56eUZlWGl5clZ0Ly93OFJucHpPRXUrZGxY?=
 =?utf-8?B?UDRmVXhiZk5uRGlRVVlRMXVPaHdsUWk5blR6eXpkK2tHaEVua3BLU3A0amky?=
 =?utf-8?B?c1ZoYmE4eTdPZVJONW1YN281MCsxemgwZ21ZV1FidmhFTEc1Rlk4NDhHaUhT?=
 =?utf-8?B?aG56d0xTdmhtOHNKRFdISS9LWmMyUUVBNXBTaGwraGszQ1VqQmVrbFJlSXRu?=
 =?utf-8?B?dW54OEdwZ3pkVXZrb0RIYmx3ZzkrOXp2R1dzcndYdkFzdEkvQjRLbnEyNmdT?=
 =?utf-8?B?VTdnbFk4S3UvN29ZZUF4ci8wUGlBMnF4ZWpaUk5Ib2RvTkM4bTNPRHIyK2VF?=
 =?utf-8?B?d0V4YnBBMFpOdnlFUVhyV2NZZVJyc242NWZOdUU0VUpYVTVSamtQMWdoMk8w?=
 =?utf-8?B?aTE2VUZpbWVUNXZkdUR4L2dRcVlDK2wyeU05YTM3SzBKZWdFUVRHSDR0dWM2?=
 =?utf-8?B?alBTNFhOTWRDUTBOY3NQdnMzRjdwMmQyRVd2KzNXVUp2cjVNWVkzNG91dVN2?=
 =?utf-8?B?bENFWjRxR2I1TXk0UDBVWlNOV0NEY0hvSnpYTlZYa3k4WUlsVXV5cEF0VzZ3?=
 =?utf-8?B?bG9ZZFZBS2M4NDVRQ1BwWXU4aGVQZFNNakhVZzNERVJsaTZsY1YyZjAvWW1k?=
 =?utf-8?B?SmNKVFUyN2hpMTIzTE9jVE41ZFZ3a05PV3p1Smw4ZFVndG11cWV3TlN0ZjVp?=
 =?utf-8?B?b3o1dGc3dTlIUXN3YTAzUGJQREZ6WUtJdTZKZDhDbkVlRFcvTGpsWE1uOWhu?=
 =?utf-8?B?TmRyYTlYa3REUWcvTElMWlNjLytTUGs2c0ZqclBWcmoxUVdqeVhuc2RkY2l3?=
 =?utf-8?B?aGtUbWwzVzFHWlpDSGNRK3N3UFc1WHBuUDEvV3lUU1ZNbUVKWlIzaFBuNFJZ?=
 =?utf-8?B?bGhVVkJoaHNZZkdHN0thczNONWtUV1kyWWc2UldibWgrMEMvN29RMVZ4N3FD?=
 =?utf-8?B?eWRhbXhxWGUzM21oMFRPK0lOVmdjU0pmeDZLc24vd2ZoMjV6UVg3dkd0dnBW?=
 =?utf-8?B?ZHNCUVlIcWNuNmxnVjZ5N05NL20veEFxWkhKcGhGMi9Qbmw0c3hEczJlTTZM?=
 =?utf-8?B?NG1BYzA0K0pydC9nSzdVRlJDZm53dDhKNXdySXVKWllrOWRuM3RkVFFXZkN4?=
 =?utf-8?B?V2VzcHNOazNHalNtQzhlMmRDb01TTzZsQ1VpTXZ6RlBOQjNWRlhBSGI1WHFR?=
 =?utf-8?B?REVQUXR0U1V4QTh4WlYxT3hEWXcvUkZ5N2hxZ3JlRTZDRjZuUWwvUkRGQ2xV?=
 =?utf-8?B?TDlGK0QrbThwU25DOUFPWWI2ZGVOQlNsSlM2Rjg1aXZ3OE5jVjN4RW4yTzhI?=
 =?utf-8?B?czNTbTdpWmh4dkJXL1h4Q2ovVjdvZDU4Q1BuanhzYk1QQ3dKcFVtYWZiWHdi?=
 =?utf-8?B?Ymc4bkRTRE1KVXpaNzEzTjYwaVlaOVJ0T2hqU1Z5alVhMTl4SzBUZzhxVEJE?=
 =?utf-8?B?WTVnTGxyT0VTNWdyTG1uNUJFQlIyS1pCanJnRnpjT2NDNjM5UGl1S1pXSFNF?=
 =?utf-8?B?cEtyc1dKUGdaVmZ4TEtRNm9xN2Nra09TVjNvcjBWdm9vYjVtZHMydFZENEta?=
 =?utf-8?B?eGxyZUZoRXovR0hLa3FIQ2ZxVWl6WUFJbHBNRFMwNnVGcVdrVFlTNmVWclQr?=
 =?utf-8?B?R085T3VPMXFwVVZJN2ZSYlhnbTI5TUVoR1VFa1o0QnNLRVZWWU56aFE3b0Vv?=
 =?utf-8?B?ZVVJNGdPUVJ1WWFOZE94NytPcU5weEVsRWVZbWxDR0NJekJpdXpKZ0tKWXdS?=
 =?utf-8?B?RmxqQnZqZGNHVjR3dUlFOFVoUlhrODc2aG5NQyt5YVFmdU5odGo2aXRhcXBT?=
 =?utf-8?B?V2N5OWxRQTBmYkNyb1VXTUNETmgrNUgvYTR2ajRGNEhmOXRXREI1MnFnak05?=
 =?utf-8?B?OEtBWHY1bDZUelNSY0dEYkFQcDhtcGorc2ZuODJTOXg3YlY2bjZabFI1RldL?=
 =?utf-8?B?ZGdLRTZoZzdydXRRbVcxRDUrdk93Ly9Zc3NzQmxlY3JrUDFBdDNPRjJRb0Jn?=
 =?utf-8?B?cFBNV0RDODl3Tzc4YW9zVE5jS09taDlITW5mOTdOblNRN3RJa21zSTlLblVw?=
 =?utf-8?B?S2lMRks2aVhqVTYyaGQvemF1SzM3amFrVWMxYzVnTEJsU1RGMk9CRU9kOGhv?=
 =?utf-8?B?ZjdUWjdqdjVNLzcwcDZGWk1SSENNMG9neDJHMFVjS0VrM0RGb2sxbVRuc0Z2?=
 =?utf-8?B?b3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NeGonnYkrUFkgAC0/IIa2FGJaUb3cxzaEpCr3ESNZ4MSX+VGqlgO04Pz5zQTA1n6lq79kDhUtkAh1jUWJq596ijL/VUXYYJZrJHgCr0Pnq3gjBqvBrWduG+4gq8T9iF098rFKtsfDgntJDTnAMzBORojfyPLkE3th6gg7vMrqUmlO1RFFMM7um6bYhqDNNySdgcXgBtHvjhnwPhZ7bbY8+tzlqrGt5ObpAfVygG9DRZG0viaJurgo2S2hsSiV8SjxM5niqIRpiNtCizM95gvPylg1YVUzm2XB58e/DtsJLqrFSuNEoH/vAQc3WjDXrt2tjmmLmGb09NJwC54MEcH7lZnJvGuzLyjm72TTspTKCzghrP3v25ZnwDEOQnwty0/O9YgBbwijQLurUnAax/mnYAPDZD9XO+LPMAKFfOEViI5mIXabX//0hSXKjfwBwKdtdYv2sDgJAboOjTx0FrfCnhg8FQ6fCg9ZhG6i0fZOSwKmXXmTqaq7Cftrlaa99Gk7Y+AeTEN9ctqkvEDnXH7H/0vyi2A4R4K2keYPyp85qqqBjzumdm/1oxqw+0nbWkMuyP05UQluwqiwC5Xg3YhN/fxM3O492tJ6i3HaUrhrfA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d636694-a433-4b50-7de3-08dd92c221f9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 08:34:25.2236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QozHwIR4R0cfDPoA9lmR7YbZz7eX/uoTMfhAIACuq+2AP53zaVsGJ7P1b21XwRDZ/vTJxH1ivzrDqrnNi/TX6YGw+tatLUXpzQKsOv2EBx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4145
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_02,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505070000
 definitions=main-2505140074
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA3NCBTYWx0ZWRfX8RnSN2sgT6JS Bf6Yh8tKu4zW7CFyUmNM/EbtvYfjzEahUBtAnibUeTT0Mdv+9T3NHss6InMgJ/DVKb2MFamIm8t wzgb+Qq20iBN5ie8p0f2xYOj1EYNunSGp50+/XG1/ZKES2BK08BlCED9a3GWzZ+hR7JxZ3hGQ6z
 CXWE53Sph9cDvAmC78+AmV1wCVve713U+QeX1y+afiTyUefaLAmilcI/t+/fFr9uvxLosQkw2MT soN0t9le/r/BHeMNrC8R+Iafb0M+CPO2jyRzEVmITNo4nfkjliFAmZBMS9Hf9kJUU5GkcKN+u78 Bp+9RaF1Ng2Mspcokm1It04FB6maFPkricQCm5ruJo+t4AU1/enW0G0ZJhkd4qH7n0W6hTewFI/
 uANqjsbL/e6K7tMwYX2Buzzs1ob50rSeUWF7PfkOXqLTmKXPf8iSVMaA+p8y8OqghXS5EfXE
X-Authority-Analysis: v=2.4 cv=EtTSrTcA c=1 sm=1 tr=0 ts=68245595 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=IEYkgWkrS7oWPDPJLVMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: TxNqMwMJh81NYScwJTjODu9FimOuz443
X-Proofpoint-GUID: TxNqMwMJh81NYScwJTjODu9FimOuz443

> +config AMD_ISP_PLATFORM
> +	tristate "AMD ISP4 platform driver"
> +	depends on I2C && X86_64 && ACPI
> +	help
> +	  Platform driver for AMD platforms containing image signal processor
> +	  gen 4. Provides camera sensor module board information to allow
> +	  sensor and V4L drivers to work properly.
> +
> +	  This driver can also be built as a module.  If so, the module

remove extra '' before If

[clip]
> +/*
> + * Remote endpoint AMD ISP node definition. No properties defined for
> + * remote endpoint node for OV05C10.
> + */
> +static const struct software_node remote_ep_isp_node = {
> +	.name = AMDISP_OV05C10_REMOTE_EP_NAME,
> +};
> +
> +/*
> + * Remote endpoint reference for isp node included in the
> + * OV05C10 endpoint.
> + */
> +static const struct software_node_ref_args ov05c10_refs[] = {
> +	SOFTWARE_NODE_REFERENCE(&remote_ep_isp_node),
> +};
> +
> +/* OV05C supports one single link frequency */
> +static const u64 ov05c10_link_freqs[] = {
> +	925 * HZ_PER_MHZ,
> +};
> +
> +/* OV05C supports only 2-lane configuration */
> +static const u32 ov05c10_data_lanes[] = {
> +	1,
> +	2,
> +};

OV05C -> OV05C10

> +
> +/* OV05C10 endpoint node properties table */
> +static const struct property_entry ov05c10_endpoint_props[] = {
> +	PROPERTY_ENTRY_U32("bus-type", 4),
> +	PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes", ov05c10_data_lanes,
> +				     ARRAY_SIZE(ov05c10_data_lanes)),
> +	PROPERTY_ENTRY_U64_ARRAY_LEN("link-frequencies", ov05c10_link_freqs,
> +				     ARRAY_SIZE(ov05c10_link_freqs)),
> +	PROPERTY_ENTRY_REF_ARRAY("remote-endpoint", ov05c10_refs),
> +	{ }
> +};
> +
[clip]


Thanks,
Alok



