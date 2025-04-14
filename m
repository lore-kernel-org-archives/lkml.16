Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB4F1F236B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 17:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744651303; cv=fail; b=V1RLERkpw0Ks9LbTzAb/qvuWMDO02t3k78oB3IMt/aQGsojlTkqENSVN/RMncxsQybm8O3/koLE/Kw2jTdgPOtyI2hnJmnp+9Ib57PBR2CxZzgOiFG8YCgoQj6+maYKN+R3ZnRcp11oXFYtv1fYB6uD8xlFmm0aEVErOUnHImvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744651303; c=relaxed/simple;
	bh=Dx2e1kA5YcES5kFNvyOZNc/eQ9jGj7XbATXa1YW5h6E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=egp/WniJ3E2GNRtKGx8MNfAX4PcSGf0zHBVEItv3SReKPz2+tPlW0mia4ambth939MrBKyRrVwpouRUzEX2QPe8iuC3ICYB6MZCunsGEnOGUmy2WM20d+qY1Lh6JYbXrWxU+n4SQUYs+RIxtKqYmtAs2YmGjGZSndBAKzXmG/yw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Mr+JKEPf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CqemCexr; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Mr+JKEPf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CqemCexr"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EH2ml3026295;
	Mon, 14 Apr 2025 17:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Dx2e1kA5YcES5kFNvyOZNc/eQ9jGj7XbATXa1YW5h6E=; b=
	Mr+JKEPfY4Exk4dXhIJlI017Pb5m9T9+y+e0HrZuk0gc/UC9HOcCDbKmUfwPLK+d
	EDOKFn3AjqrYTAadNSYjKJBtQqc2evlz742jvyJlvSNZPNpwy32H+otCv+2ZgJSQ
	C4/BFdswFjmo1er+194QQbGSMq6Ea9Gw3DH8xjpRbDFdD2bmhKvSNgxyGPtPfBPT
	odO5fAu3Jl+VRoDnxsUg/z8K+OAAO7+Qxj5iWB4ldZPnpzOiS805BVig9yKyxd5A
	2iCkl7R4fFnoftHeetsYi52J9Y4dzCvUa5Y0+rzlL0Bx0tny2iV/2HMXZ2iEq09k
	3tlmGEn23zGIvgHRnnMisw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4616dbr14q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 17:21:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53EFq6Vb038897;
	Mon, 14 Apr 2025 17:21:26 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azlp17010022.outbound.protection.outlook.com [40.93.12.22])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460d4q2nyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 17:21:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pfnoi7kJKnEwKLEi3dG5i52vsAyn1gS/GvOtca6VbqpMhyqU/YqNxcE5MOtrAZsBxp9qpfGzfqz5RBA1g4Kz6SX1tNgyleJWICGrDpLi19rjG7Lco1pZgj0tErZP+c7h8SggAzVfM0d99SbIWjd2fIg7/8xYSD2AY8mCatwqhKn+23YQ4D49g8mTp5fa0mXFyWc1nJKYCuTLIOFN7K76YZhRqtznDSUxwnh1NIMlIPHTemo339CEYzbpd/HXCcbfTXAEb5JAT4+fS+LtX7oF/v2kvuTAbxiHsrYLjuwezbLnAhUcwCCEwYFfJzMb8aQCoWlwVegcWuM8X6/p4gNjuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dx2e1kA5YcES5kFNvyOZNc/eQ9jGj7XbATXa1YW5h6E=;
 b=p2aQe0yiDsa5RLY99Cz3y/jn2Xu4QX8X1g1IozE0iYAiboiCeqoKjxGJIA/mkCMWKbY7ghmHAL5YHhjzkqnrL76CoBfDx08CIxEM8i0FM7OwTeB9HyA/zEna7vtY/F3O2r1ElN8cZsRIv+SsAP/TMGiIT1bqukhUBzuDX6SvxTqoivJjDX4xfXydSmTY8m9UTJ5oHCdszSYdbOdx6Bp1wsUGk+ryCiK1tyM5JuUUgNpBzHxHagdrfQJMe1hohxLUnJTyhPAfbX+FVOQvHlez3yrV9KQ9uoQuI2pJJNytgatbRQn/k8KmqmueVkEIY2TON+xbw134ushRiMQSAvhZkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dx2e1kA5YcES5kFNvyOZNc/eQ9jGj7XbATXa1YW5h6E=;
 b=CqemCexrmdm3cC9M95BzURgMzS7vBW2106bqY5XeBiPT2gDl37AkbG/cPYAZKW+SsHUyHb+EtttaNi3/xXcJyzmcffTdvAU0XbyWZLg3rlv7X8IMPyWYxCHzyOg0u81Q7wHKr1C+SR0DVCe4LpAVaN8WiKlmEI1N5lYMeBhOsls=
