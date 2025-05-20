Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA26248869
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747760092; cv=fail; b=nZ079bebHCBOuhicpRWOMO83Jw7Rz1u56EIJhb14Olt6UMF/7rA47dh37EYAinwTerv70quc1yGrpj1awBSx3sWhbzZE6M7PkQOoDlBN9Z8E1rnAku59rrOHX6dy8RxXM1tArvLG5TYRc2ChYHj1BJgx8C7pa6ewkwdduJo5reg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747760092; c=relaxed/simple;
	bh=LSCZpLStpTu3mSVngNf2Lnm8xC6wi+BfAwN6bCYIiAw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kS7CXyIQxgOXEYXVD+aVgA86C/cgA+OcXJmXETz0IdsPkOOqfxkCp3nEwswY7NTdyr5Idief8AgR0ndAhZ1H50NT1JORN4G08ynzvr/vysM7bKqpH28/F5Ma1L3mZPrdypUcXNfxNDLyD7CK2BGe0exyKa3spOh5LyoWRFC1lFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mOnL9kOL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=G2o0/WyW; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mOnL9kOL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="G2o0/WyW"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGjdpg029232;
	Tue, 20 May 2025 16:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=LSCZpLStpTu3mSVngNf2Lnm8xC6wi+BfAwN6bCYIiAw=; b=
	mOnL9kOLdb6433wUhUyGI8mwW5zhZnDgCNNsnmYjt81QXLz4VUUmHLJUwQsRWOKo
	WClRGI59Y6/kMN3FyweHA/ZG6yhthFq5B/0STrhNSNaiBX/QSwWxL4tsTpg+k9Df
	620v7HJWye0UXJG73y2AClSsMgthhHzjzPGFM9lCU+F5QbHXYdrDp/9jTX9gnAxB
	eCAvuQJF/3Gp1sOF3rQ0nYqZ3dwRkmVdBczkNCwqvj77dIcZVsX4ak/0CYwbu2TN
	BLjt2TcruSPndYwgywpOlNAs8XgXVLnAE2z7o5ci/BHRBxj2SxgkZgObc4xbXkN2
	2vsLaBgLrkZJ7LflSuUJHQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46rwg8g0ve-25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 May 2025 16:54:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGcpxl024028;
	Tue, 20 May 2025 16:52:23 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013046.outbound.protection.outlook.com [40.107.201.46])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46rwem0gnh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 May 2025 16:52:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wl9fTA+YTJ+7Ix9AQ+/jWFGQSec2KMgtyhaQMB4v2S1R1g2EWKXZPGRNnPyOR0hAHDBLVqWce8W4DDZLdOwzvo2j9NWoAuXElgr0hEFiqLFg3PfxSlTCehZZWHINe3XMlnB8BFAVzLaio6sAgl5thyS5+B4MQOQqGuWzIqEVnb7v2088fGy9/S6JuLbWs5faNg/jOu1aZFHF3vIOHjRCtqcdULb4BPy48u77RH9uJmY6DzdLAM/Wuc/4rB1PUdbUnus6sJD8lYJMC0pSbv/EuB8o3/RwFXdy5y3d/Ur+y3Ud1WjR+HWU6k+oZclPzodjQuYBA53ZK7dzz+n3ViUfmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSCZpLStpTu3mSVngNf2Lnm8xC6wi+BfAwN6bCYIiAw=;
 b=eQMhyvgRfZTknkfrDbDJvmCFUppDtMwPx72n7X6yRVwKTySPbpcpg3xmVZdqHvhuuTn1Y9EPcRO+kweflHo7Bw3SPTr4lGCFfFDGIvU+14IDrN8zrwLMNxozEENYMR6htwAYkIJvR7DCOxlS7rqgifS8tUOIRyyQzQVi5Idw+1sKJX5Avv/cP4TLmr0BIa+Co4ADDuZ9Kj+5eORt3BfKjqYd7kCUT4hGp41IW5aDQ9m0OweGAvwIsXmfpawkgDwknFvpxAgCvIB97IqACze1k34ayCtKvOvVprPevVYVVYGUlonQF2v+qtkEdXDcSIvT8pr09GyuES8bx7ukHAkfOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSCZpLStpTu3mSVngNf2Lnm8xC6wi+BfAwN6bCYIiAw=;
 b=G2o0/WyWv0kSC5JzzZL+zNNjp/OjP60TlxlpBcypQ/zemqzy0zWE4Sik5iROmeqZIUsjrStwQhv4bVVnH1e9H+kf6PrQn4OZ85drcHOV2s/YMY4iNJHfifkPl/FRti/4Ktc0ImxxwbnV2voqov7VK0pUY9s11mvNgv4hgCahpqc=
