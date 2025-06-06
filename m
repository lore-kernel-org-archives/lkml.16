Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31454A31;
	Fri,  6 Jun 2025 20:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749242048; cv=fail; b=QL691/odI/2Y71KzsArkm7ImX34Y6H4dJ6FAc0gevH+4i/Q3ITROEr1eSCLKakky9tZ2SiAEmFSsCaGtX1MBPolL9S8E0hQ0tsX5SxjDtnC3rwAXaq955TtlZ7XesN+SV9Fam7i5nI/Yj4r+5PPnRgV4KU4LkFUEhpoh31MZVO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749242048; c=relaxed/simple;
	bh=mrVkyFQB9+o1ctZS9Aw5RyXpNhn6iOMlnEZrEPDY8SA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qNSFJoOHkbaeht22lPYLcnG5whJpe5E6kBKE3akAfp1VBFH8NXXsS3h1rm7CDKc1lAzx+hOa7i7JtP3rekz/i3aRJ52Xlmex/Joxr7iDy8Qt01Yg9lnK0cjHf5+GcKNfl+0uPgKXV8ydipBdB5p1wf8eWjPB+bhdMOzMD7I1tTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oppWO/DH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ece5K//k; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oppWO/DH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ece5K//k"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556INDqs020202;
	Fri, 6 Jun 2025 20:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=8f34HmO2m872BtKcxp5QrmeUXiJ+OeZocndNTqgsFRw=; b=
	oppWO/DHW28OIlNjvmu9TviMAPYMWjURVzmhCDHoB3663dGcUYZUf7GlLF08YaPO
	y7bMQzoe2PLvhF8YU9wYUJGG9/z9sagqYkjEfppg1ZSi8d4XVv+wbNIiRp0Y7vYJ
	AZhnyFMVkfXRpw/zRkE/wEQ+Jgflc+jOYU5Qj/w4oBV6L+dnK+Gsq8dakgO+3KLZ
	sm3V5OzkSVlZwenli/GRLPJM3zsWc0LBpkM4JZMS7HzGxH+oToi8K5ZkLK4DGnEm
	5iO9F0s/BdO5EQDKH8lvDubtPpt/dL+NGRU13yk1+4wb8pz64XETY2Wu8VFw/6lJ
	et1WB5XcDQ42eRrPXSFRFA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8brm72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 20:33:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 556K6lFb007261;
	Fri, 6 Jun 2025 20:33:52 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2084.outbound.protection.outlook.com [40.107.102.84])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7dpjw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 20:33:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pCx/u1R7/yeJY1GzPxFSwC5cmya5kfWO8iG/rm9IyIT6AryGY9Vynq1K83dyqkiJFmUrE+QgiXGyi9wYjyzQzissP4/bCMKWAmlhwbK0FK3uB4zxXMWL9pLlFbVXjwPYbk4jhZJ7Ib0eQHJOdjh7QJLffn6dIK48wJLuD8qiO3/FE8052Pttqj17T3jyael4zDjTEqE3bahsFalyPoaiVzHrYeYB1WRYvRswU43EYgiXHcKUpRig2LkAFwII1y1gm001PF7iJE6sfb+5giqU/BYTt5fAY4I/gbtpmYriPxkyiWX3Cm5BUDbodVYJ+N8BAlvgOBEuka4brRjDNmiVyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8f34HmO2m872BtKcxp5QrmeUXiJ+OeZocndNTqgsFRw=;
 b=M++A9IKcBYg0FJK+ekzgVWT7BVXqmOWvn6zgsIvncao2UsbVROlr1rwLRzojIVhKKWm+gp8e5ANY+XTBr6JTFvLdy+HChR6LaJ4BqbojlVf7SccTi6xxdKeY2DU9lRctR85zs920nlhap6I5gzoyBX9lGnua8Ma2OyUg/YGagi2RQQYZluulrJaPILIUgg/OindXKPLtDJMulJ34x8pkGl/lNiBWZA1au2L5JTo6GQyh+qwkShFyu9cOshW7fY3ZNF+bSJ1LKWPQpf6ZgpprcAd+8hRu4VWp/KW8HVxE8V1B8sO69NJHt5Xpol+FYfVg9AM5PjgYHoI1yzvf01t4Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8f34HmO2m872BtKcxp5QrmeUXiJ+OeZocndNTqgsFRw=;
 b=ece5K//kc8MQ44ICopJLe4IyL/VyHmDtXaNOqt4fJg8+Pyom+mosCz4A5N9nDx7+FSWyT2Dm6jWKTFflVtVbgdAhT+RvYBITwwCRk/MT1wItcU4Ri8gRby0SzEhdWQAKgl/mGZZJA9sA8XejzQAOEu0cq0p5fKQlr/UxDWmQ4qU=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by PH0PR10MB4440.namprd10.prod.outlook.com (2603:10b6:510:35::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.24; Fri, 6 Jun
 2025 20:33:50 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%2]) with mapi id 15.20.8813.022; Fri, 6 Jun 2025
 20:33:49 +0000
