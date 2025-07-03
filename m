Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6800B2DE70F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 20:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751574867; cv=fail; b=IVPgSLRchogPf/AzENW69pVUNwbjtsRCoD32sL39+QWRc/QPXxBEUZkD7R/JoGVZLONJyNMyIeSXoLJZ6kMWs/HUIjIFbmsoGUpbBA5ooujTzUd92n0/sHEW30FKmUCq/Gg2DEgCMHShtVZHMrbxAe4ux0sAlWdSAejP+3Fx5Io=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751574867; c=relaxed/simple;
	bh=dwByFiDwJXdNA29pUgB3mCmQ72DMf/MRyPhMvMNZY9o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OH/JFXv5b1SXqbc+oc93Dgfk4AzQ6ZJkstPOmg1v/DEreMosd5WCxwiX3vpduyQlPEG5cJKGwCLtnlNULbOoDYN17JtarYwxSD5sv7VbFGa6EvNEPdwdJNvISH6oBLu6ZU9lYYaHHWr7JgBYH4N3S7pAfzquhkAfsn89ZsPV6Ek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Rr2NGdG3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DfeaYlN9; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Rr2NGdG3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DfeaYlN9"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563HZ6iQ027897;
	Thu, 3 Jul 2025 20:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=dwByFiDwJXdNA29pUgB3mCmQ72DMf/MRyPhMvMNZY9o=; b=
	Rr2NGdG3IZW73V3MAHz3/z1zGhbABAhySe/UzpdSvveXVHv5RhxYXV+UUdaN2Vje
	2Ryj0hdb8RIuF4GxiGcHDRVyQEjHjkekYMIF5b2dU6NN+d8XddLKsQfsYk8wk3wP
	G34XnWIhOO210Y4Bs9+1imS6IaJgHX3p6K53SKec+ByA1ssF5srmNMTAHOLGjgtO
	MT6soUBLVjCf0HrbypmtZGkwlWji++CwTZ9ywPNiNVOhZMnOlN2T7Ime2TVEk7Ra
	h5Su7S+2Uc9KQLUDX7HgITJbCo3IW77yx9yIQOxGYP9tDFZqVZNgpOxU4JJBpE6Q
	2lb6EDhfi55Vnl2cGMV8HA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j8xx9s5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 20:34:22 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 563IpqrI015086;
	Thu, 3 Jul 2025 20:34:21 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ucuvbh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Jul 2025 20:34:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBSHHon4cGGMWk7e2rHqzKF8Qzsn0hTXXgU0bLD8HgYcajyCdk/3vq0Ns2sQ/xE1EkcdwtLrA48WRDcChUnp9cejVc9ls6QHohnUdOfZYi/kgNmqEFYbkm3D7yRneil+hdEF637+9h3ravyNAtAoM4AuRes453bnWl0mfBuxGbC6Pkxn9BiwsSmNAX3fgFrXcDvoP3JV7S2BNj6MmLrEx9y8PUok8RgOTqxAnLll3td8DCdb099r7Jh3lc77cvZgqSuru0iE/uA3l+W5JZc7m20DcX5nk3sq3G080WHotFYxI9QsWhVTcHB3wuayLpjUNFlyXshUEJiXBKe9eDYPKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwByFiDwJXdNA29pUgB3mCmQ72DMf/MRyPhMvMNZY9o=;
 b=R9F83LBEZwXHTuMi2mRQIhZdYuVPop75UvEunPFq7LtPR/hr07L7VdykbxNNmhqNz7Wh29Ih61Th7MemPVcwLhfWnxH5DrkR7d7Acw81VkXjO2GwiOeSproQ4OTMK0NE4l6pkxFPcZPdmD5hZat9otFZ0q8CwtzveF6qRLC9EteFms6WEgrN42ImTVj+b89dzYhHU2euu9oiWWJQ6MNYP1X8RYpKbooWtig3/4TQ1Ictdu9rulTVwPgQKdWm6S1aM5KWejPu2DPfIG805pXexz1BBcXM2WVlbzg2i5RRLGc3QngSjrP5xd8ALrWfig3OBtMYuNKopCDvXOFrTp0EVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dwByFiDwJXdNA29pUgB3mCmQ72DMf/MRyPhMvMNZY9o=;
 b=DfeaYlN9fnj1ZN4FPBHJ4cileHG7kmUyS11VpptuJVvPIxHz73u+TTw9mf/ScIbb3NtpY/4fkVR9HR0moxtrT6AGJVK68ACSB4GSLYsWa8pL8+weYhVMSF5AnTkEhdnwjA8grHDKoQ0aKBKC8pQLaA6DpbXBDY7A8JkT7DP47FU=