Received: from IA1PR10MB7309.namprd10.prod.outlook.com (2603:10b6:208:3fe::13)
 by BLAPR10MB5186.namprd10.prod.outlook.com (2603:10b6:208:321::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 20 May
 2025 16:52:20 +0000
Received: from IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a]) by IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a%4]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 16:52:20 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: Steven Rostedt <rostedt@goodmis.org>
CC: Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
        "peterz@infradead.org"
	<peterz@infradead.org>,
        "mathieu.desnoyers@efficios.com"
	<mathieu.desnoyers@efficios.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "bigeasy@linutronix.de" <bigeasy@linutronix.de>,
        "kprateek.nayak@amd.com"
	<kprateek.nayak@amd.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V4 1/6] Sched: Scheduler time slice extension
Thread-Topic: [PATCH V4 1/6] Sched: Scheduler time slice extension
Thread-Index: AQHbxL84jkkUMQXqRUSZrCYUHipYTLPSwcGAgACkyICACF8GAA==
Date: Tue, 20 May 2025 16:52:20 +0000
Message-ID: <3EF0AA39-2C51-4E70-975C-CF8BBF27DAE4@oracle.com>
References: <20250513214554.4160454-1-prakash.sangappa@oracle.com>
 <20250513214554.4160454-2-prakash.sangappa@oracle.com>
 <ddc80d60-0cea-4e07-a4ef-fb21d5f5a0fa@linux.ibm.com>
 <E2C65493-D9C0-42E5-A8C5-091FE2394216@oracle.com>
 <20250515050159.3dbba5f5@batman.local.home>
