Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF68D254859
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 16:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744906458; cv=fail; b=IYtXZGz1pl/njnmybcz5nhlV9WdmZNmQHEeOYne6r7YduLpwx461WaG/04zox1bIj4apiPsH7Toc05ll5nLkEFoJgvtXko/XYiYS9qcfPKO1Oly6EjCBPidpHH+/1yEnC7AMxhp03ADEbJYulzAbM2kdTe57OT1lHkCqcST9e2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744906458; c=relaxed/simple;
	bh=cvku+YN2voTvXrc2+lmfB9DTmHFpNp8z9x8QjlD7gSk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IIVt5+H8HbgH+cdaDzol7nWRvDuAYg6xAVzkjoxfVPQRXrdslvkdnK0o/z7EXC0hlL97jOpPA2VhBZFh2+P/Bos1rtaYPydXu0a16/k5UArdJTkDSt8wWlJpvev1NqGDGXHm4iE5+TdDALffD8faHsP+JSddgieTabdBDynqOMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VE7vxD1u; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=V7aeanNu; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VE7vxD1u";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="V7aeanNu"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HBpWT3016462;
	Thu, 17 Apr 2025 16:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=HAz6dn7JwgQe3OVnyBVPevovv938vreEOG11zad81q0=; b=
	VE7vxD1uD3IT7JDnidowrBTvo4W8Cx9os0+9e8xLktPH2E1+smdh4mnOuoqw3BL5
	YeLj003xf2ZfZFMby3dpvWkkXsCCEk+B7PzF6zEikS8tfuSDbdhOwtDASVq58J9E
	QdSisCLfANP2kdH4k1191e+04EXoIHIzwNCs6/lZq9Now7rLRuTWD78gTdhAs01k
	TvSA4C7xNsD1/YqCzWlsjFwNCg/B0sPgcgVS4T3lR23JnUKuve+bjZhPej6qHY/w
	DAACi+tgbow3XvlCO1zslmeKQNj36BF/rcmD5gCmOuCDk4DZR2PUwMU17KyHdKYY
	1wMtDhsIWVRrAJoCaH5T/Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46180wex6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 16:13:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53HFiQOf009314;
	Thu, 17 Apr 2025 16:13:40 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazlp17012038.outbound.protection.outlook.com [40.93.6.38])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d3nfaff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 16:13:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x82YePz9yVA1UELF39eAE26Q3r+wgFLxqV0OvNdpNGwsDUSMvz1FBTieXItSkxQhVDtMoP3IfzcATxeWbaVvbCwgKvnNAoGBFqIMg0PdSJJGnp1GomOn3hPTo0WhHepxnM+tAUW5fc6F/SFiSr1SYJtmVyo5HkOh38r/JH6LjM0xZIluFBMoKVqtDClhGn02WEbQkiRgcQZ2Yg6luw6cdX7wVhlaUKqjArY6HC5tDjMTc4zqJON0DOO70GvOZerQV05GvY/8eqbc9LmgHy7kWh41FwsqR5HjQIUThJxxDtVm9OUyTS/bvFlJOLMq5oLZwv/fD6rZRTE8MES0JsIO3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HAz6dn7JwgQe3OVnyBVPevovv938vreEOG11zad81q0=;
 b=TEnmIdmaGJZKgEJgWHSImWIgPSdYkFknAVMJd6psreJ3MsgONbNH90Fy287qZior7q+w2rZmOMNO8EGPxh4xjLDyjm20tQyARoHDiMF5vDynl4QvlaIHQreKuaOPA9MOPQBq37B/JXzwWU02K+iDnJr/E6ifm2eehH1r7o28oFKtR2PW01T+gnXf6W2Iri1YE8iTKBOJ98ylEJqUDsTp810jaxnf7XRNc3npgFerimmhG/wEgBZ0lv5qFRcIY2sgQlsAvylp3SdYB7j1Ues1qtV75+UUj6g2HD9aQyXuhHspE0C8fKqMRc+xG8w4qZdyCb8DmJBFF5DAG/Rrbj1nSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HAz6dn7JwgQe3OVnyBVPevovv938vreEOG11zad81q0=;
 b=V7aeanNu75T+3gcVWD/c5k+dfxIQd/NKWAUm2ZnG4sgGnK6ufIIBlKCwekU1jAiHk353gLTPmBwnd16+9KlZBosTFNQuB903Ow5DPq144mhrCx4iJwWQyeSKPVRwOrqpgAQnz0bU7AM1BBvYRdc7IktTH4MY1Vqx/+WMmEi3oTc=