Message-ID: <11b278ac-20ba-4e75-b307-6608ea8b4522@oracle.com>
Date: Sat, 7 Jun 2025 02:03:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] i3c: master: Add driver for Analog Devices I3C
 Controller IP
To: Jorge Marques <jorge.marques@analog.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250606-adi-i3c-master-v2-0-e68b9aad2630@analog.com>
 <20250606-adi-i3c-master-v2-2-e68b9aad2630@analog.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250606-adi-i3c-master-v2-2-e68b9aad2630@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KL1PR01CA0049.apcprd01.prod.exchangelabs.com
 (2603:1096:820:5::13) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|PH0PR10MB4440:EE_
X-MS-Office365-Filtering-Correlation-Id: af845dd4-9c92-4c06-9c3f-08dda53971a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TUZVUlpwY3c5NC9sY3J0QW9oWldIam9Cdk45OE1tc1RhVkg5Z0E2ejZ3cE1D?=
 =?utf-8?B?WGxPcXBtemUySTkxdmJKNld6UWs1c1p1OWp6aUZZUmlHQU9xbFI4S2w0L25O?=
 =?utf-8?B?cUR3ZmhaMmdKT0lLVXcwN1JrRFh1Z25RcWJ1ZjBQeGFCcUlnd2phUTNHRlJI?=
 =?utf-8?B?QmwvK1hma1N2c25WYnJwUFEwZjF2NTcra2N4OXQ3Tjg0QnZYYWd2b0crRUk2?=
 =?utf-8?B?YWRCN05TdFdDUHV2MSsxMTBWQUJvOFBCc2ppVjNsTXFWbVA0TCtSNnplOGFP?=
 =?utf-8?B?dmNodDh5ME1TM3hNN0xRaTJ0c1I1TkJRTjVwazE1R2FYUHR4cGNOeDd6MHZw?=
 =?utf-8?B?c0F6cTJ2aEYzRGVERTJBM21EeHF5Uk5Rc3RFSGRta3pUakE4Yzk0ajgwM2pQ?=
 =?utf-8?B?WSsvTzNxcTJXbmpoMXhONW4vWm12RkxNd0ZkZGpUUTJIekRlbVBGckRUY25U?=
 =?utf-8?B?TFNQVmVlbUVNNDJWQlJtcUJ0M1JsVFVESWVxd3pybjdESzdKbXd4VHM3OHQ0?=
 =?utf-8?B?ZGpXK20xMVNaeU16U0RDWmY5MzQ1dzZ5cmZzci9zcXZtcHFHSkdKVWZId0Jv?=
 =?utf-8?B?QzhWc0sxRGJRYUYranY4dVN5dW9FQy9qd2x0cjcvYlBkeWZZeXpuL1BoU1dU?=
 =?utf-8?B?Z0tpT08xMWJxR3JQeEUwL1ZlVy8yMkJMSW4yK1JFVjZ1NnFKU0Iyd3A0ZWE3?=
 =?utf-8?B?Z3ZYZ2cwa0ozMDIxaCtYNGJ1aHFlODNvdzRrUkxxcm9SZXkvUkZubWNKY1N5?=
 =?utf-8?B?TXpwZjNGWjJoSk5RdElLbnB2WFREb2Q4Nm55TUQ0bXg3MVh4RjNzeWx5akts?=
 =?utf-8?B?MlVXUG5zTXBKL1FwUjk2NW5NemtQdkdicGtvQ1pFNlBlWmJqQ2RnTFdNRWZ1?=
 =?utf-8?B?VTF6MUpQWkZqaWtEWkxPNnhYMTRMRkhkaFo3QWJUeWZlb09mVzZWc1hYVGpy?=
 =?utf-8?B?bndpcGVUYmxrVzd3OWVSWmVuOTRaNlFZSkhNdEhkVDdTQllZY0NFK1BXLzFh?=
 =?utf-8?B?eHJ0cHo1RGg1emhNT0g4dzhmODM2M25JQjZRVHJYVnQwbm9pNHZzMjNpaEVX?=
 =?utf-8?B?NTRCeGFIUEptR0x4WGJ1YnY0QjdPMjdpd0l0by9iRWRRdXJ6dDArMEpJWGZi?=
 =?utf-8?B?aEord3JRY0x6bHFvOGdNVzdJQ3JQOXB0WmgyNnlaeEN5UGdVRkxvaVpqdGla?=
 =?utf-8?B?VXB2azdpSXFPeXk2VjhrNTlPRDNJMEJNeHRRYjVkeU5IVHRidTN4RkE1UWZG?=
 =?utf-8?B?WXJFY2pvUHZXWFUrc1ByclNWRHp5bjkvUGkzY0FEbm9OazhibGtqRitYTVZR?=
 =?utf-8?B?Lys0eWoxWlhUTEdDQnBPNzNjSFRZWDkzUUFHaS9pSzI5NGVKM3FiV1NKQTNO?=
 =?utf-8?B?QmwreWkrQUZzRmFOaXN6TUFxNFdSd2VUa1diM3MrdU0vbVFpMWJ0ZGVyS1dx?=
 =?utf-8?B?RU5qaEZwcjk4WERXZjRFNSsvN3FXVHZFazR5ZDlqbVNyZDhpeFRtVUJtQ1BR?=
 =?utf-8?B?Ny8vcFpJeC9Edmp3R2w3SEdXbFVKZTZiL0ludDZSa3R1TEhOQnBGd2VvUG5Z?=
 =?utf-8?B?Y0pjWTlaYWtHbFQ0U2VCK2lycWo1MWtMNUN1VUdEaUlDUjErZVBvcGo2QTNU?=
 =?utf-8?B?Ukw5d1ZEWUJQUVd2Um5HVTBCd3Nncm9FYkw3NWMva2hVaFZWLzc3eTB4VC9D?=
 =?utf-8?B?MWhEaDlGMThyZkk2MFFuZm92Qm85Rjd5d1dNbVVlcDMrOXZ5R21ua3hvL1BC?=
 =?utf-8?B?REdYTDE3VytpMUxHU1ZiRGRaUWU4b2pIZGFYZDZKd0lYRUIrckx5NmFWUmtq?=
 =?utf-8?B?UktRc1ZuZElHSTJISlE2KzdBaHpRWkVIL1dnVTN1cENXamNRa083Z1k2MFlY?=
 =?utf-8?B?czVZbU1BZnBKV2JmRWgxMjJrVC9ObkpyVStLeGc3TEVLZXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWYrOGtHdWJZb1FzbHl3djRFR3lvNXF2VWg3ZXFuZytqM0NVTjZtWlQrWUpX?=
 =?utf-8?B?ZUJPR2I4MUV0QWlLQ1kwNm5ieDFscU1Ob3RENDRKQmQ0anBETHlJN0NZTzdy?=
 =?utf-8?B?UGVicDNyR1lWbUY0amg1SXJwNWhQMCtaT0pTcDFXMFp1K0VwMFZwQ0dzaFhI?=
 =?utf-8?B?Tjcxbzlwbmd0bHFqN3FDMjBIZGU4T1RnbTVCYXhPYm81SHFtWkxNSE0zV0RH?=
 =?utf-8?B?eE9NMGRsNmlEMzdWTlRBWU9jVmd3RVB4bEZQaWZSOGtXcG9OWmJHcTZaQUpE?=
 =?utf-8?B?aXowL0oxUHRzMUZPdWFBYnNFdnBGanRjMG9nTkdJRnQ4dENiRUJpQTlrTkdS?=
 =?utf-8?B?RU5ocEU4N0l2R2FyWVFUa20yT1ptZUFFbDlyQVZ6TVR1V3JodlRxVTdOb3E4?=
 =?utf-8?B?VkY1Q0liaGl5SmFRZlFLc1hKZ1BQR1RqOUdYTlhlYUFFN3JpV093VnJMUzFH?=
 =?utf-8?B?bUliV1ZuelFWK1NwWmY0Q0cweE16UXdobXgzWlN5SmVuSjRMS1JyanhtU3NU?=
 =?utf-8?B?cXdjWk9VMXR0dllLRG9rSWpZL09EVFpyZndraUhENGEzZFh3SkFmdjdWa01S?=
 =?utf-8?B?R0hCaTM5cUk1NUdVQkd3cmV0R1g2bzRQekZ4a2ovRlcrMHFqNEpEaXBUUHJi?=
 =?utf-8?B?UDVsdGdKdGtycWdhWTdOY2t5Zkh5MHNZVWtWSjVKaFJpRDU2SUJ5M0VFL2dK?=
 =?utf-8?B?Z3hTbEFySmhyN04wQjd5cmU5M08wVlBFNlFqR1NEMEl4cGhkeVd4SUZpSE5j?=
 =?utf-8?B?ZTJseGE5TGY2cnI4ZjNPNS85aGRtS1psTlM4Y25CbmZ1NWZVa01pKzN5SXhZ?=
 =?utf-8?B?blhtdXhSblN4YUhrYWN1dXhCV1FxK1pLWGJFN2hscTFKREpRd1BmeWFUTTNN?=
 =?utf-8?B?ek9keE91U2VYSWxjTkdxdm4xeXpKTXlycHplT05kMnpOM1NoQXYrWFdSQXpu?=
 =?utf-8?B?aXE1U1RUT1lTVlA3Wi9Rd3lQcW5YcjNUcWtlUWtLdnZPekFzRnpjUml0MDBK?=
 =?utf-8?B?MkJqSjYrRHpYczNLL0U2T1BWU3NaVm1tQnpYbmFIQkRhalVKdGV2NEEvZWlj?=
 =?utf-8?B?VGxoZCtaK244YWd5UkNHdnZ6NUNSN1JKQ20xRWdEek9YNU9VTkRTaFA2N2t5?=
 =?utf-8?B?RHVOb082UnZ1ckFtL0V1M2k2Qmsvc0x3TCt6RkYxOFFqQmFGblYzUlNpR05x?=
 =?utf-8?B?eEZjRSthL3JvM0NUNVpUMmg4cUNNbHcyV3VwZG9PM09rZUpnckg3a2VoREkw?=
 =?utf-8?B?OEhSRFc3c2czNEUwNVNwcmxaa1o2ZUttaWJaY1N4WFhXRU1WNDV2NnJEYVBY?=
 =?utf-8?B?cFpqcGVFYlFQRk5jMnArcHRZM3RvNzI5Mkk5cG5iRkNzMGxQaG9xM0VpaHpl?=
 =?utf-8?B?OHVFZTNkbmszZVVRRFN4eThtTFNkcGxndEd0cHQ4ZWl6QnpuZVVFL3FWTnIx?=
 =?utf-8?B?eHl3QUlLOEl3dEtFWTdQQk5Makp1VXA2MEg2WmJXYnM0TkpnS0t0S0J0S3BX?=
 =?utf-8?B?L0tUTGtOMFZoOGxheTBnZlVtM1htSE1pbEJqcnh6bjJDRm1BRVhwUXJYSytP?=
 =?utf-8?B?cHR5dGdRVHdmWGhTWlllSm5rRi9kdXhoRXB6aHpoR1l3R0FzNDM4dHNvQm1y?=
 =?utf-8?B?M3R5YVBvR3lSUU1wcHlRT0ZlWGFwZlgvSE1GZ2w2MktNZ0JtU1hYRkNpdmMz?=
 =?utf-8?B?S2NrSEFiQTlTb1VicWo2RXFBdHVkcVlrdHZnOXR3RFFDbjJ1amNLajdQTDRv?=
 =?utf-8?B?ak9vVW1BWnc1SDhUMnlHak05THhQcERrVDZ2MW12VWxEMWtQL0hqSUE4RG1F?=
 =?utf-8?B?Vks0SUpZeis5VFhCZkQ4dnJ1eTVjSWF1ZzNmOUJtekJhVHh2eFYrc0E2SHZr?=
 =?utf-8?B?ZTByQzhlMmFrTm9NZktkR3M0azQ4MXZ4engvaGdBQ2s3L2dvWGdqdVRFcHdN?=
 =?utf-8?B?R1hZUGdnakNFWHJndEhiYnB5VWlMZ1ZycThxazFNeEJGUks5TURQN1dVOHZ5?=
 =?utf-8?B?Y3BZTjY2eng2UmV0RmJPamQxTHVQZW5hMkNyb1lwRnlYTFE1N3N1ZjhjbE5a?=
 =?utf-8?B?MklaOFNiMlRpOFhheUdCVFVzeUlCNnZIWE1qU2hYY3VjWTZ2UUY5ajcvQ0NK?=
 =?utf-8?B?RDNyLzZDU09Qd05mOHJiYktyM3FWVnlsZVQxNTRqTUp5YjA2aStHVGdhOWND?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XEXZltBswPm/DY1iNwuOmUMc4OnNylgGmH9fB5NAI3kmN34M+oP/lzL7817UEJzXuoH4JJYfi5guwIF9LLKgJJvhbJoij/A/PcmHBnrcBrloCUrBoPedXRj7XERSZWEc5jIJDwwGWnjVQ5qnZtVSGrAlSQt3V3KaRoPkDJHli4Rb2gAL0jE+MRT8Be+oeNoaeErlFxFUoN4gX+qUUblCpODHwbm5cJRJ7vYH/XKU/rqvkc0m+i1Ky48uPjFTaFwU+VLkzLaAgcZtwXvdU9s5t+oYMPmvCWQF+61NI0TloFtTJ98qDOU/tDX7b/BodHfQQhSfoLbl6huOlkCEy2EOzWtdg1H8Gk2sUcjNN2xG3DtevnEKmoH6jWnLR062hcKhxKjtBwX75ynsN/QETCF4yxn0buzWwDBjeCZrocKOTxkbZrJT1qnsugcGtj+HHnVrkYScb9X/RhXjt9lFT0Po68omYwmnIW4vOIQmYWLPX4PDeMTASHpcRzAXAPuzZH+xpOQMrJ4jcBo9BQRGN2hyfooirPZMrN/Hn0CADKPIOccMtY9krgrtD9qq41qA20z5Dt/mexqkqebbXcnjsBfFB520a+F7Cz4JsqC4tLoLCZM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af845dd4-9c92-4c06-9c3f-08dda53971a0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 20:33:49.8177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y+6gyOhr6nK+bHTJl+ceM8zS1QGdLK7oIy5hYCqOA93jEgbflRpSFeaMl3fBeXT6UwDKOLT24q7fM/PJ9YSY9wtsh5BMMsfDnHGY2REkvEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4440
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_08,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506060175
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDE3NSBTYWx0ZWRfX8rZyshTUD2pj K+IxqaCmPgqg2CP+wE6dCkrGlzQ9G5vb+Arauby6MnSyO/BEm/F41Iz6ogdpMKLapU1aRX50QqS 9T8pCzx99ZlTtdJ+wK6aIy07r8+daG8eZSSBZ2sAGNo7/ZwoVCidUKkd2IOxXVLj5gN9L6gDcLW
 Y/xBxYfNSmF7MxFLETL/p/KRk2ghDmr5aVjY2CjXeLqLxI4tn6WogvzsAUAkS0yLnWVBjA+CZ75 sKlAg8wB80Fc2L63Ox0TyqYAIv8dCA6N5JjOIm7Vrsn7eGDUz2Clro8AksM+eUlBE7onFmERx3H UVvxMROohfT4XuguDsQs9uNbGiRXgzdDunqaOVt/jWsC1SkJSKfWVP5R3voNRbhT3iXuzm3ZF1i
 GYo0J4+ezydEVjskXf0rntjuDaO4Zkq8BPZ6fP8v0f6d1XzLcxUw15gEEbf3QHNnudLYFNF5