In-Reply-To: <20250515050159.3dbba5f5@batman.local.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR10MB7309:EE_|BLAPR10MB5186:EE_
x-ms-office365-filtering-correlation-id: 6dd68d21-43db-40f3-5e93-08dd97beafda
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WmxBZEUxMzlBY053Sy9hZ1hnYnlVSkllcUhHbTRCNEhmekg5V1lzZXU3c0lu?=
 =?utf-8?B?dXpNQllObFhTM0gxZ0pHTW9ORHBOL09BVzRVM0picHdKL1NQV2FCTnFJby8z?=
 =?utf-8?B?WTRyeERvbUhZdlhmTHhLVHVSTHpZQllPZ0dBVjFLQmxHeXVRSzA5bUIveU1y?=
 =?utf-8?B?V294RDVmTkVuUXBZbjJ3RHdCNWdRR2hLK0Q2Uk1haGk3KzAraFh2ckpYTStZ?=
 =?utf-8?B?SnFsMzFSZkFDTU85OEYyQm9CWFkyT1J0TjBldTdWdjhBSklIZFpyNTN5Znlx?=
 =?utf-8?B?ZEZxWTBEQndpNzRITTUyeXBVQ083bjN1clA1NUJOYU9ySXM2WFlnMGlSdG1H?=
 =?utf-8?B?ZXZRdUd3VWMrTlc0YkVuSEcydzB1R2c3b2ZuV3JuS21EVE82cVFOU01qZGgv?=
 =?utf-8?B?dlErZVN3THpVd2MrenJITjRqVkhUZzJCV0ZvNGFCQlJtS29nLzZWYTFOTmh5?=
 =?utf-8?B?UlltQ2s4ck9EcWFYSlZlYThMMTlUVmV5STJhOExBWTJpNVJWYk5XUXFKTS8y?=
 =?utf-8?B?WWkvSVVhNFpaRW5HS2xSbXdSSU1NdmVwRTRCaWYvRk5sM2JzZUsxalo1NXJm?=
 =?utf-8?B?WlpyN0VQdDJmV3lXT2IvQ3p5cFh2a0NLY1J1KzgrOGVQS0wxTVF2S0hnOVZM?=
 =?utf-8?B?aUR1WDFtUnZpbytlSUlRMGZHZWRJOWNUTGZOSURKeU02bjJKTWJLUTRtdFJz?=
 =?utf-8?B?ZkhZWktHc21TUVhmN2VUOUFLZ2kvdHM1bXdFQk8zVTVPaE1qOWthZE40ckp5?=
 =?utf-8?B?b092K0tRblF0Z2ZXdno5cVdCNTh3VXU4ZSt6ZlJFYlRSbWZLbGZTbnBLTWtS?=
 =?utf-8?B?YmZ6Rm1iRnlma3JhQTR2M0k0T05xK0oyT2E0MXJQQjZicU0xSDFId0N3c1Na?=
 =?utf-8?B?Tng2UDRiNHFiaUpmSEpRcDcvQThaallnaG9ja2lpV05yRGxPeEtPNTc3Wkw3?=
 =?utf-8?B?aks1cHNjSHZaOWxYdFFpT21PbUdyZENMeFV3TkdvckpwRG9rUHNKNEhmT1hq?=
 =?utf-8?B?STRyc3FORWZWYWlRZ1BhNXgzemR0a0dhcldYUkk0djl6OHFhWTZEZkFvYUdD?=
 =?utf-8?B?L0FZaVpZNzBSS1R2ZlpWbVpERlpqNUpnTkVwWDBLcTJlT1ozT1VXTDJBL3lj?=
 =?utf-8?B?NUFVd3RsOFd2VVlIRlNIVXRDZ1BRaHQvMXljbW41U3A4QldhNS9NMHVOL2Nk?=
 =?utf-8?B?ZS85cCtUenBKTkZHek9yTWllL25kWE5nRFhVcXZCZGQyRDhRNGhCUlRNMVht?=
 =?utf-8?B?ZVJXMm56MUhpejdBdmZCMTNXdVNSelovRkxMV2huS3kvZ1lSekkrSGEvZlFF?=
 =?utf-8?B?MHlqVHRiRHk0WFZ5aEpranpMU2lyd2k5MHFsMEFNcnY1cHZ5UU96Z3dibDFR?=
 =?utf-8?B?aWhFbkV1WGJnZzcxS0xIMndOOGNDMUN0RkZrMitnZkFBOGtjK2lBWkRUbDht?=
 =?utf-8?B?NUowNXhPV3pTbksvRGp3cjhvNEprZmZjVEVkVUhBODhmZmxIb2puN2pDcVR5?=
 =?utf-8?B?Z2VONzlCOVAra2o3K3pJbVNuVGxBQWJQb3hVRzJIclE1NEpyZ3BkQm9Vcjdq?=
 =?utf-8?B?MStQamswdE5aUVIrMllMd3hiQ1VOUjNHY2FvZTV0Skh6Y2VLa1haRStEMUVC?=
 =?utf-8?B?cHRRaTV2SENaaGc4Y3oxZGUzaGEvOUduWExMb3VrQmJIeFA1bzVFWjRURHpB?=
 =?utf-8?B?OGRxV2FPRTBPdDV1aUE4TEw0dm1aZlJNY3hNSUFHWDN1Qnp6WGdzL3pIb253?=
 =?utf-8?B?UUJwbCtpSXFTbnF5RVFJS0FTUmtRTXBQYkJmWkpDbjZ0VVdYVTgxOGpGZU4r?=
 =?utf-8?B?RmU2RWFMVis2T2gxRWpDTFd2OVJqOFo5ZkNXVExnTVo0ck85S0ovbTRScnRM?=
 =?utf-8?B?cjJ5cWthQy9RTTZ6YzhBWW5qOXpsblM5NFpWTTYya2h3QlpLcXZvbmFETUs3?=
 =?utf-8?B?RnhZOGRyVVllcmFKUUk4YXZWa2hpVUNxSXE0NERKcjFXT3NicGNYSHFOaklu?=
 =?utf-8?B?K3I5S2tDbG13PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB7309.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Yk1SQXNNcU1UMzFXTk5UZ2RXZ0JkRjBQdndxV3JBcWdTMTN0ZHNMd2wydnRF?=
 =?utf-8?B?aUhxNUdaSjR3bUxQWnhreXdnNkJyRHdMU045ZURXZE9IcXpyOXhSUy9sZ012?=
 =?utf-8?B?SGNkU0U1RGpXZFhoQlQ2N3JEYkVtZko4bnJnRkNpc3MvTTd1d1h5NXhsYlJ0?=
 =?utf-8?B?Y3NxYjZja1pZSThxa3pRUXRpM2FKb1F1ZmRLQWJsZHpqMFNGMGRpbHBsdmN3?=
 =?utf-8?B?b043eTRGdU45Q2h0R2d4YndENUcrWXI2bUNoMlJ6bklNTTBCRTVLRzhLRDVx?=
 =?utf-8?B?MDJhaFlJbmNiUFlTVTI1RkNGVjV2THhYc2JVZ2p5Q2QydVpEZUNtcnlrZ3hr?=
 =?utf-8?B?MFIzUVBteWt0V2EzUldzRGUyYnh3WThJU3FlK0lKb1EzSm95b3dsL3RQZTNl?=
 =?utf-8?B?ZlI0MmUyQThMaHRCMnVQRlFrNlRsNW9iQjNLSW9EbVgwRUFuSVliRUM4SmFa?=
 =?utf-8?B?OHYvUHlyNERMaCtyWXJ2UWVRZm1Pcm9Gc3dJNXU3QXo3YmpKbWtrcHY1TEhP?=
 =?utf-8?B?RGFkZ2hoS1gvWGh0RkwyVmtjaDBiS1NSM1hRWjI4Z3JlcGhtdWFBN05oeitC?=
 =?utf-8?B?eVJLR3hpL25wN1Rjazd6b20xNjIvUFNHbEV2OGN4ZURvYUVQeThUb1J4dWZQ?=
 =?utf-8?B?TVZCL2lLV1BkYVVBeHJOSUo1eUxKekt1TVRxZmJzbk1KQUlRb0N3WkdpdTls?=
 =?utf-8?B?SGQ4c3RUZ0o3aEwzMk9mdEttVEl5eWVRazQrRmZPbzVyblh5UytZMmF5MW56?=
 =?utf-8?B?NkZrOEFxRmh3RTlmMHJHVzBJZG9CdXQ1TG5TUk84ZWgwVnBFZ21XYkhEMjM4?=
 =?utf-8?B?emRucUpKNlI1Z2U4cUgzUllucU55RDlLeGJBdVZ6aWxrODZwQVN1VVl1WkVY?=
 =?utf-8?B?TUt6MzFZV2JQRVNKL2VNSDdUUUQ3WTRORUxFb1ArUW1UVWJDMXhxS0FQdmhx?=
 =?utf-8?B?VWJZZTUrNjZKZ0hjck5ULy9hemV3S0ovb1RsL0VMdUZrdnRUbnpLMzJYekc1?=
 =?utf-8?B?Q0VVTWZZbGFhb1RXclh3dUxXNXBFQmlDRFZVTnB2elBSOFhYekRwbHpEczcw?=
 =?utf-8?B?L2FnSm9xeHpNS0dSd0I3UkdpeWtzQUduQ2k3N0JhOXlaRUN2WEFVb2lOanZp?=
 =?utf-8?B?SjR5bEQ2YUxkZnBwVVVQWUpsWWdncW82L3lOeVo1MGNBMlhuVGFDM0ppUFRk?=
 =?utf-8?B?QUxiSGY2bXpCL3oxcmlBbGwrZWRRbjFBcHl5bTlMcGM1SXV6SEtzUjRySXZv?=
 =?utf-8?B?b3dnM3BXU0JuS2h4dWNVMTNzam9VNSt5MjdtVDJSTjFsUU9hWk9kVFBVN2o3?=
 =?utf-8?B?Y3RtQmtCTjdZZERPSHNzdU40Mk1ya0E4NjhMbCtSVXh6WTd4aWxhdXZUa0RL?=
 =?utf-8?B?b0tLaTZzVFJ3YTZIKzhiSFRieXRxT2J1aHA0bm51dGY3REVHRHlqdXNDck9H?=
 =?utf-8?B?SkRRME1aeHFNUVRRTmhZM3ZvS3EySGp3SWF2NUZIdEtIVWJ2YUIrU3ljQVho?=
 =?utf-8?B?MHo3LzBBMDNIV0FVNmFURGVnTHdvUXdoR3FWTVdhWFZNQytJaFdtc1Q5NTg4?=
 =?utf-8?B?WncwMHFKR01pRHdMQlV0NEJMV01rSzQzYkJYWVI5NEl5QkZTS3FaUFFtdjdr?=
 =?utf-8?B?YUJZVEhOd0h4VXNzbkVtVERCckJ5QVphWFBGUStjL01lTzFxVG9pMHU2RTlZ?=
 =?utf-8?B?Q0tHY0ZYK010eFpiS3NySVRTTWJ0QnZ4WEZmbXlhajF3YTVSNjU2VGZMTE4z?=
 =?utf-8?B?MDNlcTZ2R3kydGhYQzlrem1ZMU1jcGpaRTV1LytzenA5ZVAzbFpKMHhkaVNn?=
 =?utf-8?B?b1JROE10Nis0cHpwTkJKaGpTZlAzQ2JRSHY3OWR3QXM3MWc0aVJjS2k2ZFBG?=
 =?utf-8?B?U3ZGc1ptQm5ObTd0L2VmUGZpVndUMUt5cHVZcnVzODhLdnUxcE1yS1dhZ2lq?=
 =?utf-8?B?VzgvTk5hMDR2MDFjRVdpWjdNb29KYzhWcDlBV25VcFNVWlRaZE02dUZVM0hl?=
 =?utf-8?B?SHdFMjJHQ2laNEFOdHR0MzdZVkYzSWt2T1ZuN21wdGVGaFZCQ0FEc0o1TUVW?=
 =?utf-8?B?dDNza2xwMngySGFlRTNSa3o4L3BDUC8wVE1vTVdTVnFnbldsTGtjbjdyekpD?=
 =?utf-8?B?YnVmeE5ER2hSRmNlV0hQU1NDcVBXNk5JVGZSYnJQRzNnYTJpa3hhL3MrVWg3?=
 =?utf-8?B?d3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A50CEDA829FE2849A2BD023B1F154D39@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2RQJlbWjxQrl78buZ5vP1+z/CKW1X2n5wGi5KEYdqpKwCrpnU1wuVUJR79dwQ3oYevAI9kM9Zf0xM3jLq4m9xhXS+Q61/PljfFDF2R5jg7K0fHGqBGWby304f9r5xdKXl9Gbp+FX4Dbwxvizxhek5tb34UW6O5QOwBdGFzfz8VNcUsezRmVANpvCVUwPemskLUAf1dyXWlmIYgOfCUNH/yZoKlsiVj9ZnyoAJW/5A6/GjZ50BrCZlmCFNaOpUzZd4cSb/onqZ0BXbWMn8L5nsZCfqRCGYVw6SwSR4xIMvY6/bg6h2mAmyPkDWNBu/sDw0FMw61M9ElALMoAh30p8vk9n9q2tp16F6P2/Pces/4VfQFwbF7AStTrOYtW1FiZi51ReWVa8dgOuzH22n5cKn1ydLBZ7clmdj3tqnx84cC+WULjt0cs8c/NY8wYYSlik7xzhyCwYaPeProGpuDgW2lcN5EDkJ7kf0mpDqt2PJEbY0/7A2F+S9Wo4kNXvDZQUc6rF4pCdMkGAZ0mfkrjRF8A/cL+NQ/IMhdrY2Tnbu4tWrF/uS+AaqQeEQQaUJ4e9zNQptJOrKE8oG0ywToDe8vvpJJ0HjpEokUFgjcwkznQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB7309.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd68d21-43db-40f3-5e93-08dd97beafda
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 16:52:20.6324
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nCwhjbtaMNnAMvNotzjtMGynxS2V0ucvbdUztKW02wsIEAcrSaHAxL8NytLwLmm1Y2swJJuBl6afqYROM/O7srnfgcsZWOXC1gN0TZbZFMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5186
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505200139
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE0MCBTYWx0ZWRfX6XLW4ouB+Bwd AiZ/CfhpPrP+7YHEjnOORB1Ge0+uSIFJX8YPfESAvTpUu0LG3RKjWGq+Qm1JgfiWKT7XNGvTlMq qAgk9cklqTovRnUatcc/on4vOAN1K+DDQSjbWz4x4XwtLw+rlQ/YkylYJ61vpB5PBZoOxwNudDX
 KwffCvMyLESWyZ1KkHewxjrMYquFtvCm9LxWWJZK4c8UfjuQuIIh8Vg3zxzedLrLx4+V5w4Qowm g3vWy77Wanl7nzRtTT1Hul7wo0t9SJbQWVGmAZDROUUicpxumjAoz8fCKFMuLZoHx93UoNN8Wj0 TtA/c3OhzjKQtxb12OCddNgs/3cTAASnMJzzUW+cVNXDI+PaP+BfbR/Hnp61IT8EZHLYAV5jdef
 2VX84TD1CTCt2+Oe57GaGooIvXt8MjqMILSUIm04wxoyEdyf+Njw+3mOh2TQ20it3TGTcxcL
