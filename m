Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED7317993
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747236620; cv=fail; b=K9vzuiwWq/GaDm9+U72wiat36JY5++5k97JEgBAbJ4d5vwCUHHT1QqapSQ8Kf33lGlBk/6rP356QrsKGL3ZS0Qqyu51ZTEDBsCipZtFRKIOBCbVhRr82gwEASMc+XAltuQQQPatuJWdEoJfM9K1bDQeVIRkxItNWmML1r8gr0cA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747236620; c=relaxed/simple;
	bh=mmfCUMvj6aRKG1BoCSWlKpgaNLtScvpYMiiQxr/ZT8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pRbSLScNi/3UWHF+2RX294ZPVKKfh0DuoSr0inLJG5za9qnLWnkegeuhCcMOf8NJs6/7jiAh6um+/rd3GRfO92TSCHtL5PMiIWPZ1k229wk2DEmMWQqY7DcRmWYrneB6JGgn8HYQlrpde6qTDwspttv6/UR5l8F7BkEDcMevTm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HXdy4PhC; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wu+og9Uz; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HXdy4PhC";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wu+og9Uz"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EDhsun010755;
	Wed, 14 May 2025 15:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=mmfCUMvj6aRKG1BoCSWlKpgaNLtScvpYMiiQxr/ZT8o=; b=
	HXdy4PhCLpnTcmOU0agxRPY7THewSTD37uUqnfRyn1acc7KRubEBGg4Pu2MwxI1p
	KnH8wKpzwJ024QxkFXh8kQs9iZaPYKhzkY+V8yfHzTC+Kebk6z8bkWXiYj++YfVF
	erlFAG0d1l0Qcx5PxsMWXPB+sA0cGbMAvWbBOgvGrYfxA+Tvz8t/n4hJ0e9FNfka
	IIFZY0MLsKjGL1ZohQzfti/DTIRxdbpMTG6utWM0D6U47y5acV0+ua3ol1mu6FL5
	jNh0Dn7CpbH5UGFmO2jUo+brPMCbip8YCixZBQmrbEhFhM8+sIVHPhLCdHoo4r5R
	vS7JMm4/mhUwjufAj2AeRA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46mbcdt5mp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 15:29:54 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54EEsbRx004467;
	Wed, 14 May 2025 15:29:53 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazlp17010005.outbound.protection.outlook.com [40.93.11.5])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46mqmc7mqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 15:29:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i/+HaSIYBW2xuOHUH7SHYuV1GMASSZXNmU1pb3fSWiM8HqAUg9PbVZYER2/ycpTWuScETK1rw7mDzc/8dlf2RD2ZmcHkhqK6ZnvUd+iSrnny9dJN4qVyATNY2L8cH0SC66Zq2TYuem0SH6va/3z/429z0hZ41qI7YssJYt6Ye5qtn1tS+btsJfB3Mvrs2swyniv1XPASutvOX+SBUkqJEpSABogtEHtM3z3ObAtd+mA6je1rRjyU5ZWLoDYOdTjiFUFeZa4Gan+AtuY+RCDtoGkx0wCmtCysrHnP18jVCmEZZnmLD50oM4OFGFPxeSBW8k2WTEj9fhn8T0FJWyjHzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mmfCUMvj6aRKG1BoCSWlKpgaNLtScvpYMiiQxr/ZT8o=;
 b=cKApczbOH7rVj55z4ce+csPXG+cjhnGYTv2PyqB59Cjwz8MEBKLpYDhr5qiQrx/pyzCy9AL+pSHxqwalE50v08GVBzwiwANCWfjjFkPu9AGgPJlw+PRAu/h5BU8Ndg2G+u/Ku72cg8LpOkIPhksnHkH0GBz0ZHGUtto6H9xQp5uVzeGliJ0gz/sTlT2egzFTJICQDHEM9jnNEsQnADQVBS1Io9PVeDjlc6FdAnQuw4uwn01Fgmb8uYuQf9Dep2ye0zn4spJjKZlXJNUAWuWsZoTZjyG0PJ/3knfqkF17+7a1LtM8OcRdEEAk6zvqLoRMheuVEQBcTOPodtur8PbhuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmfCUMvj6aRKG1BoCSWlKpgaNLtScvpYMiiQxr/ZT8o=;
 b=wu+og9UzsTMeDCBuXJStw9IGwNpZOiIkpIr5gU5w4dhUx/45fmdbmMeUpuRiHec4uvFzMayyxtGpYX+91PcIKeViKQRwXoLPd85cTJ8d4JTm38NYyOPVFCojRDTp1/96iNdQDKjd+Ps6+3ytaKZog985C8VVGpMta+5zcvSbDf0=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MW4PR10MB5728.namprd10.prod.outlook.com (2603:10b6:303:18e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 15:29:48 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Wed, 14 May 2025
 15:29:48 +0000
Date: Wed, 14 May 2025 16:29:46 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>, willy@infradead.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: madvise: make MADV_NOHUGEPAGE a no-op if !THP
Message-ID: <90bfbe27-ba24-4f18-9f94-fb58ecc03586@lucifer.local>
References: <20250508-madvise-nohugepage-noop-without-thp-v1-1-e7ceffb197f3@kuka.com>
 <3ed9ff7f-d360-4bca-9805-b70cf51cb023@lucifer.local>
 <106c0d2c-7492-4a81-969c-de4f1798586c@kuka.com>
 <2766e825-4a45-47b9-8544-95a427123547@os.amperecomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2766e825-4a45-47b9-8544-95a427123547@os.amperecomputing.com>
X-ClientProxiedBy: LO4P123CA0350.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MW4PR10MB5728:EE_
X-MS-Office365-Filtering-Correlation-Id: 15d4e6d0-d05e-493e-f600-08dd92fc2984
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UkdSd2ZuUlNETU83cFo1dWdHRERtd2piK2xpd2l5eENXRGlHRU5EMkJxQm1H?=
 =?utf-8?B?MHkzOUZZRGhPdGtRWkFYbHVZMFZuMGo3K3hxdVozYVBhR0ExdStyVWNnbU12?=
 =?utf-8?B?RnVBbXBLTUJOR2FienlUcENYc3Z4MjF3TXlETHBVTHBoUVMyY0tQWnpCcTRs?=
 =?utf-8?B?a0V5cUQrWmY1NkRIRjhseXlyMUF1amRnaklMaW1HcS9sVlBEcWlVUHZiUWx5?=
 =?utf-8?B?K0Z6aERIUktyNWNvc0pLaFQ5MURCNlVlUTBvV1BMd2xUczMrTysyZTRoVHN5?=
 =?utf-8?B?bG9ESTF5LzdLRmN5dnBBWGFVSVYvOTd1UVFmbm1Cbmw1M0ppWC9sUE1iL0RX?=
 =?utf-8?B?TVB3QVpFNndjN2lWNHl1OGFaQ0dYU3FTNmJzVjJ3MENSdnhxN1BhNEN3YW0y?=
 =?utf-8?B?VDNZbHpRVjZVcFFnOXNUMklVbjB3SThqZUwzUHlQcStzU2FCYW50QjAwOEpl?=
 =?utf-8?B?MGIwWGo3K1h1T204cTlCM1ZvYlFUTVpuWHhBK0NucE1YQTVCNzQvVzFlcXhF?=
 =?utf-8?B?a0JoV2xQb21HNi9aRWNNdHd5Uld2RFpZZjNUZ0s1b0phbFNXRUdxeHNRNW1k?=
 =?utf-8?B?aDBPMkVEbytua2dMK1JWcVRoSUI1ZjRXVTR4TEl0VVVHZnZkU3huc2ppMkk1?=
 =?utf-8?B?NGpRbWpmU3lVcFhPdGZHSHNrRGtkMUE5elRBaDBudmRqTmdlOVdwYWZ5eWZX?=
 =?utf-8?B?Z3lEU1FtcE5zR3FEdlZSMHJTU01tS1Ezd01kNWJ5OVNhWnlaOVV0UmRPMURQ?=
 =?utf-8?B?MVNScFd6TkkvVjd3MVIrcmFSUVFVVGRtT09qQUpEUnRCckthOGpQZ1R6SVRK?=
 =?utf-8?B?M01jdlVDUmZLRm9IR2ZuODZ3aFIzb0ZKMkhLNTBXRDJHKzRCTkRwN0pyRlZl?=
 =?utf-8?B?MDVrM2l1dTdwcjh0bWJSa3A4UXlyMUZCMUFKYkI1RlpiZ2JCN0FEbmJ3VXNv?=
 =?utf-8?B?MGIvbzZzUEJZWTBqWjIvWjYyT1dTc3JEZFVja1pCMlkvT2U3ckhkVFUxZjRZ?=
 =?utf-8?B?NmJQKzNoV2x2a0cweTYyN2FzbmZWbUtsc0hYU2R6dFVkT2F4NmFhL3YvbmhS?=
 =?utf-8?B?Q0xneHl3ZkZWS1o4KzFoTzh4N2p5cUJVdWNLenUwYnJFaG9pRnBpaFg4MTls?=
 =?utf-8?B?Unl6dTVPVjVweHhoWHZ6Y3Q4WkZqSDRHcnQxTE9vR3Z0ZWpJYUFEZnZTdDNT?=
 =?utf-8?B?NDVsMksrQWw4eWdqMWdubmJpbHZoZUthVE8xblg3RFQ3aUhES0NRVFcyeGdw?=
 =?utf-8?B?NjJIeFFwRlBkRVdrNGlVUmY1WDdpQ2prS0RqeTh6UEdCTnBPS3RxOUZUYk91?=
 =?utf-8?B?bktDSGdzSU9mdThlSFhHWHF0aE13TEUrWnIxK2ppZnJvcFlHL1Q0ZnlzQ0lq?=
 =?utf-8?B?dWdQblFKOWZoREZUZzVmeU43Q29RQkZNY0h6YnNxWXF6R0tENG5OcGpoK0hq?=
 =?utf-8?B?T1p6ZWJBbWc0T1p5aEF1NjdBcVVkNVlEalFpd0lyd21wajE1WkM2M0o4ZHYr?=
 =?utf-8?B?a25nTERhNk5jZmkrSlFRK2JDMGZENnJWT3Nnck5velVJZGV2bk0rWDR0S2JS?=
 =?utf-8?B?ekhFbnFmMmhrRXluVXRUNUhWb0t1MVpudk9TamVnRXI1eFVxVmxzQjZyOUNj?=
 =?utf-8?B?LzhSdVMydDNyRzB1UEc3N0J3eEljMU5wVC9nK0g0ams5S3dRSW11MElXK3Vy?=
 =?utf-8?B?MWs3cFBERG5vU3U0WXFpalBDWHVTNWF3VFlMWGg0Mmg1LytKb1kvUWJiM1NH?=
 =?utf-8?B?MEJMY2RueHV0cnR1cXNXSmxzTGNXK3VadERIVGdwSGVBNWdBNHhFdS9JL0M1?=
 =?utf-8?Q?EW0hF4nuUsbN6cP4LxewJuCNIl3gjSgJ5MpvI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWI1STRwZ0VZUCt4czBmb3ZnUlpORk1SZys4emF1dUFFb1ZWanlUZHgyZEh5?=
 =?utf-8?B?RC83clBJQmYzRHJTSnJ5K2tCL3BjSWlaTWo5UWNqbFRFTit3bGJBdGxlRWxE?=
 =?utf-8?B?TWgvaFpVVEZMdEJqVE5zczdVUDdaSktCendKRUx4d2orVFdRTzE1YjRDK3dT?=
 =?utf-8?B?Z3BSbW5uS2RLNEdOZ0VEcmhnWGtQSGlMSXdCVTdWRFBYYUJ4RmxwZ2Urc2RB?=
 =?utf-8?B?TUVOV0QyeDlHWDhaeUtYRStuSUJrbW14UW5HejNWd1JVSEZlZ1c2bG5GNjlq?=
 =?utf-8?B?K0xBU09Pdk1lYW1PSTEvNUh5ZlR5UlUySmxvWnFIcGhSS2NiQWhkYTNHZ0py?=
 =?utf-8?B?VFB2Sm93bURuUGZvbk1aaUtHMVFYYllBZXZ3dXRYemppenF4ZWZaNTVSNVlF?=
 =?utf-8?B?ekJSaGR3OURVRmNOamQwVlZSbHY3a3RHVjVzNXpMeGNPYThGZHNDK3RNRytV?=
 =?utf-8?B?WnRUY2dVd3RqZW1zZGlOSWpWVVVQQUQvMEFkQk9yU0Z3bXdhR0ZVSk84dzFl?=
 =?utf-8?B?ekNUbHphWW55cTVCU1J5VWhDSWI1ZEh2VGlMY0VTczl1VmEweFlCd3E3TzRX?=
 =?utf-8?B?VmdsVTZ2ZkFLS3RXd0lrRzdkRnZBeXo4SG00cUZkUUlRWlMwNWdEb3ZFcndy?=
 =?utf-8?B?ckp0RE5WcnRHOWdzNS9SYTM3QmtpQmhvZ1hKWU0vbFcxQW1aWXVkUlYxa1N5?=
 =?utf-8?B?QlpwUDBBcnF4ZnNqMisvZTE5dmNBWUFreU5BVUx2eDdNbEF0K29WR0o2cWFo?=
 =?utf-8?B?QzI4Qm45UTBqTml3T08wKzRTSjN6YjVwTFcvYUFxQ3JxVkVzSGNpMnAycWpu?=
 =?utf-8?B?b3cwMjhxYnNoZEc0T0tBQjlqdEtLcnZjR0xvd0lQNTJHUzg0TGJIVWhKbW5R?=
 =?utf-8?B?TVdob1E0a0NLdlU2YTY4dE51QkErMFkxNk8rQWNWNW4zVlZGZjhwRzVCRHRV?=
 =?utf-8?B?anVBQ1hVKzlpL0hmdWZjOXNzSXNubENGTzRhNU9wWVhTbUZZYXRsdmNZWnp1?=
 =?utf-8?B?N2NZK05IUVU1bnZGZlF0UEFwZmx5RlZMLzhvS212OGI5Y1B0WnF1N2lRMzJu?=
 =?utf-8?B?b2x2U2svd3FMYmtDdmhFa2RHeWp5VFV4TGVqNHNCVCtrZEVyQmg0SXdNTmMr?=
 =?utf-8?B?RXRsQzhTbGZ0bHhQbm5kR0w2YXdZayt5cGdHMWdoTmQxNlA3MEIwZlNhRHFh?=
 =?utf-8?B?akxKTGZGblhkWGJ0dFpPbFppY1hzTnV5bzEva0x6TzlNYjV6ZnJaelFycm5Q?=
 =?utf-8?B?RHVRU1VvbWN6SGNaK1FETmZYM1hCNi9RZU5NYjRVd2wyZjF0Z1VSUEt0S1Fo?=
 =?utf-8?B?eGxKS2ZQZVdCaFk5K09aaGMxWHd2QWF4ZVg2VzFHUzBYa0k2L1UzdGRXUWpP?=
 =?utf-8?B?Rm9IZmdCOVhvVTJ2RnU4NzdZR3dJamdMbUJmUHZTZndPUFJ2bmVMaUNlVG9O?=
 =?utf-8?B?T3RpOVR6OWcrcGExOFk0SzRpcDlnY2p2U3lWQ2dHUWdpTmxZL0tVRU9SN1pP?=
 =?utf-8?B?NnVkZEdTaDJzMjFKMGNndjJMMTZRaWFSOW1lY2huUDZDNE1ONzhZNllOUmxB?=
 =?utf-8?B?RFlpNW11dzRneHZiQU02K05Rc1NhZ25QeUNEeDh0dndDUjNmTzJJNC8wZ0xX?=
 =?utf-8?B?bCtnVm10OHQrSkRjZDBqZHN3N1ZiL2UyMWVScG1seVdBL1JBbmtJbldxdXpI?=
 =?utf-8?B?ZUtWa20xQkxiSnNBNVBNeVkwTyt4NlVhM2h3TndIbkZJeE5WaUYxc3FUQkVm?=
 =?utf-8?B?YXpqSUpNbjYrYXE5cDhUVzVEUEYvQ2FMUFFwVGtVSmkyNDFiTmNsREpvMWZB?=
 =?utf-8?B?dlloaWJYWFhDQWJtRzRtRFFDZVAxZXlFck9LS0tPSUgvVGRiNVA4dXljRXlv?=
 =?utf-8?B?V05ONlI2RGpUWGpNMHluL2dJaU1idXJNVmY1WERZeUJsYjdQU1Z1NjQ3MDFR?=
 =?utf-8?B?OSsxbGxQQnZHb0doSTJwTjJ0ckhiaG9mUFhBa1h1ekMyWmNBR3JOS3FNeFMx?=
 =?utf-8?B?VW9LYUNPenVYTWZIYktPS2RVMzNyNUU0SS9SNEp1c0FQZFNKQklyV1dvcU9w?=
 =?utf-8?B?VW5GWEJzcnlvVFpSVXl2NEIrSlZEWUF6QktCb2krSzJ2RkNjYmVZRTdWQXgv?=
 =?utf-8?B?ODZwN1ZMMHVmbWZ4SVZ1OGdUdVRXbnBUd1RmdGNqNGdGUzZDMHNCMjBoRFdK?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sTmrt+G/ZeWTAcJ2bpIf/68iUfKc3Z4SvkNmbVXLPpTiC8sw8dy6JfKRRbtyPTGk4d197eVLbX1AFEZ13TPxsPXSx0TuW12w7PNq2XomJ+ECzkmH/xqQPtqX+Bsz+bVbELlJN/8xJwJqMOY2g9uvAtYhjQpLJ6ZFqY5C4yZgv5gMcRENMsFEK1w93qkjxIfUJ90wJ5XijzdxDepqDcQKYe8N7od72RbFRijmsDPDbYctpA49E/wcFN+K1Mgce373cda+T5taIuqeH/4p6nJh23dtp9CcxYWAzoGG0eTNMmJg+JTi4gmV7geBdOJUCLm4VsQuxco1veX/EIJLmRPtNCVevJiXDvrnjNJz2Ad4U2+v+WAPeg0mmw98wfPpmfnY+AidUp1fYu7I9UMZi/y1xYCPtKPpNRDT9yPmSJF4S8gIAVV9FnEihD2r7EtP/uTQU3FY9JRc87lfIR+MJ7jvlMrakKutadBVS/uWT9d56t55LGX1GdcAw8d3RTx/YpWOKGbhD71IqplKVCk3+pbUWImGee4paMz+WsD3Qadvz+RnnSJQnBGBLQWbj/8uG/tlQn5jLZQJRFoFKzNDnuEFXGwAP7cwzO01RJl/0b7Ku+8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d4e6d0-d05e-493e-f600-08dd92fc2984
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 15:29:48.3227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rF7JCqcHPqLqfn7nywpcnsTK9mWrXQ1/WnXbR82mksU+ZDXn5a+Zn+WnRWZh3Q2qh2daOFFgS5oeDve1xE6B3e/wqGeD0tpfet0IcO+ZKDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5728
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=855
 mlxscore=0 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505070000 definitions=main-2505140139
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDEzOCBTYWx0ZWRfX8qaUTTQv06E1 Fuv7XI8TpBZ49RirkbPZC9/XwTABFjxviWm9tkBbZHR8fvieTdoWBqe9AUy2+u1fr0qQ9dNKW8G yTYP+sEc5BknkOUPtU/fYBnUWdj0yHYAS3A9OSZ94PuzI2DAEQdv5mKx0f4QN9wgy7Wf+k8aoB5
 Tc4cKQm0/oYB/KgZ/acwThw98lhgC5ROml1f6Fe6tkzBOpKTlCP/mIq1DTBaEhbelnz1teCJGTj F8mSuvOz1SACcSQEEERHe/PFvz3jdSdnVaGy2UB0+IizCXBw/aAS3P4Tz53E6EjD7nF6jc3Icls Xqq9WRneiuVs0QwBErX89+rJvLdnVar1UOP2dIzkxVmynutacBNONX/LG2rc5VDHRH+mAnpW8Rb
 ZgjEyv6xQMnDOLMswTsco1ECu5sT+ghfFy7xgJ9z1h/AM0CFgLSvEe88oID1aPcOoNfvEoc7
X-Authority-Analysis: v=2.4 cv=Y8T4sgeN c=1 sm=1 tr=0 ts=6824b6f2 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=gmnTJuSF_3ZVXbMjnKkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: AUWyLZH3VlAviV1J7FobMnaIXBNVuycS
X-Proofpoint-ORIG-GUID: AUWyLZH3VlAviV1J7FobMnaIXBNVuycS

On Wed, May 14, 2025 at 08:25:05AM -0700, Yang Shi wrote:
>
>
> On 5/14/25 8:07 AM, Ignacio Moreno Gonzalez wrote:
> > On 5/14/2025 3:52 PM, Lorenzo Stoakes wrote:
> >
> > > I have pinged s390 people on there, but I don't think this is going to make this
> > > cycle given we will probably need to coordinate with them to fix up this enum
> > > name (which seems the best solution to me!...)
> > They answered that it would be ok for them to do a quick fix over the mm tree:
> >
> > https://lore.kernel.org/linux-mm/6f8f3780-902b-49d4-a766-ea2e1a8f85ea@linux.ibm.com/
> >
> >
> > > > +#include <uapi/asm/mman.h>
> > > Also this should be linux/mman.h I believe, sorry for not catching first time round...!
> > >
> > Including linux/mman.h leads to a compilation error:
> >
> > ../include/linux/huge_mm.h:601:23: error: ‘MADV_NOHUGEPAGE’
> >
> > Including uapi/linux/mman.h works, but I am not sure if that is correct.
>
> Is this build on x86? I actually tried this on my arm64 build before I
> suggested uapi/asm/mman.h. But I saw a lot of compilation errors, like:
>
> In file included from ./include/linux/memcontrol.h:22,
>                  from ./include/linux/swap.h:9,
>                  from ./include/linux/userfaultfd_k.h:18,
>                  from ./include/linux/hugetlb.h:16,
>                  from ./arch/arm64/include/asm/mman.h:10,
>                  from ./include/uapi/linux/mman.h:5,
>                  from ./include/linux/huge_mm.h:512,
>                  from ./include/linux/mm.h:1238,
>                  from ./include/linux/memblock.h:12,
>                  from ./arch/arm64/include/asm/acpi.h:14,
>                  from ./include/acpi/acpi_io.h:7,
>                  from ./include/linux/acpi.h:39,
>                  from ./include/acpi/apei.h:9,
>                  from ./include/acpi/ghes.h:5,
>                  from ./include/linux/arm_sdei.h:8,
>                  from arch/arm64/kernel/asm-offsets.c:10:
> ./include/linux/vmstat.h: In function ‘__zone_stat_mod_folio’:
> ./include/linux/vmstat.h:414:31: error: implicit declaration of function
> ‘folio_zone’; did you mean ‘folio_zonenum’?
> [-Wimplicit-function-declaration]
>   414 |         __mod_zone_page_state(folio_zone(folio), item, nr);
>       |                               ^~~~~~~~~~
>       |                               folio_zonenum
> ./include/linux/vmstat.h:414:31: error: passing argument 1 of
> ‘__mod_zone_page_state’ makes pointer from integer without a cast
> [-Wint-conversion]
>   414 |         __mod_zone_page_state(folio_zone(folio), item, nr);
>       |                               ^~~~~~~~~~~~~~~~~
>       |                               |
>       |                               int
> ./include/linux/vmstat.h:273:28: note: expected ‘struct zone *’ but argument
> is of type ‘int’
>   273 | void __mod_zone_page_state(struct zone *, enum zone_stat_item item,
> long);
>       |                            ^~~~~~~~~~~~~
> ./include/linux/vmstat.h: In function ‘__zone_stat_add_folio’:
> ./include/linux/vmstat.h:420:56: error: implicit declaration of function
> ‘folio_nr_pages’; did you mean ‘folio_page’?
> [-Wimplicit-function-declaration]
>   420 |         __mod_zone_page_state(folio_zone(folio), item,
> folio_nr_pages(folio));
>       | ^~~~~~~~~~~~~~
>
>
> The build used default Fedora kernel config with THP disabled and v6.15-rc6
> kernel.

Yeah I suspect this is because of circular dependencies as I mentioned in reply
to Ignacio :) Sorry I missed you'd suggested it Yang, you were right to do so :)

You can see mm.h -> huge_mm.h there so it does seem to be same thing.

C headers are a source of many sighs.

>
> >
> >
>