X-Proofpoint-GUID: IR0AdV3VyB6_lQnK9m-NRXk5M49n2fOn
X-Proofpoint-ORIG-GUID: IR0AdV3VyB6_lQnK9m-NRXk5M49n2fOn
X-Authority-Analysis: v=2.4 cv=H+Dbw/Yi c=1 sm=1 tr=0 ts=684350b2 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=gAnH3GRIAAAA:8 a=Zl09AVZkb45HLbAiaHQA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:14714

> new file mode 100644
> index 0000000000000000000000000000000000000000..b3799071573f4066eb14123c94ee599cc6331b3d
> --- /dev/null
> +++ b/drivers/i3c/master/adi-i3c-master.c
> @@ -0,0 +1,1037 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * I3C Controller driver
> + * Copyright 2025 Analog Devices Inc.
> + * Author: Jorge Marques <jorge.marques@analog.com>
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/i3c/master.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#define VERSION_MAJOR(x)		((u32)FIELD_GET(GENMASK(23, 16), (x)))
> +#define VERSION_MINOR(x)		((u32)FIELD_GET(GENMASK(15, 8), (x)))
> +#define VERSION_PATCH(x)		((u32)FIELD_GET(GENMASK(7, 0), (x)))
> +
> +#define MAX_DEVS			16
> +
> +#define REG_VERSION			0x000
> +#define REG_ENABLE			0x040
> +#define REG_IRQ_MASK			0x080
> +#define REG_IRQ_PENDING			0x084
> +#define   REG_IRQ_PEDING_CMDR		BIT(5)
> +#define   REG_IRQ_PEDING_IBI		((u32)BIT(6))
> +#define   REG_IRQ_PEDING_DAA		BIT(7)