Received: from IA1PR10MB7309.namprd10.prod.outlook.com (2603:10b6:208:3fe::13)
 by CH0PR10MB7536.namprd10.prod.outlook.com (2603:10b6:610:184::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Mon, 14 Apr
 2025 17:21:24 +0000
Received: from IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a]) by IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 17:21:24 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: Steven Rostedt <rostedt@goodmis.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>
Subject: Re: [PATCH 0/2] Scheduler time extension
Thread-Topic: [PATCH 0/2] Scheduler time extension
Thread-Index:
 AQHbf0Q2OR3YDnbdnE2tu2zJcXVlQrNLvDkAgC2FogCABeX5AIAgIVqAgARwhYCAAAsDAA==
Date: Mon, 14 Apr 2025 17:21:24 +0000
Message-ID: <64A20C52-04E6-4648-A17B-FF9CAFBC5F32@oracle.com>
References: <20250215005414.224409-1-prakash.sangappa@oracle.com>
 <20250217120000.5ae1201a@gandalf.local.home>
 <821926D8-ABED-4B66-9E2D-39594DB82FA1@oracle.com>
 <20250322061422.2b24f021@batman.local.home>
 <1142C71C-32B8-4C34-BA3F-4D061BA25620@oracle.com>
 <20250414124149.2543d6c0@gandalf.local.home>