Received: from CH3PR10MB7959.namprd10.prod.outlook.com (2603:10b6:610:1c1::12)
 by SJ0PR10MB6301.namprd10.prod.outlook.com (2603:10b6:a03:44d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Thu, 3 Jul
 2025 20:34:19 +0000
Received: from CH3PR10MB7959.namprd10.prod.outlook.com
 ([fe80::2c43:cb5d:a02c:dbc2]) by CH3PR10MB7959.namprd10.prod.outlook.com
 ([fe80::2c43:cb5d:a02c:dbc2%6]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 20:34:19 +0000
From: Himanshu Madhani <himanshu.madhani@oracle.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: System hang with latest kernel v6.16.0-rc1 (rc2 & rc3)
Thread-Topic: System hang with latest kernel v6.16.0-rc1 (rc2 & rc3)
Thread-Index: AQHb7Egs2PQz7VeLRkyZBjMQA4nLOLQguOoAgAAepYCAAANvAA==
Date: Thu, 3 Jul 2025 20:34:18 +0000
Message-ID: <85A10B5D-67E5-44F5-886F-CA9D5E7EBFAF@oracle.com>
References: <ABB1DAF0-048A-4373-9007-988D20F359DD@oracle.com>
 <7279DC28-17BF-4A28-96ED-7AE9857BC2E3@oracle.com> <87a55lt48k.ffs@tglx>
In-Reply-To: <87a55lt48k.ffs@tglx>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR10MB7959:EE_|SJ0PR10MB6301:EE_
x-ms-office365-filtering-correlation-id: 69c85791-e6e9-4a09-a21a-08ddba70fc69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Ni96RE9XQ2ZkaTZIYjZNUUtPZDFReHV5SFI5cHZKVHZib0RsTU42SUMrRUN2?=
 =?utf-8?B?aXlhNEFMWktxMkEyWmJGa0lJNDRxZEFoMk9DVHR2Y0lrZEQzWGdKYSt3aHQy?=
 =?utf-8?B?SFp0d1dmbi9xdzQyQWtuWTlXaDdmK0I1VVhwdjEyKysxWmhFMFkxREM5dkRx?=
 =?utf-8?B?dTg5WjlYMEUwRXhlWm4vaDJjYlBYcGdyai9RVUJHaFhJeURSM3NCZ3NCcUFT?=
 =?utf-8?B?V0ZjcXFKbks5RGM0TEhlT1BlalBNbVkwaUNFUGZVMEdZSFZSYkR1b0crRHph?=
 =?utf-8?B?b29PYUpab2lFRE4xUys3aVBvdDBsa09nZTBNVFZlRkx1SGMwOXZWM0dicnVS?=
 =?utf-8?B?RFh4b2tTUkpRSVlpNktHcm1tUmQ2bVlDbUZIWmxKdEcwMFpCaWt2aVltTmJv?=
 =?utf-8?B?eGVqdFFUMnB1cU9neU1oaTUycitsWnVxaW1KZHZPVFpnWG5hV2JaWlVvM3Y5?=
 =?utf-8?B?WlEzMmpjb0RHN3RKcFBqY3BIaS9JaEdNK3FOZVVkNFZVZ1dhYnhaOGdVZ3M1?=
 =?utf-8?B?cjU4NkRuMktQc1g3aS84NncwakZobFkyUkhMOFZGaHZQSGFvUkFTMGhMOEZN?=
 =?utf-8?B?eDZsc1dyMlYvQXk3ZlMxeUc0TnNJQmloK2NxZ1hxYWFydW9GcGhLb2RhQWls?=
 =?utf-8?B?czlESjVGYkhteTJ1OVYvTWJtdFhsUHVRQzFUMU03TjFYVHI4eXdHRkFyNzJC?=
 =?utf-8?B?SllDUkx3NXZsRmVzbGxIbEF6cml1aE5hSmhjVUtHaEd3b0ExMitTL2Y0TVps?=
 =?utf-8?B?dGN4ZUhmZld5OVFoaWxHQ1B5WXlFYXNSY3luTDVLOVllams0TXduOEt1UE1N?=
 =?utf-8?B?aitYU2hxKzBVMFRXdytpVDNmRHNiY3hESVBLUEJydjVyWGRISFAxWUpBbHA2?=
 =?utf-8?B?T3Y2enJuQWpNTjkvc0hta3E3VTRlN2xtNCtUaTBUWmd3cGNyQzJLYy81amh1?=
 =?utf-8?B?RFhRQmxPMmlsQTI2bHdMa2pGeEM0cUUrVk1Ya0VETmNWZms1THpPdVhZTS96?=
 =?utf-8?B?RjhGUmkzUzRMNGNJZklITllQdXFiNkhXMUxHZW5rcmpyRDZkRXFLbksrU0J2?=
 =?utf-8?B?bVUvQTdJdzJXemRVMWtVdjgrWm00RUhwY2pmRG5tL3FWUG9vY3VCb1REQnhs?=
 =?utf-8?B?blEwclJ3a1dHRkc0cEgxWG5ZMVVaRnRzNVk4OEJHVDBxNXFqQ2hYcnhUUUJX?=
 =?utf-8?B?NkMxdDVheE80eXhTY1Z1YUwxWTNlUTlmZkpGd2dLdXBJYytoOHFkT0wweitT?=
 =?utf-8?B?ci9hUHlVbnBEOVlmbW1RTmEwOSsyNHQ0VGJRekwyRUtpRmlORy9EMTJoU2Rh?=
 =?utf-8?B?RmdXVjQvOTU1M01pWm5KMk9HN3JiVHI1TjkyRXpDMUpHeDVXTGIzVStuQkty?=
 =?utf-8?B?ODdoT0w5U012Q1FMREN5S0VOdytZcGJ5TkdraHlMcnVrVElJMW16RG9VOFR2?=
 =?utf-8?B?cGxCT1l6UUtwNWErbDlmWlVDQllKMmQwdW1qa08vM1MwNnd6emZMTjIvbHVw?=
 =?utf-8?B?b0NUejc2M1NSUm9LZm9mOURBcXYxbzJXZWl5dVVZT0MzbXF3VDVkUGQvN1J5?=
 =?utf-8?B?djFEcFBZNTZVenBJOGhUQVVQeUJqZlJHa1dxOTBNWVZyUjBqQkNvcHM3WXI4?=
 =?utf-8?B?SWgyZFU1OHRjVlcvak1xNUI4THhsc1l1Q0dseTM4TmRNenJOWTJRZzZ0Tmhu?=
 =?utf-8?B?NlhpeXhTVTJndUhGbFpqMXNTdjduTEJiS09nMHBVS253NmcrZTJFMkVEVUdS?=
 =?utf-8?B?R3ZJVTNaUmJMUjFNS01lOG5ENXF3QVpydTlMVXdLQVhxNlJwTUZMZVdNWWxN?=
 =?utf-8?B?U2d5NC9BMzNVdnFmL0Y2cjdZaVM0SG1TbFVzUTh6MzFoSndsSTNHK3R4STJm?=
 =?utf-8?B?TEF5YTlYeWtQVTNXaVlDR1FRT2hiMDVaWjI0M0FqT1dBWVBmUXBGelRoS0ti?=
 =?utf-8?B?WTcyNDJ3RjNmRm4rZmlDazdmdkRsdUtESHhsSXNwanMyUTkwdFdHV3Zsb0FJ?=
 =?utf-8?Q?fbQ0KoV2vy+bXjp0plrW7X9ESEEaOE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7959.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bkhDNjFRUlVVeTVZdVlIczZlSG1ScDN6Q0xCM0dOMTZNSE12b1o2UFQyL09s?=
 =?utf-8?B?L0toV2lUZXB5dDRFS1NtOElUMm5GMnYxRjFlak0yUkRVMzdaekxrWEJKd29z?=
 =?utf-8?B?bVZNL1N3eWw0RVAvcWdwV1k2MlZmNEh6ZkZVb2ZiYWEzS1UwaE1Tc216NHNn?=
 =?utf-8?B?THBXL3F0NWlPNVU1QWZQZmMxbVFrUGJPS21JVlJEbmlEL2xNTG1ncG1mZzNv?=
 =?utf-8?B?TnZuUU9QclJLL0E2eG5GY0I5Nzc5ejhiOVRBZ1hGeER4dThRSUYwU3pNb3Jz?=
 =?utf-8?B?ZDJMdWczSWE4ckVnVnRVZWRVekhPV3VrUm1vVW9haUpaQm5rcXpnLzZsd3o2?=
 =?utf-8?B?NGZuZmU5L0hpNVphTmloR1JqazdOSU9rMndFcXExYlpJZlJ6cmw5akd2Mm02?=
 =?utf-8?B?Z0dSeDJDTVBsM25nbXFxaUcxVWNQeVM1V2FpUGp5S0dHU3kydW8zOWllSnNH?=
 =?utf-8?B?cUgzWlZtMXIvb2ZOTFNTeTkwSEwzNnBObjgyT2dpdzlzYk9IWXhuRGlMeHZu?=
 =?utf-8?B?bjhQbUxYZVF0MzNBT1BlTEUvZGhtY0hxWFZoUUEwanQ5VGttT2gxZjg1RXZU?=
 =?utf-8?B?VUUrc3N1Mzgzc0RvMVJibGsyNGhPTytYQm5VcFc0SmUzRVAyY3lUTjBmbUlH?=
 =?utf-8?B?alJKLzI2R09LWlBWQWVEVUxFQU1LbDc5SDNLUEpMaktESjlGRGlJR1VPTngz?=
 =?utf-8?B?WVRYV1RLcDduM2xSeTJoTFpYOUlLa1VMSEpNWmY5WEMyTFJ2alpqMTJxcnZh?=
 =?utf-8?B?dHFHL1RVd1FXdWFka2l6bERKWW5PejAvYUxvLzRZY0VQd2NnLzBDL3Q0UXEw?=
 =?utf-8?B?eXVaWnZNKzhxeHdJbnRhQ0paMU84Zi9nNVpEVk5PZ1F6ejhZVmo1Z3JYYnpJ?=
 =?utf-8?B?STVFTEx5UWtHOVJEOGhFZStUNm0zVFAzUE5zM3EwU3ArSHZoc0hmVUZJZGY0?=
 =?utf-8?B?L1crcHh4UkpUY3dRK0M1S1h3eFk3UEswcFJWbjZsekhTTlJXQzZFNVBvcGZD?=
 =?utf-8?B?MC9WbjE3ZzN4b3VKSnJ3dkZ3Zzg2d2p2czNqUEoydnRBSUxOYm4yTmtVcjRp?=
 =?utf-8?B?SFZsZ2dBNU1RZmNQUWFZbDZTRDlzWFJtSkFjandYN2xWblQ4SHI5MGwvdzFk?=
 =?utf-8?B?RndseDVvZFVBRGMzaC9jM3p0Q1FNRU42cXdhbE9LcVB0OTBTTWE3MGpPQzdh?=
 =?utf-8?B?eHRvbm5VMXVISkxzMUNydnhJczRQUEp2cmN2aEtaSzZLOEtnY0RzeWRTak5O?=
 =?utf-8?B?Rk9tOXp6UTJ3KzQzNjVIQnRna0R4N3F6b0dRcERhTWl0L1J2cnhDWTllODJ3?=
 =?utf-8?B?RFNyTFJFd21ZNWxpM0I2UXFHcTd4emd2WWZFUGdubWFmMVlOb0JydXZEWEZu?=
 =?utf-8?B?dElRVS9zUzJkam9mdHZXTzVZcEljcjVaUjYyL2RwdEFMY0dHVlFmajk0NW5v?=
 =?utf-8?B?OCs4ZkhDU1lGVU9OQXJZUXl3RlpIcHA5eWl6ellyUnVHNE9vUW45OXBKYStS?=
 =?utf-8?B?NG9GUWtzMUlUNnFYQmhWNXNWYUpvc1c3bVRaRjA1eVZmOGNQVHEvODhKT0pY?=
 =?utf-8?B?VnJVZ1Q4eVIydER4U2lNdUtVSTFYaWtqRGx1akhpUkpDd3dMV0pjRHdIRGw1?=
 =?utf-8?B?SUFXeGlvUWdVMVFJZzg0SWZ5V3N6QUlucG1MMkdOSzlOTkJpOUdCZUw1dUVS?=
 =?utf-8?B?cDEzblNiWnhzQkdNK2d2TE1DQzV2SzA2TXZPbkpHWStVeW8rVDVqeUlvUXAr?=
 =?utf-8?B?Kyt5OE1Zcm1TbmN3cElhbVl0TWxvYXoxaitHMEEyTHVyM3laQWwrcDYwVy9E?=
 =?utf-8?B?MENGZ3FXQ0pnUlg4Q2U2OWJhOHJ6d04wRTRnSC9rT21UbEs5OGo4cGl3Qmkw?=
 =?utf-8?B?VU1aMFlMTkF5QllPMGx6SHVmb3E4L1FDcW00NWZ5ZWVDd0IrOXY3MHNBVGF0?=
 =?utf-8?B?VXlSckp2cCtDb09WWDllTWZpc1pTZk9ySjQ1RFFoaERFcG9LWHc3SHd6L0dV?=
 =?utf-8?B?WjJoa0dROWhiRGpWYnpYTDEvUnRmN2poQXZJL3pqZHdiOHRHUVJxcEtkS0Rm?=
 =?utf-8?B?elYxOUF3ajhiMHpIVDd0c25ZOGd0RHlWUXAyOHJRZEtrSm51T0k1NmZFb0o0?=
 =?utf-8?B?MkxBOGFCZ0liWWc2N0xuTENFc3Z0b3U1NFFkcEhxRnJGQXBXNTBIVFhQZ2Ru?=
 =?utf-8?B?RGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <29F063933814BA40BBDC78A660600126@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3rpmmtJwLcY/y8Quh2Va+qp8lC0dWj2BjEp9C9ptoqCT+5IHuHxipT8Mx6HK4mpjsG8SCsJE3VqWuV0Q2HwOLvXs0/VlBsbEAUzyeRxjwpF/2Uib9IkzKR3+OGzaTeHeeklcqWDQ3ziU0JJv1gUhLt/jOv3j7lEbc6/1wpqISz2wdxblZ8GqOoRLG1o2xLOM/YCd/CJcxiqGWDgW4a7DJTOqpMaYWn4APtijnaBcAyVBIMtSNByTGIRctUxRkRrKtC/SeGs7xpBvqvHXh1yrOSAmKTFR8b2oEtblYlJHE7Ea+sdACGQze30z/Diix5FnWr7bfnDideiizH26Q38Hfuvb5HzuBLuZIoYjKn6PuL7ujAIN3tucNclOFK4y0+Xe1SYW1E+jeZrvLrZKQ+DmoL5BUCNLnNDhZ2xly6ES7A7MtlfJfrsJwmQQLOo/7++61hqgwKwKM/ilJXPKSIfquT569KXKMGGYwkn1CcOfl2ZecKh4weFeVE0nAc/k/A1Zr7LKVMN5umGfJyuska0rz/tM3f0OO48FhSUbpdJSyWPWUoBOti/LX83D6nJiiLUo/C0gRNaaxtpYkZuqkOQIOo65b39ALrR5EOsP2J1PVig=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7959.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69c85791-e6e9-4a09-a21a-08ddba70fc69
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2025 20:34:19.0019
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BUVWkJrIZx3LmJYl1qDy67ui7gTTp7lW/xlQ9vwwnA7PvBtfCdGTEkO1gzSbvjMxCFC0Y37q9aCQ5iXSiSRCVEYfvPzN4rQ8xz6BETCEmBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6301
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_05,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507030169
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE2OSBTYWx0ZWRfX09J7K3Z5ntOu pXLFyYVDvBcbXNwHlk4Swg3e7rTb750U1pslybPTTeFX1TaSUc11jwbjTV7eX8GvYWAL5w7Wcd4 OuwO6jdK3R6m91gFwTS2WO92EUyZEAaNLR+WnzZ2XXsGRd0S0/75M3qaem9KKpFDDMvcAw6+Gqk
 E8VcUWRHRtHzEFX+WVD3WN0bxn8SyGXKUL0ciP31wusJ9jHHeQAsHell2L4cOXGKJzYCItcqrEt iEKJTFKZrd+odI6iDi2UEiyHmZZdUfM7xWA4yi9NwdyY/O8r2LaU/o0OPY3V23K7KcBzoVIYGe0 XsdX3h3sb4P66lU+op9pS+qDdXhspE9SYpP3DFY1I4zgM3X1cXhIecuI9ijGkVNGRcVVP7MeM5M
 bfYNDBJjeKrSwXKSGeLTO3cnV/uHKPmHEfiejtiVXNDuMloi3N0p1H0A2b9wh4IE2G5GA7Xz
X-Proofpoint-ORIG-GUID: eGPdSuf9SIKxggt7yYNbfYR60hGnWBZK
X-Proofpoint-GUID: eGPdSuf9SIKxggt7yYNbfYR60hGnWBZK
X-Authority-Analysis: v=2.4 cv=QfRmvtbv c=1 sm=1 tr=0 ts=6866e94e b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=Z4Rwk6OoAAAA:8 a=bywjwvyppclRIOKP1VYA:9 a=QEXdDO2ut3YA:10 a=HkZW87K1Qel5hWWM3VKY:22

DQoNCj4gT24gSnVsIDMsIDIwMjUsIGF0IDEzOjIxLCBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGlu
dXRyb25peC5kZT4gd3JvdGU6DQo+IA0KPiBPbiBUaHUsIEp1bCAwMyAyMDI1IGF0IDE4OjMyLCBI
aW1hbnNodSBNYWRoYW5pIHdyb3RlOg0KPj4gT24gSnVsIDMsIDIwMjUsIGF0IDExOjI3LCBIaW1h
bnNodSBNYWRoYW5pIDxoaW1hbnNodS5tYWRoYW5pQG9yYWNsZS5jb20+IHdyb3RlOg0KPj4gR2l0
LWJpc2VjdCBwb2ludCB0byB0aGlzIG1lcmdlIGNvbW1pdA0KPj4gDQo+PiBjb21taXQgNjM3NmMw
NzcwNjU2ZjNiZGY3ZjQxMWZhZjA2ODM3MWI2OTMyYWVjYQ0KPj4gTWVyZ2U6IDVlOGJiYjJjYWE0
ZSAyOTg1N2U2ZjRlMzANCj4+IEF1dGhvcjogTGludXMgVG9ydmFsZHMgPHRvcnZhbGRzQGxpbnV4
LWZvdW5kYXRpb24ub3JnPg0KPj4gRGF0ZTogICBUdWUgTWF5IDI3IDA5OjAxOjI2IDIwMjUgLTA3
MDANCj4+IA0KPj4gICBNZXJnZSB0YWcgJ3RpbWVycy1jbG9ja3NvdXJjZS0yMDI1LTA1LTI1JyBv
ZiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdGlwL3RpcA0K
Pj4gDQo+PiAgIFB1bGwgY2xvY2tzb3VyY2UgdXBkYXRlcyBmcm9tIFRob21hcyBHbGVpeG5lcjoN
Cj4+ICAgICJVcGRhdGVzIGZvciBjbG9ja3NvdXJjZS9jbG9ja2V2ZW50IGRyaXZlcnM6DQo+PiAN
Cj4+ICAgICAgLSBUaGUgZmluYWwgY29udmVyc2lvbiBvZiB0ZXh0IGZvcm1hdHRlZCBkZXZpY2Ug
dHJlZSBiaW5kaW5nIHRvDQo+PiAgICAgICAgc2NoZW1hcw0KPj4gDQo+PiAgICAgIC0gQSBuZXcg
ZHJpdmVyIGZvdCB0aGUgU3lzdGVtIFRpbWVyIE1vZHVsZSBvbiBTMzJHIE5YUCBTb0NzDQo+PiAN
Cj4+ICAgICAgLSBBIG5ldyBkcml2ZXIgZm90IHRoZSBFY29uZXQgSFBUIHRpbWVyDQo+PiANCj4+
ICAgICAgLSBUaGUgdXN1YWwgaW1wcm92ZW1lbnRzIGFuZCBkZXZpY2UgdHJlZSBiaW5kaW5nIHVw
ZGF0ZXMiDQo+IA0KPiBUaGF0IG9idmlvdXNseSBkb2VzIG5vdCBtYWtlIHNlbnNlLCBzbyB5b3Vy
IGJpc2VjdCBnb3Qgc2lkZSB3YXlzLg0KPiANCj4+IEZvbGxvd2luZyBmdXJ0aGVyIGluIHRoaXMg
Y29tbWl0LCBJIG9ubHkgc2VlIHRoaXMgZm9sbG93aW5nIHNlcmllcw0KPj4gdGhhdCBoYWQgY2hh
bmdlcyB3aGljaCBtYXkgb3IgbWF5IG5vdCBiZSByZWxhdGVkIHRvIGhhbmcuDQo+PiANCj4+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDQyOTA2NTMzNy4xMTczNzAwNzZAbGludXRy
b25peC5kZS8NCj4gDQo+IFRoZXkgYXJlIG5vdC4gVGhlcmUgaXMgYSBoaW50IGluIGJvdGggYmFj
a3RyYWNlczoNCj4gDQo+PiBbICA1MTQuMzA1NzE3XSAgc2NoZWR1bGVfcHJlZW1wdF9kaXNhYmxl
ZCsweDE1LzB4MzANCj4+IFsgIDUxNC4zNjA5NTRdICBfX211dGV4X2xvY2suY29uc3Rwcm9wLjAr
MHg0YmUvMHg4YTANCj4+IFsgIDUxNC40MTcyMzJdICBtc2lfZG9tYWluX2dldF92aXJxKzB4Y2Mv
MHgxMTANCj4+IFsgIDUxNC40NjcyNzldICBwY2lfbXNpeF93cml0ZV90cGhfdGFnKzB4M2MvMHgx
MDANCj4gDQo+IGFuZA0KPiANCj4+IFsgIDUyNS45MzA0NzhdICBzY2hlZHVsZV9wcmVlbXB0X2Rp
c2FibGVkKzB4MTUvMHgzMA0KPj4gWyAgNTI1Ljk4NTcxOF0gIF9fbXV0ZXhfbG9jay5jb25zdHBy
b3AuMCsweDRiZS8weDhhMA0KPj4gWyAgNTI2LjA0MTk5M10gIG1zaV9kb21haW5fZ2V0X3ZpcnEr
MHhjYy8weDExMA0KPj4gWyAgNTI2LjA5MjAzMV0gIHBjaV9tc2l4X3dyaXRlX3RwaF90YWcrMHgz
Yy8weDEwMA0KPiANCj4gcGNpX21zaXhfd3JpdGVfdHBoX3RhZygpIGlzIHRoZSBmdW5jdGlvbiB3
aGljaCBlbmRzIHVwIHRyeWluZyB0byBsb2NrDQo+IHRoZSBtdXRleCBhbmQgZ2V0cyBzdHVjay4g
VGhpcyBmdW5jdGlvbiB3YXMgaW50cm9kdWNlZCB3aXRoIGNvbW1pdA0KPiANCj4gIGQ1MTI0YTk5
NTdiMiAoIlBDSS9NU0k6IFByb3ZpZGUgYSBzYW5lIG1lY2hhbmlzbSBmb3IgVFBIIikNCj4gDQo+
IGFuZCB0aGUgc3Vic2VxdWVudCBjb21taXQNCj4gDQo+ICA3MTI5NmVhZTU4ODcgKCJQQ0kvVFBI
OiBSZXBsYWNlIHRoZSBicm9rZW4gTVNJLVggY29udHJvbCB3b3JkIHVwZGF0ZSIpDQo+IA0KPiBm
bGlwcGVkIHRoZSBUUEggY29kZSBvdmVyIHRvIHVzZSB0aGF0Lg0KPiANCj4gVGhlIHByb2JsZW0g
aXMgb2J2aW91cyBhbmQgaWYgeW91IHdvdWxkIGhhdmUgZW5hYmxlZA0KPiBDT05GSUdfUFJPVkVf
TE9DS0lORyB0aGVuIHlvdSB3b3VsZCBoYXZlIGdvdCB0aGUgcmVhc29uIHByZXNlbnRlZCBvbiBh
DQo+IHNpbHZlciB0YWJsZXQgaW4gZG1lc2cuIEkgZW5jb3VyYWdlIHlvdSB0byBkbyBzbyBuZXZl
cnRoZWxlc3MuDQo+IA0KR3JlYXQgdGlwIG9uIHRoaXMuIEnigJlsbCBrZWVwIHRoYXQgaW4gbWlu
ZCBmb3IgZnV0dXJlIGRlYnVnZ2luZyBlZmZvcnRzLiANCg0KPiBJIGRlZmluaXRlbHkgc2NyZXdl
ZCB0aGF0IG9uZSB1cCBpbiB0aGUgbW9zdCBzdHVwaWQgd2F5Lg0KPiANCj4gQXMgSSBoYWQgbm8g
aWRlYSBob3cgdG8gZXhlcmNpc2UgdGhhdCBjb2RlIHBhdGggSSBkaWQgbm90IHRlc3QgaXQuIEl0
DQo+IHNlZW1zIHRoaXMgY29kZSBpcyBub3QgcmVhbGx5IHRlc3RlZCBieSBhbnkgb2YgdGhlIENJ
IHN0dWZmIGVpdGhlcg0KPiBiZWZvcmUgaXQgaGl0cyBMaW51cyB0cmVlIGFuZCBhcyBzb21lIGZv
bGtzIHN0YXJ0IHRlc3Rpbmcgb25seSBwb3N0IHJjMQ0KPiBpdCB0YWtlcyBzb21lIHRpbWUgdG8g
c3VyZmFjZSA6KCANCj4gDQo+IFRoZSBmaXggaXMgYXMgb2J2aW91cyBhcyB0aGUgcHJvYmxlbS4g
U2VlIHVuY29tcGlsZWQgYW5kIHVudGVzdGVkIHBhdGNoDQo+IGJlbG93LiBJZiBpdCBzb2x2ZXMg
dGhlIHByb2JsZW0sIHdoaWNoIGl0IHNob3VsZCwgZmVlbCBmcmVlIHRvIHRha2UgaXQNCj4gYW5k
IGNyZWF0ZSBhIHByb3BlciBwYXRjaCB3aXRoIGNoYW5nZWxvZyBhbmQgRml4ZXMgdGFnIHlvdXJz
ZWxmIChBZGRpbmcNCj4gU3VnZ2VzdGVkLWJ5OiBUaG9tYXMgLi4uIGlzIGdvb2QgZW5vdWdoKS4g
T3RoZXJ3aXNlIGxldCBtZSBrbm93LCBhbmQgSQ0KPiB0YWtlIGNhcmUgb2YgaXQgaW4gbXkgY29w
aW91cyBzcGFyZSB0aW1lIDopDQo+IA0KDQpTdXJlLiBJ4oCZbGwgZ2V0IHRoaXMgdGVzdGluZyBp
biBvdXIgdGVzdCBiZWQgYW5kIHJlcG9ydCBiYWNrIGluIGNvdXBsZSBkYXlzLg0KDQo+IFRoYW5r
cywNCj4gDQo+ICAgICAgICB0Z2x4DQo+IC0tLQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kv
bXNpL21zaS5jIGIvZHJpdmVycy9wY2kvbXNpL21zaS5jDQo+IGluZGV4IDZlZGU1NWE3YzVlNi4u
ZWIyNmYzODE2OTIyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3BjaS9tc2kvbXNpLmMNCj4gKysr
IGIvZHJpdmVycy9wY2kvbXNpL21zaS5jDQo+IEBAIC05MzQsMTAgKzkzNCwxMSBAQCBpbnQgcGNp
X21zaXhfd3JpdGVfdHBoX3RhZyhzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50IGlu
ZGV4LCB1MTYgdGFnKQ0KPiBpZiAoIXBkZXYtPm1zaXhfZW5hYmxlZCkNCj4gcmV0dXJuIC1FTlhJ
TzsNCj4gDQo+IC0gZ3VhcmQobXNpX2Rlc2NzX2xvY2spKCZwZGV2LT5kZXYpOw0KPiB2aXJxID0g
bXNpX2dldF92aXJxKCZwZGV2LT5kZXYsIGluZGV4KTsNCj4gaWYgKCF2aXJxKQ0KPiByZXR1cm4g
LUVOWElPOw0KPiArDQo+ICsgZ3VhcmQobXNpX2Rlc2NzX2xvY2spKCZwZGV2LT5kZXYpOw0KPiAv
Kg0KPiAqIFRoaXMgaXMgYSBob3JyaWJsZSBoYWNrLCBidXQgc2hvcnQgb2YgaW1wbGVtZW50aW5n
IGEgUENJDQo+ICogc3BlY2lmaWMgaW50ZXJydXB0IGNoaXAgY2FsbGJhY2sgYW5kIGEgaHVnZSBw
aWxlIG9mDQoNCg0KDQotLSANCkhpbWFuc2h1IE1hZGhhbmkJT3JhY2xlIExpbnV4IEVuZ2luZWVy
aW5nDQoNCg==