typo PEDING -> PENDING

> +#define REG_CMD_FIFO			0x0d4
> +#define	  REG_CMD_FIFO_0_IS_CCC		BIT(22)
> +#define   REG_CMD_FIFO_0_BCAST		BIT(21)
> +#define   REG_CMD_FIFO_0_SR		BIT(20)
> +#define   REG_CMD_FIFO_0_LEN(l)		FIELD_PREP(GENMASK(19, 8), (l))
> +#define   REG_CMD_FIFO_0_LEN_MAX	4095
> +#define   REG_CMD_FIFO_0_DEV_ADDR(a)	FIELD_PREP(GENMASK(7, 1), a)
> +#define   REG_CMD_FIFO_0_RNW		BIT(0)
> +#define   REG_CMD_FIFO_1_CCC(id)	FIELD_PREP(GENMASK(7, 0), (id))
[snip]
> +
> +static int adi_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
> +				     struct i3c_priv_xfer *xfers,
> +				     int nxfers)
> +{
> +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> +	struct adi_i3c_xfer *xfer;
> +	int i, ret;
> +
> +	for (i = 0; i < nxfers; i++) {
> +		if (xfers[i].len > REG_CMD_FIFO_0_LEN_MAX)
> +			return -EOPNOTSUPP;
> +	}
> +
> +	if (!nxfers)
> +		return 0;

this can move before for

> +
> +	xfer = adi_i3c_master_alloc_xfer(master, nxfers);
> +	if (!xfer)
> +		return -ENOMEM;

Thanks
alok