X-Proofpoint-ORIG-GUID: 9TZP_kb5ir9I3bwyCnPh7NgZclsyPHm_
X-Authority-Analysis: v=2.4 cv=OOYn3TaB c=1 sm=1 tr=0 ts=682cb3c5 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=meVymXHHAAAA:8 a=yPCof4ZbAAAA:8 a=Xkg88QbPLB4c5wdRxfAA:9 a=QEXdDO2ut3YA:10 a=2JgSa4NbpEOStq-L5dxp:22 cc=ntf awl=host:14695
X-Proofpoint-GUID: 9TZP_kb5ir9I3bwyCnPh7NgZclsyPHm_

DQoNCj4gT24gTWF5IDE1LCAyMDI1LCBhdCAyOjAx4oCvQU0sIFN0ZXZlbiBSb3N0ZWR0IDxyb3N0
ZWR0QGdvb2RtaXMub3JnPiB3cm90ZToNCj4gDQo+IE9uIFdlZCwgMTQgTWF5IDIwMjUgMjM6MTI6
MjYgKzAwMDANCj4gUHJha2FzaCBTYW5nYXBwYSA8cHJha2FzaC5zYW5nYXBwYUBvcmFjbGUuY29t
PiB3cm90ZToNCj4gDQo+Pj4gQXMgbWVudGlvbmVkIGluIHByZXZpb3VzIHZlcnNpb25zLCBkb2Vz
IHRoaXMgbm90IGNoYW5nZSB0aGUgc2VtYW50aWNzIGZvcg0KPj4+IHNjaGVkX3lpZWxkKCk/IFdo
eSBpcyB0aGlzIG5lY2Vzc2FyeSB0byBpbW1lZGlhdGVseSBjYWxsIHNjaGVkdWxlKCkgYW5kIHNr
aXANCj4+PiBnb2luZyB0aHJvdWdoIGRvX3NjaGVkX3lpZWxkKCk/ICANCj4+IA0KPj4gRXhwZWN0
YXRpb24gaXMgdGhhdCB0aGUgdXNlciB0aHJlYWQvYXBwbGljYXRpb24geWllbGQgdGhlIGNwdSBv
bmNlIGl0IGlzIGRvbmUgZXhlY3V0aW5nDQo+PiBhbnkgY3JpdGljYWwgc2VjdGlvbiBpbiB0aGUg
ZXh0cmEgdGltZSBncmFudGVkLiBRdWVzdGlvbiB3YXMgd2hpY2ggc3lzdGVtDQo+PiBjYWxsIHNo
b3VsZCBpdCBjYWxsLCBhbmQgeWllbGQgc2VlbXMgYXBwcm9wcmlhdGUuICBJdCBjb3VsZCBjYWxs
IGFueSBzeXN0ZW0gY2FsbCBhY3R1YWxseS4NCj4+IA0KPj4gU2luY2UgdGhyZWFkIGlzIGp1c3Qg
eWllbGRpbmcgdGhlIGNwdSBpdCBzaG91bGQgcmV0YWluIGl0cyBwb3NpdGlvbiBpbiB0aGUgcXVl
dWUuIFNvIGl0IGRvZXMgDQo+PiBub3QgaGF2ZSB0byBnbyB0aHJ1IGRvX3NjaGVkX3lpZWxkKCkg
YXMgdGhhdCB3b3VsZCBwdXQgdGhlIHRhc2sgYXQgYW5kIG9mIHRoZSBxdWV1ZS4NCj4gDQo+IElm
IGl0IHdhcyBncmFudGVkIGFuIGV4dGVuc2lvbiwgZnJvbSB0aGUgUE9WIG9mIHVzZXIgc3BhY2Us
IGl0IGFjdHVhbGx5DQo+IHNob3VsZG4ndCBrZWVwIGl0J3MgcGxhY2UgaW4gdGhlIHF1ZXVlLCBi
ZWNhdXNlIGl0J3MgcGxhY2UgaXMgY3VycmVudGx5DQo+ICJwcm9tb3RlZCIgYW5kIGFjY29yZGlu
ZyB0byB0aGUgc2NoZWR1bGVyLCBpdCBzaG91bGRuJ3QgYmUgcnVubmluZyBpbg0KPiB0aGUgZmly
c3QgcGxhY2UuIEJ1dCBpbiB0aGUga2VybmVsLCB3ZSBhcmUganVzdCBkZWFsaW5nIHdpdGgNCj4g
aW1wbGVtZW50YXRpb24gZGV0YWlscy4gR29pbmcgYmFjayB0byB1c2VyIHNwYWNlIHNob3VsZCBj
YXVzZSBpdCB0byBiZQ0KPiBzY2hlZHVsZWQgb3V0IG90aGVyd2lzZSBpdCBzaG91bGRuJ3QgYmUg
ZXh0ZW5kZWQgaW4gdGhlIGZpcnN0IHBsYWNlLg0KDQpCdXQgdGhlIHRocmVhZCBoYXMgdG8gbWFr
ZSB0aGUgc2NoZWRfeWllZCgpIGNhbGwuIFRoZSBiZWhhdmlvciBvZiB3aGljaA0Kd2lsbCBiZSBk
aWZmZXJlbnQgaWYgY2FsbGVkIGluIHRoZSBleHRlbmRlZCB0aW1lIHZzIG5vdC4gQXNzdW1lIHRo
aXMgaXMgb2suDQoNCi1QcmFrYXNoDQoNCg0KDQo+IA0KPiAtLSBTdGV2ZQ0KDQo=