In-Reply-To: <20250414124149.2543d6c0@gandalf.local.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR10MB7309:EE_|CH0PR10MB7536:EE_
x-ms-office365-filtering-correlation-id: 06388507-6192-4c22-374a-08dd7b78c889
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?R05ZMEgzV0hjSlRFUkJOQ25RYkp5ck9vYUxNRXR5Q0FlSks0SE1tVDArL3Ji?=
 =?utf-8?B?UndQNVV0a1FHTjJGYzZGV0U4enV2TDZNN3JMd2tRN3grNUZlMWl5ZWwxUGlC?=
 =?utf-8?B?SFQwdTZ0d1ZqM2VQWTZrcWlGQ1ZCY3kwelF1NnRLY21BWVZuOEkyZlNDKzl3?=
 =?utf-8?B?UGpGT3EzL1RWWTQ5a3RYOU5aNG9RZllHTUpoaWtvQ1NTUjRlSEdjbDBzWEFH?=
 =?utf-8?B?b0tFM0piVTdsQ0xWbExUbFZFNHJnbFZGVVBsS1FyL2h5WW5YaThLaFd3R3V2?=
 =?utf-8?B?Y0ltZnZmcFA2bmpjcHMrQUxuU2J0ajRZbEx1UCt3VmI3cEUxTVBubS8zand2?=
 =?utf-8?B?NTQvTlV5b0hiSFdIQkNPNzhxWHgrZHpyMjNMdTJnZ052VS8zbmpITHh0ZDQw?=
 =?utf-8?B?aFdYUkJrc1owOGhEeHB0NDRjTlhGMXlwSmZJOE51bUhrMDQxT3BYQjlaSTQw?=
 =?utf-8?B?ZmpmNzhzUW40c05xZUJBeVhDandhM2xjZlZacytwSytQZElZVkVOaU5hWjFO?=
 =?utf-8?B?MEtQbDkzaUdYZ2VGNjRqVkVWamJYNFNSQmZDQmhKekV2WjRCVDN2RTMrWnBn?=
 =?utf-8?B?SU4xZkhKY1NNNFoxZGNrczFyT2tHd0N6VjJSZDJCaGtaZC9DYnBBM0ZiMXpj?=
 =?utf-8?B?VmM0aDArU0srQ2Ixc0J6UWtBOGJKWlVzK1NzOFdIOEg2QTRRR2dMQnlBY2xO?=
 =?utf-8?B?SWNPcytVK3lhZjhVeDV1K2FQbGJhSElZRjhRcTNnNXF4MEFKOFhQNVVZeHB2?=
 =?utf-8?B?dCtDV1ptZENCaDRseXhzdndyN0ttMlVxNVZIanhYT0VGS0ZraTVyOENHUHB0?=
 =?utf-8?B?K1lMOXFJUkxxQWRUUEVuTWY2cGlleFpqMmpGQ0MwWE5OcTBzZWhLUDVoc3Zn?=
 =?utf-8?B?Q3UzN0ozdi82dVdtY296azNPTzJBQ3NFL2x4ZWxHWW14OTdTV2k5d1QzbC9U?=
 =?utf-8?B?TDZPWkZGczZWcXdPVWJVajF0V0dLTWNDYUJiWGZGU3ZYUkpvTDhab3hPL2cx?=
 =?utf-8?B?UCtzNkVKbjJSb2lMWVM4SUh4WDRaVjlJcVFBeVVxRzNhK3Y5SUhNUmYrWFlQ?=
 =?utf-8?B?YzBDNm94Sm12eE80SXVObDFaMFhZQzFCM0paUDMvN3NnbnI3WFQrZmVRMVFN?=
 =?utf-8?B?NnBnRTJKVVE2NGJIYndQQzFrUHJIZW8ydU1YSWtxeTJXeGEyNkI3ZjZxekJ1?=
 =?utf-8?B?bFNBdGdzRE56bE92bmxybWJLbndpckZ5T0ZRbndnTVpzcjF2RGZNN0NqMFBs?=
 =?utf-8?B?Uy9QS1p5dGdldjJONVpmRDdrM0NxMGFyMjI2ZGRkQ2FRVmFJZ0pmN3o5NFVC?=
 =?utf-8?B?Wk0wVWxFQnMwTkdSbFFTamhhdTl1OFlqelBWODVhaXQ1N2tJRlJsaWpJQWMv?=
 =?utf-8?B?dlhTMTZKdWYveHVkZmpFTEErZGhlWmpnMVBCRjVYb1hna0J4YnZINU8rUmhy?=
 =?utf-8?B?Mkl6K1czZlFLa3RsK2lqdUxXbmZvRVhkcWFYRlBlRFhLUzNFTDh4M0JraVB1?=
 =?utf-8?B?TzZYUnVaUm9iOEFocjhqWHloS1o0aGtqZDJsVDhRVm4ybDFiSi9EM0MzNnpH?=
 =?utf-8?B?NVdYK3BBOG5tVXU3T0ZteGFQeVZmbXFPWHlPSFNLNnowYlhVaTU4Q3RMTWZn?=
 =?utf-8?B?THNZc0xTUTVuZlFXQ0xqVXQxZTR2T0JPL1JYN2hGaHh1TTZvcTROL0ZiTXhF?=
 =?utf-8?B?Q21HRGt0MzVnQThLRmJjSWEyeW9Cb1JwbFJIM3dPMElscXlSR0w0djY3N3cz?=
 =?utf-8?B?bDFQODFEcUFiVEpFTzZTeVRWeXdsSmhiVnJ4cTZHYk1EUExkb01BZVZKV1E2?=
 =?utf-8?B?ZXJFNmpCYWgwRWZxVzc1eUxHQmdwTXlBZDR5aFBTbkxlcWRhTitzWWswcEU5?=
 =?utf-8?B?ak9SYlJtTGlHQUpOekZZUnh3a1UrRGhjOXowY3o3a01adWtodG1rNXA0aExH?=
 =?utf-8?B?QlRFbUVwWFV3bDNJNExwZW96QUxvcytHQUhwYUF1OCtTcExDczV4M2JhYXBZ?=
 =?utf-8?B?WGxQQjQ0R2ZBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB7309.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MmhpbjBCaEdPam85RXczdytlVjg0RUxzQnQ5VWR6NHJMTFJUbmlNVXpPTFdU?=
 =?utf-8?B?Nzh1T1gvWUdQK0pDYTd5ZGt6QXkvbTlzUmh0SXkybkEyNEV0ck8wQ2hOUGly?=
 =?utf-8?B?ZWpQM1luU2dIdlBFWlIvTU9TZzQvSGlDODg3R1EraDgxYUlUV3BDWkNRRGRv?=
 =?utf-8?B?UG5wM3Y4NzllNlF5akNKYWhGUG4zMmJVbVNKN2dUVUlSbnJhbHc5QWFqYkw4?=
 =?utf-8?B?NW54RDk2L3F0TTQybUlqN3JEVU5JYUlMdGQrcGFGMzUrKzMxdDB3d2V6bHRQ?=
 =?utf-8?B?dFhDcm1ucW5uZW9FbFRBSDJrNUgzd0ZrR2cyaHY5TDJKQjhCdmhSaEFiZnJx?=
 =?utf-8?B?WVEzbmVZYWwycWtxUEU3ZHZFNXYycXA5OGdnV0V2NHhMMjhiRmxUUENLNEtw?=
 =?utf-8?B?djFrNzNhMlg1cjhJOCszTVZMeERNcGhsZ3NYN20xdENBVzc2SktSUFBNN1lS?=
 =?utf-8?B?NmZPcTc0UmZ3aXFsd1p2aHZoSDFrNlViRGxFQlpwVERoRmx6endaaHE5MVJS?=
 =?utf-8?B?OThVNzliN0FMWkxqKzNzT01rZmREcG9XbEl3eUNpVTlORlJNaGpYYk1tRjZK?=
 =?utf-8?B?KzZWaFFNZVV3UTRKMG1PazZZWE9wQ2R4R0NLMnlTNEZIUk1XeG9hVm1yR0FH?=
 =?utf-8?B?cTRaNUVIa3VZK0xpK0xGc05vcUtrSEd0cWtrdGpmTi9iRlQwclZKbE40ZUxD?=
 =?utf-8?B?cGk4UFBONUpQTDlOa09FWDB2T2Nsd2ZtbVk4TnhueDJ1STI0UlJKZWJtdmJx?=
 =?utf-8?B?bStCd3oyV3Zudy9kTGJ3MXlXM1ZqeW9wSkFGMk45eGtoNW5ISWJxaC9JSFhV?=
 =?utf-8?B?cHg3Vi9PMHdTQlRGdXBSeGk1eUxRS3lYU0k0MVlxSE1pa01Ba3plZng5bUsr?=
 =?utf-8?B?YVhpcjd6N2ZQUmNUdU8xcGgxc1JJSUdSbTNvSzllYWxTeHRIUHBlNEJUS0Fz?=
 =?utf-8?B?QXZ3cSs3UlIyUGpxWXhNdjBVY2tZRVdzSFcyTVE1eWN2dUM0dmlkSHM0SFlv?=
 =?utf-8?B?NVpOUTRyS1VIdCtjRGJhS2VUMkxrWjhEc2F3S3FXTTVzT1lFWXI3ME9LUDc3?=
 =?utf-8?B?alo3d3NVRDA0MjRoV2crc1JKeThhZUptenY0STcxM2IvclBRVHBWcnZNallX?=
 =?utf-8?B?bGJCc1U4ejZLNGtOb3N1cVEwMUZkL1U2M2Jscnk1QVVCbmlBTFFKSFBOclVx?=
 =?utf-8?B?Y3ltNHhRS1RLdm9PVUpMZE9WZFhRbmNtMGZNVlN4eUhTT1djTzJIRnpkLzBt?=
 =?utf-8?B?V1c3VjJOd3hhamM5ZUtFTnZtaEdmTnFJRmFyQnROcGNFZmFWZ1JGM3pHVEtH?=
 =?utf-8?B?MjdQMzhwTG1FZWdLc2tNRDFMWllSU1VFenZ5WHd0NXFEb2k3SEducjBoakE1?=
 =?utf-8?B?THpkU3JUOGpjYWdJZUZPZlFwcFlEdm9PMWhwNlUwT2h0eVdOQVhvRHZ5Y2lG?=
 =?utf-8?B?eHNtVkZwRkpkdjlPbkQxcnh3dmt0c3BnVjF2R241MUhwY1N0N0V4UWFNank5?=
 =?utf-8?B?R2xLQXo1N2pVL3JPUzIrbWlmTFFmd0FhWHFSa3ZlTS9CT1UrVEhmMWVEMDY1?=
 =?utf-8?B?NFNLYWllVW1UTFVKRTFhRkVkUENYT09sRFpnZk5JZXFlYkN2UU92MFNvZm9w?=
 =?utf-8?B?aXd3UGFNaE5rUy9wT3JhU0ltZEkyRGNicWJOSFR4NDRWU1VOQlFzdXR4d1Rj?=
 =?utf-8?B?OEVSOEhnTEZZV0tVVWJhc3p3aSs5NVFYMDJSWFl3bWlYdGNmdjYzZHRKb3pS?=
 =?utf-8?B?OVFxaU1aRlVlcjYxK2p0YWNZYkdTUmZKcWtPSm5SUTIxNk1xc2U5UlErZHR3?=
 =?utf-8?B?dVcxOU92LzJlSjBUb0l6dlYrN3lVd3BwUUg2ak9oTy8xTzNYOGhuYjJlaWRX?=
 =?utf-8?B?aW80eUJwSEFIdDJjUWxpUy9EV0QzaHEvUE9IWTRidlYvZDRYbGpQS2hibStF?=
 =?utf-8?B?NUpibmFzMi81QXlyeGpVUnREMk1WSWQ2NUMyRFIyNDFoQ2kyN1BNMXdTMFQx?=
 =?utf-8?B?WjNhVnEwNlQ1cXVCMCszL01hMnA2djlPaTdkaDNBbmxSOHlwYm55ay9tUjE2?=
 =?utf-8?B?RGpTNjQ4Z2xOSUZvT01WN2gzdGg5MlM2TXhKb0hTYjBRK2pzS1EwT3ptOFlZ?=
 =?utf-8?B?YjBSa04yUTJUSnlWaW4rTERZV3FPUXZaUU5RY3hwd0Zqb204QUxVeE91T29E?=
 =?utf-8?B?RUhvQ2pia1E3RXY1K2NUeUlFejdmVXpXOXBKSjUzWmE5d0hEUlZ6K3JhV1hD?=
 =?utf-8?Q?TYW+vVQdyN4mRv4T6p3rjWmamBCZ4gI9YWaNjLkNMg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <05C517290A01CE41B5F1948D60286EF7@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7sAxxj3Lh4GV1eLYWQwxB1UOLefOvMrUsF7OII2sdTLsVJacUUg60J/7nVr56DcdHq6+J2ng6UXWp0YvYi3uAtObGZVuB2HJuzd7AsvGT2Mhx0JcvOgvX2Tc2mJ1tNVyuYhh7vbYecpKCLKaMQ/rpeUyUSiugHgor1MTyI2POSSxl++gKy4XpoAtrYxds0kH/d8QlyyfqC7KjbjDyY8l0maxgDfIn7+J9VxJS0qSs266Ixvc7YoHIZpy1BAI/fJT+L4TtfCC7iYe7uT3LCJnBB+rIRnGMiXbpDm9Am8xib+/hHzf/8D9HM3oY/GYdPvURdStPGRw5aRik7ThpGi3Gu86kz/ayycqtZi1VQlwkZv0/U39igozHgxsykCWDodF0QvR6tHfmgKvCKbVvpmpPbymaslM9Y/mnM0XKdShbHaeXoYi5boFqjLhv5T8zWtMS5/ui6ZEFfd7J7lmKqsuQ8UvP3HaaAJDo9MR7t6Cb29GozDnk4Gbr6npxv8vD5EyQEDkPfhRXp/CfXSovGw4toQAD7hTSWAFTOiYxxOAj6cUb69hLLlX39Ie9H0kTmZ65QWQum5guvS1V9g+edcxrB5eKSo3TL7Jdb3hdFl0oSI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB7309.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06388507-6192-4c22-374a-08dd7b78c889
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 17:21:24.6707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i7htykWo7in6EsgcRVEFjTRhEZAPc5LgGJXdssir7oWIOMSQTjr9TT2xR25vHYS8zZfHjClA56DIOg5pEUpp2Yae9qadIxOft44VXUcLaa0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7536
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504140125
X-Proofpoint-GUID: TZChP73DFnIl-f6JeFdSlchgDocEeset
X-Proofpoint-ORIG-GUID: TZChP73DFnIl-f6JeFdSlchgDocEeset