Received: from CH0PR10MB5113.namprd10.prod.outlook.com (2603:10b6:610:c9::8)
 by SA1PR10MB6639.namprd10.prod.outlook.com (2603:10b6:806:2b8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 16:13:11 +0000
Received: from CH0PR10MB5113.namprd10.prod.outlook.com
 ([fe80::eab6:6dcc:f05f:5cb2]) by CH0PR10MB5113.namprd10.prod.outlook.com
 ([fe80::eab6:6dcc:f05f:5cb2%5]) with mapi id 15.20.8655.021; Thu, 17 Apr 2025
 16:13:11 +0000
Message-ID: <e5a97a05-63c0-4ca8-beb1-cce6832b363d@oracle.com>
Date: Thu, 17 Apr 2025 12:13:06 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mm/hugetlb: Refactor unmap_hugepage_range() to take
 folio instead of page
To: nifan.cxl@gmail.com, muchun.song@linux.dev, willy@infradead.org
Cc: mcgrof@kernel.org, a.manzanares@samsung.com, dave@stgolabs.net,
        akpm@linux-foundation.org, david@redhat.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Fan Ni <fan.ni@samsung.com>
References: <20250417155530.124073-1-nifan.cxl@gmail.com>
 <20250417155530.124073-2-nifan.cxl@gmail.com>
Content-Language: en-US
From: Sidhartha Kumar <sidhartha.kumar@oracle.com>
In-Reply-To: <20250417155530.124073-2-nifan.cxl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0094.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::9) To CH0PR10MB5113.namprd10.prod.outlook.com
 (2603:10b6:610:c9::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5113:EE_|SA1PR10MB6639:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dea3df6-8d53-4c04-5a8b-08dd7dcac00e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eEg0VXhNRWZLTmNKNStQU0Y5ZDc4WS9VZVFoYTZIbnAwZFkyb0dhVVB0bEEr?=
 =?utf-8?B?L3FzblRobFBhdlRJdUNSWldPa3FjM0psdXRtT290VzlLallEV010VW1pSmJu?=
 =?utf-8?B?dUxpU1lRRE9admN4THV0VFY0WGtQcUNYb0E1MFFNTnYwYzJHS0Y1YkZsVU54?=
 =?utf-8?B?TkUraUFHS1pYVGZsWk54QTk0ZisvK3hxSWdISEJjaXNMNUJ5c3N1eUpSY3E2?=
 =?utf-8?B?UVFwTzVpUGoyTjRmVTFSWEIvK0pqdm13aXpEdXNrakFKMTlwZ1pUVHI4ekVT?=
 =?utf-8?B?ZnVqeU52U2d6RFFwY3RBVlk1UFRTN3dBc0NqQUMvYUJ3ZXU3TkVUd3lvb2d5?=
 =?utf-8?B?UXdneG1JanlJU1JDZEJxM0xWUEg1RmVrMk1GUkMzWUZVNFdSKzlkNEhyaEtt?=
 =?utf-8?B?RmJWdDlZYVozVjVVc1hoMmJsNmxkZ1gzUVZRK1JYUFBYZkErdmVqbXFJWkVV?=
 =?utf-8?B?Mmt0ZzRIcnBuenVjSmUwN3UwRlJRNVBqaEpBMmZQMGxWTFBVVGpldHBrQ250?=
 =?utf-8?B?NmpsZUFjdXBiWGtRR2tEN2lBaGtpYkg2L1BydDNOR2NDYnJqQVc1MXBNc2kv?=
 =?utf-8?B?UjZiTkVHZFVnUVM3YWsxUXEvNkd4bXZPSGhxNDNkaERnR1h5NmVDVkpxaFZM?=
 =?utf-8?B?RUNmcjlTQ1dua21DWXdmZmxpYlBTSzJQdlMwVXhrWmFLME5QMG41YVlsZVRu?=
 =?utf-8?B?RWI4ek5EVjd4QUZJVnJmRmo3YXpMU05VWEFNOHl3Sm1HeUdEYVFUc3hlRGxX?=
 =?utf-8?B?ZjhpWE9sSEdoK1czTXBDUUZkcWtGR2NCbmpJckpTeDJuNEJQdi90UkhzcERo?=
 =?utf-8?B?R2dlS3YxWHdNWTRCbmdQdjlmUXNGQlVJelBoYzlSZ2tZa1VoZTl1QVg2L2lv?=
 =?utf-8?B?L0VuQTk0akdnNFJLWDhPUDVNZjNPWTV0aldqekdPRVg1bC9veWNZS0tlNC9v?=
 =?utf-8?B?Tm5kVUZmY3JKaFpFRFVNdDlZWitXeDFJYkpKZ1pFeElKQzZ2Ylg0MDdwTmNa?=
 =?utf-8?B?cU9XeGJsNDc2L0hDSlBuQ2NFVUxNVkJlV0sybnZUZEo5YTZiOU9LSWxOeWpD?=
 =?utf-8?B?UzRoUzFMN3NkNGpRa3VjdkNNOE1XUkR1ZVVaK054M1NsdmJOV0FoSkl2aGlW?=
 =?utf-8?B?QVgydnFqWTFkdHliOFU1OENvbEhrUzhLRXFDSGlxUWMrclFsR0orYWNXYnEw?=
 =?utf-8?B?OFVWelY0N0ZwN21mRGdUbllZRDM4RUJrRUU5dWU5THFDRmszdFpzMmJxZG15?=
 =?utf-8?B?aEN1VXA3N0VDL2pNTHdkUzM0Z2FaaDFFUGVZN2lsb2I1U01URThTNE1Nbmxu?=
 =?utf-8?B?VUl2TWlCcmoyc0M2MkgyN3Z4WFdpRHFyQlJqMG04WDNqaWxxWlo2N1ovR0NT?=
 =?utf-8?B?S3ZBcU1kOVJxTXpRd0FSaDVBR1U3aDUrRmlBUTVZL1lLelBaWkxKQmJkbS9S?=
 =?utf-8?B?RThvZVNiZE50eno1L0VCMGdyYU1iSkhoTUEyNVBpQmZVWTdaMnFmWmZZSHZo?=
 =?utf-8?B?WCszNEc2aXU0OWo2WkQvVmJUTisybTYxMld3Q2JFRjBRc2FCTmk1bjJJczZG?=
 =?utf-8?B?TTdVMEhqWXhuRjQ4d3FwMUlwSEdlSEtWdy85TWVvbGs2c2dnSVdUbWp5YVhH?=
 =?utf-8?B?N3BSa2kxbWcxYkg2OWtFRGNNWG1WcGp4OW5yR3NYSURrVVgwUHhoYTdBVVJO?=
 =?utf-8?B?NnFlcEszS2lSaElSRFdwc2dTZDhmc3N2ZVpJRk9RY2ZDM2N0a3h4RHV1cVJ5?=
 =?utf-8?B?cy9BNm9VeFVIUmx4ZlduZUROMkRxT2MwWWl5enpZYlRDK2FSRGZ5TkY4Ymxi?=
 =?utf-8?B?bFhjRVdyVjdrTllqMlpOV2M2RTdVYUxmNThGaDBndFlMMWhOQksvWE5xdGZa?=
 =?utf-8?B?dzRwSGpnU3FPcmVZa29FRitJbk1KU21RbUdZanA2eWQzaThUd04vN2FPRWpo?=
 =?utf-8?Q?BvhAfP8ffCc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5113.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dE1VMU5EcDNkS2RXOW5LWFZiR2JhWS8vOWZaVUZqdWRWcmRjL1Vhc0FwWDN5?=
 =?utf-8?B?VG0yYjZHbkFuQThNbHpmSUdBamlQbndrRWQycGpQa1dHcnIyMkpSeFdzWks2?=
 =?utf-8?B?dWpiZHk0Z09NcVQ0UWZEdnM3eDNtTWEyRG1TYVlYZGtGVy96UVBIRVh3ZWFB?=
 =?utf-8?B?c05tZ1NQKy9GbUpQKzFEcHdGL1RPN1B5M1VnTzVQcjJNdWxtSUNlM0kxVThZ?=
 =?utf-8?B?ZUgrYy9iZ2dCT3lZVmI5cTUvdDVzVDVIUFlpM0ZDMHFoaFlDQnlZZjF4MTVz?=
 =?utf-8?B?VVJBQ1ZWOE92L05scmZXQkxIUmlqWjVkWUtkRlBvQ1YyVXJTZnRIZTV4bmhl?=
 =?utf-8?B?amxzT1VDOWNSZk1XalJHR3IweG1mNkdqTFlTMGJIbU5mRDVxcUNFbC9RRmFp?=
 =?utf-8?B?VzBMMVgyWk5CaFlrNXo0U2thbXd3a0FjbkJCa1dGWjdjaytVamlOb2kzQk1O?=
 =?utf-8?B?M2J6NkZ6QjVkZ0xEZlpSNWtpZHZPVUlJeWpRY1RKNjROS3lLNFVXVTdRUU55?=
 =?utf-8?B?RVk4eGZCZ1M4amhsS0djYVNBaG1vL0pMRWdtWVVVTmRWdGwrMis1am5INHFE?=
 =?utf-8?B?cGxUeFV5bE5VSFhzanI1WTRqek9vYUc1OURhbTU3UVRBRGlOTlJHRWtKUnFs?=
 =?utf-8?B?ZGJuY2FJTGtzOUxGUGs2UnFoZDU5MlJFak9pT0xCNFI5WlVwUmJTbW5rZmVP?=
 =?utf-8?B?VXYxbkVYYitBbExPV3kycGpXa2FRMlgyZVRhbjhUR251ekYwdllnZEtFdUFw?=
 =?utf-8?B?V3h4ZU5NMG10VGNhYndZSDZKRDQrdWVUdk5WN0JzSXpmUFl6RlNHelBDYXZX?=
 =?utf-8?B?bmZhRndMUFhQamgwSDRrY0lkNkFkZnNYSlJmVkhKT0QrS3dhbnBsVThtSW1s?=
 =?utf-8?B?RzhYUmJ1UG9CVmRsRGFaYkpNUlorK3Vvbi9JRjdsOWNyYWxjdnUrckdzbExl?=
 =?utf-8?B?V3BuZjRtS21tb1ZRcmV2YUxFdkw0RzlLRzVGQ0EyQmpTRWpNN0p4c0ZFemxT?=
 =?utf-8?B?YnFFRTI1VHEwWFJSQjFvSzVKMWV6NzdpdXNHMnRYaGRsRnpWNWJoWXhHSmYy?=
 =?utf-8?B?cVBMZmlYY09JMXJPcGVMZ2xMN0Fqd2tjOE42YUsyaDJFeVYvUHA2cXFJbHo1?=
 =?utf-8?B?YVBPOUhVRWZUSVRPV3I5MFBteElTQWdOb0Fhd0s3M3YwRjN5dlRsMG9BS0FV?=
 =?utf-8?B?WlBsUWgxK0xVL05UdVpOZ3ZvYXdGdjFxZ0djZmFyYzB2THdrSWE2TzVOZC9o?=
 =?utf-8?B?VXh4TXFzTXpVb0dxOEJPZWx2OEZNUXBMdWt6SzFmU3BxTGw1VHI5U0ttK0c0?=
 =?utf-8?B?bXZGNUg2TUQxRzh5RWhPc1hpWENJZFdOVTg1ZlcvR0cyZndHdnhkT3lGcHps?=
 =?utf-8?B?Ny9KNFdyUGpyMEN6UW5qRVJSQnN4dUw5bnUyMDkyRWNHV2xweXBsdy84QWE0?=
 =?utf-8?B?Z2RKd1JwdEVIOHJJaGgyeFp6Zkl4MWt6M0lhQ2Jma0dmbW5paWRwdlBjcVpF?=
 =?utf-8?B?dlh2cWM0T0k0VUpaSFYxQkJUelpHOGI4ZUZXU1gwS0g4VVBsRWVONUdGZk1C?=
 =?utf-8?B?VFpxVEpnRWcvT1lxZlQxNEZFR01kU0FiNkpDU2krRWxhZ1pUUnlrL21IbGkv?=
 =?utf-8?B?RUZIQ0t0OCs3TVk1ZFp2L2VWdENkR0lHMUhiYXRGamVEeUNqZ3lXc084NlFQ?=
 =?utf-8?B?M3AxMjQzMUg5eThCSGpVQVNySFFDR0pUWmVoQlNRcTZOZXMyQXdRYWVPYkR4?=
 =?utf-8?B?TDRnV2NFenVNVDQ4dnFKMVk5TkdNVVZaT2V6Y1NuZldsbnBmcmMyVUpzcVZB?=
 =?utf-8?B?d0RISGJ6Mk9wd3poQzVzYjZzOXJXS2xCd2pEYlJGZHhjc2RrbmVFdUgzUEdO?=
 =?utf-8?B?TUMycjE3N2FHMHo4azJUc0wwdnJUWS92QVlWVHFvYmhVbnlzeFNjQkxOOUIw?=
 =?utf-8?B?azM1amdwdTdLUXJLY2t0ZVhwT25WNG1QVnNpcEozaFl2QVY3djdiSUNWdXFX?=
 =?utf-8?B?N1g3aWNRSmlKaitMVWQ3SGhCQjdTZVBYMFp2MmRlZ0V3M3RzOW1GZGFrbDJI?=
 =?utf-8?B?dldCRHAvcmlJTnNWMHZRUzN4N0VTcGhOelpXTUpycEdHdVJlNEk1eHBiZ2Jn?=
 =?utf-8?B?VDU4a0NmMHRvaTNJVEdaWElvTGRSbS9RWDdXakFpQStoREZpbzhUVWpCS0dK?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1qNpcAFia5bITm/5BmFzEFT3BDPLodv9+lccUCOraTnt4IEO8YmkT2kH/rOIq79i6y5VGx6vK+GH3jOKy8PbIEY5XNogYEk55D9JO7R3ULZYG1Qz5oau1pcytT/Ls6WAUnU1Zt7u6TEIY4uBpZy9v239ArpUxMw5W+DbetUzoRJslyAlpS9bQcBOkGKMeXI2u3bjf2uCKWlIlYw7Ex7M7+sIy6cvBdCLpJs241SdBcFpdMYnFaZZYvl/Ebn206Mb6hRH1dqivwdcGxFnvslqFjAceIn1oN8d2IiRoCKPOZ8Vk5KHcmECVOUHBgAAZA6sFn1YysflsxsDu4vJkeEVutCjkLf0gONV1luEMHak1xXClF6RnEQvz+YsX8XDBjplYG5IghgF+WSGJv/YCINulBQwgBokiDmaqSnVr4MWaYd6pkephuqaB+o1HEmCgvNwn+IdC3GBkVQG3FpMcF9OuyWkjAR9ECnbESI3/NAZzRECP1pNB1omkCn4DqzKGEyW8tY6WWa3IQh+A8bURRqewFlzy3KQXuQ9FfptzpYmnZSOjGOEnf+rW6e5wd0mRn567Qucbh3ZLaR7DQmfWqP0+V5DYW2jfeTz7DnbFC1gP30=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dea3df6-8d53-4c04-5a8b-08dd7dcac00e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5113.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 16:13:11.7758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y71aaXdvfR0FgBzFrTSoVnok2mGL5O9mMpNgXAr0elRrmpvXc5eLy/nBldwh5eCAGyC+EszhsEO6JxyrQXtzjXrY7wQLmZt6zhbSBK73FQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6639
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_05,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504170120
X-Proofpoint-ORIG-GUID: zhgQY8b2DBwS8UmrxjFvu7HBahnMz_t6
X-Proofpoint-GUID: zhgQY8b2DBwS8UmrxjFvu7HBahnMz_t6

On 4/17/25 11:43 AM, nifan.cxl@gmail.com wrote:
> From: Fan Ni <fan.ni@samsung.com>
> 
> The function unmap_hugepage_range() has two kinds of users:
> 1) unmap_ref_private(), which passes in the head page of a folio.  Since
>     unmap_ref_private() already takes folio and there are no other uses
>     of the folio struct in the function, it is natural for
>     unmap_hugepage_range() to take folio also.
> 2) All other uses, which pass in NULL pointer.
> 
> In both cases, we can pass in folio. Refactor unmap_hugepage_range() to
> take folio.
> 
> Signed-off-by: Fan Ni <fan.ni@samsung.com>
> ---
>   include/linux/hugetlb.h | 2 +-
>   mm/hugetlb.c            | 7 ++++---
>   2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index a57bed83c657..b7699f35c87f 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -128,7 +128,7 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
>   int copy_hugetlb_page_range(struct mm_struct *, struct mm_struct *,
>   			    struct vm_area_struct *, struct vm_area_struct *);
>   void unmap_hugepage_range(struct vm_area_struct *,
> -			  unsigned long, unsigned long, struct page *,
> +			  unsigned long, unsigned long, struct folio *folio,
>   			  zap_flags_t);
>   void __unmap_hugepage_range(struct mmu_gather *tlb,
>   			  struct vm_area_struct *vma,
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index b5d1ac8290a7..3181dbe0c4bb 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -6039,7 +6039,7 @@ void __hugetlb_zap_end(struct vm_area_struct *vma,
>   }
>   
>   void unmap_hugepage_range(struct vm_area_struct *vma, unsigned long start,
> -			  unsigned long end, struct page *ref_page,
> +			  unsigned long end, struct folio *ref_folio,
>   			  zap_flags_t zap_flags)
>   {
>   	struct mmu_notifier_range range;
> @@ -6051,7 +6051,8 @@ void unmap_hugepage_range(struct vm_area_struct *vma, unsigned long start,
>   	mmu_notifier_invalidate_range_start(&range);
>   	tlb_gather_mmu(&tlb, vma->vm_mm);
>   
> -	__unmap_hugepage_range(&tlb, vma, start, end, ref_page, zap_flags);
> +	__unmap_hugepage_range(&tlb, vma, start, end,
> +			       folio_page(ref_folio, 0), zap_flags);
>   
>   	mmu_notifier_invalidate_range_end(&range);
>   	tlb_finish_mmu(&tlb);
> @@ -6109,7 +6110,7 @@ static void unmap_ref_private(struct mm_struct *mm, struct vm_area_struct *vma,
>   		if (!is_vma_resv_set(iter_vma, HPAGE_RESV_OWNER))
>   			unmap_hugepage_range(iter_vma, address,
>   					     address + huge_page_size(h),
> -					     folio_page(folio, 0), 0);
> +					     folio, 0);
>   	}
>   	i_mmap_unlock_write(mapping);
>   }
Reviewed-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