UmVzZW5kaW5nIC0gYXMgdGhlIHByZXZpb3VzIGVtYWlsIGRpZCBub3QgbWFrZSBpdCB0byB0aGUg
bWFpbGluZyBsaXN0Lg0KDQo+IE9uIEFwciAxNCwgMjAyNSwgYXQgOTo0MeKAr0FNLCBTdGV2ZW4g
Um9zdGVkdCA8cm9zdGVkdEBnb29kbWlzLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBGcmksIDExIEFw
ciAyMDI1IDIwOjU0OjE0ICswMDAwDQo+IFByYWthc2ggU2FuZ2FwcGEgPHByYWthc2guc2FuZ2Fw
cGFAb3JhY2xlLmNvbT4gd3JvdGU6DQo+IA0KPj4+IE9uIE1hciAyMiwgMjAyNSwgYXQgMzoxNOKA
r0FNLCBTdGV2ZW4gUm9zdGVkdCA8cm9zdGVkdEBnb29kbWlzLm9yZz4gd3JvdGU6DQo+Pj4gDQo+
Pj4gT24gVHVlLCAxOCBNYXIgMjAyNSAxNjoxMDowOSArMDAwMA0KPj4+IFByYWthc2ggU2FuZ2Fw
cGEgPHByYWthc2guc2FuZ2FwcGFAb3JhY2xlLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4+IEhvdyBk
byB3ZSBwcm9jZWVkIG9uIHRoaXMgZmVhdHVyZT8gDQo+Pj4+IEFyZSB3ZSBsZWFuaW5nIHRvd2Fy
ZHMgZW5hYmxpbmcgdGhpcyBmZWF0dXJlIGZvciBTQ0hFRF9PVEhFUiBvbmx5IHVuZGVyIFBSRUVN
UFRfTEFaWT8gIA0KPj4+IA0KPj4+IFRoZSBtZXJnZSB3aW5kb3cgaXMgYWJvdXQgdG8gb3BlbiBh
bmQgSSdtIHdheSBiZWhpbmQgaW4gd2hhdCBuZWVkcyB0byBnbyBpbi4NCj4+PiANCj4+PiBMZXQn
cyBjb250aW51ZSB0aGlzIGRpc2N1c3Npb24gYWZ0ZXIgcmMxIGNvbWVzIG91dC4gIA0KPj4gDQo+
PiBDYW4gdGhlIEFQSSBiZSBmaW5hbGl6ZWQ/IFdlIGhhdmUgYW4gdXNlIGNhc2Ugd2hpY2ggd2ls
bCBiZW5lZml0IGZyb20gaXQuIFNvIGxpa2UgdG8gc2VlIHRoaXMgZmVhdHVyZQ0KPj4gbWVyZ2Vk
Lg0KPiANCj4gSSdtIHN0aWxsIG5vdCBmb3IgU0NIRURfT1RIRVIgdGFza3MgYmVpbmcgYWxsb3dl
ZCB0byBkZWxheSBSVCBvciBkZWFkbGluZQ0KPiB0YXNrcywgZXZlbiBmb3IgNXVzLiBCdXQgaWYg
dGhhdCdzIHdoYXQgUGV0ZXIgd2FudHMsIEknbSBub3QgZ29pbmcgdG8gbmFjaw0KPiBpdC4NCj4g
DQo+IEp1c3Qga2VlcCBpdCBjb25maWd1cmFibGUgc28gdGhhdCBpdCBjYW4gYmUgZWFzaWx5IGRp
c2FibGVkLCBhcyBJIGhhdmUgbm8NCj4gaW50ZW50aW9ucyBvZiB1c2luZyBpdC4NCj4gDQoNCk9r
LCBjb3VsZCB3ZSBhZGQgYSBDT05GSUdfIG9wdGlvbiB0byBjaG9vc2UgdGhpcyBmZWF0dXJlIG9y
IGFyZSB5b3Ugc3VnZ2VzdGluZyBkaXNhYmxpbmcgd2l0aCBhIHR1bmFibGU/DQpBbHNvIG1ha2Ug
dGhlIGRlbGF5IGEgdHVuYWJsZT8gQ2FwZWQgYXQgNTB1cy4NCg0KV2lsbCBzZW5kIG91dCBhbiB1
cGRhdGVkIHBhdGNoLg0KDQotUHJha2FzaA0KDQoNCj4gLS0gU3RldmUNCg0K
