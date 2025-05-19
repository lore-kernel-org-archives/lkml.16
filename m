Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A36786329;
	Mon, 19 May 2025 00:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747614600; cv=fail; b=DYnB5Khf5nI/vTrxYCKduEecxscwGqiHveG7ahRrfhZe+09nEnrFqwx631ykSmG+wrQgp1vnvIwqniMvj+n1S32kQb1ewbrXIUA5dbl0IcDJJ5ZxKcJVsEPpLzjW0e2d6AXdaCtpr8F8xTzORlD+8TIhO8Acs5cuZ5ZoyVC6JJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747614600; c=relaxed/simple;
	bh=kUIW1kTDcx3q2A2rKeqtF0pZDCJnV9sVgHupid8GR6Q=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=rqCJuXflJ/22d3O6MPAanPJTJ7143j96g0aTOgftPxb2hULqz/LhqPvPXydjMsMSbIlOixZm/ckaC8NJHVuoy2opph9vvyLqxAzbtEarwtxY41+BqAl8RgnK/qMnLIBdnVw8qT06z3DjU7M1/F/CgDnTHKcCHoSsnnfxHiaWWGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gperkPWu; arc=fail smtp.client-ip=40.107.92.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gperkPWu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hHNCywDWUySgAhF+id3QinUuPYOT2GDjwKLdRmBXOB1bCmKn+YsPsuFgxRo0ikihXk8q+wBYAbE+Auq+7CvcjlhM/ZLQQ5eFdzgsgeX4z59sMhaWSo4F41kolR7CmsvxZifoM357JHKRhMOmEwh9mhTTcxx8vwSpzeLERTSlRcYIxaUzHX4iqShDkMF80PJam3GLosMbmlDn41yZvs0gzALBZAKmUu2WmVto3eCRNI6VmdPT9PANJanYcTU+ep/UKzIvLjebUWYvnEoZtRbllKn8Q91ERzzwHq4/Y7XoJ6fZks5XifYOuG+9UbVdwKo/3ltwHj1gdnx9Nglq1DdBpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUIW1kTDcx3q2A2rKeqtF0pZDCJnV9sVgHupid8GR6Q=;
 b=r0/t58NXOVXLhUl+k+M+/eaKZvAKT1PBWAHYWxZYEhxH+RrHKwFz93UswXpmWSsPabXk7T2FBOI6qDUEQ6WCuAg+iqL3ec1AnMIgXQkgC9U0xu4/dLVmA2isrkF+1lxFmTnsRvRkikjm3qgSroqd2f1789qSko9ZADN5ShPcyhWizjmGyuRyy68LazkJm60xh3dpe4STa2omILdgFwYTz79I7yDOFXbPkx9DC1ONDG+ejban7+gMvMgxGGfd4SNzBp286/lZr4e23GLJPrmhzQwYO82o2eYetdAO7lwel8mDN3S1JamSAB5zAnQcS8uD+q46joO4+W0CmuQEsGxLMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUIW1kTDcx3q2A2rKeqtF0pZDCJnV9sVgHupid8GR6Q=;
 b=gperkPWu8m9pumoORUTXBiQmpCXsgjWEX3k0Iq636Ztp269oUj3mpjBsn+sOt4M9m6XaqILfFj5sd2mPed05evH/C5EfT+Hj3KKjjf/+dm6bwzN32u7aMwFVrrW706G/mcz3ZOoKXQsCWTYv7ZJbDAmk/0r9XNQU7FEi9QlyG0H7wVsYMcu8xLweVIxvhddyLObaxP9z0SlBLKUdBcjdY8ehsI3Vuy5z0KOsVBLjLE0DFaRNPleIjY5LOHXJY26upD4qyrC8ZIaqoa+h0c+XJXuMJkok2z8yecIgg+rjcB3c2zIdlMq2yIa7X9woqey7pWXmlcqB5uazGy4i0GEtjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8017.namprd12.prod.outlook.com (2603:10b6:8:146::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 00:29:55 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 00:29:54 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 May 2025 09:29:50 +0900
Message-Id: <D9ZPO3LUEPJL.1S7W35YQJA54O@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: regulator: add a bare minimum regulator
 abstraction
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Benno Lossin" <lossin@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Sebastian Reichel"
 <sebastian.reichel@collabora.com>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9YXK1J1XO37.JVILKENRKYXD@nvidia.com>
 <D9Z3R4EYAXV9.211IFNRTOPM6O@kernel.org>
 <D9Z4XGQ2QHXA.2H5X1NZ5IZECC@nvidia.com>
 <D9Z59JWL4BTC.3DTN0LWCJX5AZ@nvidia.com>
 <D9Z73XZUSYWO.R0P38ASITWR7@kernel.org>
 <D9Z8PLIZGSJ6.254ICGG44E4PB@nvidia.com>
 <D9ZCE83VYX50.3415QQDCN4R0G@kernel.org>
In-Reply-To: <D9ZCE83VYX50.3415QQDCN4R0G@kernel.org>
X-ClientProxiedBy: TYCPR01CA0028.jpnprd01.prod.outlook.com
 (2603:1096:405:1::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8017:EE_
X-MS-Office365-Filtering-Correlation-Id: eba08871-5dcb-4b61-7d1b-08dd966c46ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVZTRGRxWTZYWTBjaTRqemhTaU45Z3U2d2lmRzg1czhuL3pYc2syMUZxcGhI?=
 =?utf-8?B?MnVKYkNQLzFPY2dETVlFSHNxMTdzVHNCRkUwMm5BQ3FCVnB6c1ZTTDNOeGdV?=
 =?utf-8?B?ekUyMTY3bm41eHpvbGFoZkptRi9EczlxVmF6ckZFV1JVWGlKeCtISEtWOVJ2?=
 =?utf-8?B?ZTkwUFd4MjNMRkJmTnM1VjlodmdPYjZxem8rejFFYTg4L3NybUNwUjh6MWdQ?=
 =?utf-8?B?aE13RVNycUc1bzJUeEJ1aTVSUWZKY0ZPanUwN3NSM1JPS0VwR0hqbjBINHJZ?=
 =?utf-8?B?UnZGRzcvaFZyeFk2cWR3QTZWZmt2dDhic3VLT0dxL05UVWRyb1BCSjZUUms4?=
 =?utf-8?B?M04wYWdpVFlhOTkrTlJ4VU13WnJZZzdoL3FDT1VidFl2eW1TcTlmdFNyNW51?=
 =?utf-8?B?d2grSEFzaURIUDNlTkFwTUYxV2Y1aUxseDdLZTNyaFF6bm9TWTNEQk9OSys2?=
 =?utf-8?B?S2RlZ0dCai9iYXVPMlBrSXFsYmxERkJyTG1XZEFTN3QvYXF2QVdYcW5hY2th?=
 =?utf-8?B?T0tqWEFtQUpKNXRTOTh1Sy9ySXN3a2hsbXhDRkw4WkxMelN2Uk13Q2tabnRF?=
 =?utf-8?B?T1NRS3UvelBVeG1ldEZNbjRTY283UTdVUmdlTTB5dzB5NGpqZXdaemtZWDkx?=
 =?utf-8?B?aW5uemFYb0c2YnJ4ZTBYaytnaHRhWTlHTUJvcFdXdU5HWHp4TjJDYkNLczlz?=
 =?utf-8?B?UkZOTmZ5WlJWMW5zb1NEM3l4WTZkYXl1OTc0VHc4L0luK3lGMUVCdXN0K3pZ?=
 =?utf-8?B?c29IQWRUT0NUclY4bWhYZVpNWmpOeGE1NGt4K1JPclJRS0FIWmpxR3R2VFBO?=
 =?utf-8?B?RFlubmpaOWROMHNXNFVGVGlNQ1RsRStZNSsvTGUrQy8wV0NENmNyNmhLSW91?=
 =?utf-8?B?WjlyZzRveTd2dmFVZFl3Z2Z6VitPemdWdzZ3aklxa05GRWh3dmlUNFpWVXNU?=
 =?utf-8?B?Y2xKNVVwdzI2Y21xTVFQdWRBelVXL2hjYkt4NXlkMnNsVkNoNCtrQVRadUQ5?=
 =?utf-8?B?anVWWFRlUXJnN21EamFwcHcyRVJlVjRac1lkd1RDNk0ycEYyZVhLOUlrYkxD?=
 =?utf-8?B?S3hlRENKT2lHUmZtQXRpUkNkNDBHeHc1T3dGdDFvN0ZTWXNsRk1nSklUUER2?=
 =?utf-8?B?WUxjTHR0RTl3ZDRXRXlqWTYzaHZ0TFZ2UjI2VGJEUnNzZlAxRkg3cERaZkM1?=
 =?utf-8?B?QVBCVE5xTE9zZ0M3QWdvY3N0OXBuOCtRWjdZYmpPVHBhcENUOE1idk1RdFZD?=
 =?utf-8?B?Zy9LdWFJdjU4ZEhuMWJwd3R1ZzV6L1lJNFdQdk5sNjFLMENTMkthOFhFZHRJ?=
 =?utf-8?B?YjJzN2lCcS9kZTBNdHQrbm5BcjdSSlBHeS9VV1dMRjl3WGRWeVBIRGZ0WkI2?=
 =?utf-8?B?Q2RObGxJSzZOY0NsZ0VwaExxdXRYVFFTN1JZTGZPdU4xazdFeEcrZXA5L1U3?=
 =?utf-8?B?byt1bkpsdUdDZWFVRHhjallVcEZvc0NoV1p4K2NyV0VES3RvR2RvdG0yUWts?=
 =?utf-8?B?cEtPcFZqMjFoSnd4czBmWGRhQmJMaWl1Z3FQekFWVGl2YzVCVXMvVXBkRzAz?=
 =?utf-8?B?WlplRFdkcnlLbVU2TGdTTnlzVzI1KzZVODF5dE4vZVZ2NEVkNFpBVE9UczV4?=
 =?utf-8?B?SXh0aW55RW1nRm1MTWNyU2xXcnducnVzS3F2bXMydWFDV0JOd0pCME54K3ds?=
 =?utf-8?B?S1lXSzdxZFp3RFIzeHArVmlBeVZmQWJQdnNNckdrYVowRGZNNVJEL2ZFaTAw?=
 =?utf-8?B?NlZmajFlSVNUOFUvd1kyL3pOdjRBU2NUZWIybWgvOWhaak5od0FkL2M5MHFL?=
 =?utf-8?B?bGNUdFdVR2JRR3A4QUF5RlUrSHVGK3BOS2UxbDZscllmNUcvdzdnRThiK243?=
 =?utf-8?B?U3E1dXNpNkpULzUzaXRmd1RtOTRHR09JTmxpTVMzbUNCY0VhLzBORVlIVTZD?=
 =?utf-8?B?Y2VDalRxVDhiczU0ZjQwdXl4d3Y1TjF3WFQyeGVkejM1SUZrL3NvejRSd2tC?=
 =?utf-8?B?SGl0V2dqejJ3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkVoOUZFOHBkVDdQWkhTTTZpWUZzQnhaNXFYbHFuOE8ycTdnQVJMUTJrd3dw?=
 =?utf-8?B?a0EwMk5tai9pbE1PMS9KaTNEclZsOEtNS3JxZnJldXlqaEUrRFM4QzdDbEFz?=
 =?utf-8?B?bzQ5SXJWSjRwRUdyUzhjL2hWcjY2VVY2OTlUYUsrZHNWcVFwdGd4VWxzUGJV?=
 =?utf-8?B?UmVYaVJOQWRqWUs0WUxIVy9GU290ekg2VENnS3hpdU1uelhCa1pQa2gveFVs?=
 =?utf-8?B?aWJxOWxQSkdsZ2d2eWJJSVQ1a0owbVY5eG0yZ05DSWpKUWo1YkJsclR4Vksr?=
 =?utf-8?B?bnpyQW15aVZIWGs5S2Nmcm5yMjl1MDFpRHlXZWJvMThjN2VvcG5EUklqZUhj?=
 =?utf-8?B?UEFoZHg4cFpHTUxpS1pGb2VyS3RyVllIbXdJUDc2cmFkcmtkRnk3QkJNM2dl?=
 =?utf-8?B?dkd2UWJGSVhFUnMxYlRBZ2FCTDlUQms2aC93OUQ3cDJ1eDJBY3NYOU1UVlpX?=
 =?utf-8?B?cWJXeEx3YkZoblFmbU5WaWxnU3NZN2ZvdEtMR2RBMkhlM1Y1T1g4d3RtbjJ5?=
 =?utf-8?B?WTBYL1NnOEdJeXNTNGtlcVN1alBuUjlTYXlqV3ovaUd5dE1HVDB0WFZkZExH?=
 =?utf-8?B?OGthb2s2OUhmSGpyU1V4V2F2emRFYmp2cXM1c1QyTFpzRUViQTk4L1NJZFQw?=
 =?utf-8?B?eVd6V1RTeVRHaHQxNEMrTy9hWmdUUFJPMjRtMkUvWHhtbGMvUVBicS8vaENo?=
 =?utf-8?B?ZmZsUFNtdkRUbDhJUERLZDk4WFZLSThORGlPWng0cU1OSjlrSHJLSjhsbjBa?=
 =?utf-8?B?Y0ZMWjV4OGFTQ1NQTUd1ZXZDSzBKTUVYbUhlZHo5WWlGUVR4anVuL1B4Rkcv?=
 =?utf-8?B?ZU1OV1hzWElweW9vME80UGIvUVM2U3JMUy9yYWE3RmJHUmwyckxvUlJwSFc2?=
 =?utf-8?B?WWZ3c2UyMWhzV1RvMkNydFpRbUJ6WS9JaHJUdmdPeFpiRG1IdGI3TGlNb2U5?=
 =?utf-8?B?dXJxVEx1STlQNWJDalZyVWJsbWY0MStHUG55QlZHZVJaaDNWaDQ4STJZRWVF?=
 =?utf-8?B?V0tESnROdVQwaHo3V2hodHE2REJWbDVLVS9KdjlTc0RLYXBROG5rbWN6RzBW?=
 =?utf-8?B?MGZ1eFBKY2RxV0FiTFpBTEdYT0NoNEJUVkxSODNEd0dRR055OUpad01MTTlJ?=
 =?utf-8?B?ZUJYek9qazRoTENHdXlQRmk1MmZrMWlEcTlnM0MzQlFxMEYrVEMveW0vbVIy?=
 =?utf-8?B?R29JOTd0NTc5Z2RBZmtCdCtpK3lrU29uRmRYRldLdkJ2bWYwbEQ5QzZSaHJU?=
 =?utf-8?B?a2ovTmZTNTlpVkdpNFhZOVlVRnIzejlEZHlPNEVMSEtWdlMwSm9CTlRHaExj?=
 =?utf-8?B?ajJUcFdhbE9mK05lZ1R1K1RIL3lGaWcyWSt1eWw3dHBpQzdzdEQzSDBMQS9I?=
 =?utf-8?B?WU5Jbm55UXFoR2RENDM0RmdISHpXOTFTZGxpdEtQbkZZckNnVGVLaFQ5eHV1?=
 =?utf-8?B?REkyaDFpcVViQlRLWmovZ0ljVTJiczk4bnFCeTJ3VWR6SlB0dXZUeUdtUktK?=
 =?utf-8?B?dmpQOGNVVERqVE15SEt0bVBxU01zcEhnRUZVMDUyWU9XMmJzNzRhRnd4ZkY4?=
 =?utf-8?B?ZmgzSWI5c1FUVzNReGpFZXE3cndQeHkrdzlCSzZaNTNGazN4NzNEYXpBNFJX?=
 =?utf-8?B?L0cwQVYvSmNaUHFKRXFEWFpaYUVkWWtKTU54dDYzWXZYNnJjVVRFMGMzejBU?=
 =?utf-8?B?ZkExU0E5bUtWUnFSUlhEWVIrZ0luUTIzZ0pnTmVMam5uNlFScXFaNmlXUHZF?=
 =?utf-8?B?cm5WMHdKY3NQTE1Gb2o0VWZMNC9mSTlGT0ZBOG5ZMGNQcnN3OGFlM1pZUjJz?=
 =?utf-8?B?N01PSXlMeTh4enJnaG5INEtHeTU4WE9wSzYrdW9HaXdJbzJld1EwYUVXNHc0?=
 =?utf-8?B?cjlWQVZqUFA5aGI3dW9uWkJLekpRT0dTVWk3d2luSHdDTWM2OUFpVWRRMHJw?=
 =?utf-8?B?dDFzS3lOV2FmckRoSkI4OXAzRHgwam05N3QxaVhvTEZDZGFmVldselgrWURz?=
 =?utf-8?B?Vjh1aFkzK2J0bWNuZ0VQTURMSnVzeFZwMURJTUFzR2Jwbm9QL1l3MjdlcjFV?=
 =?utf-8?B?R0UxSWY1MXlXUk5pTWFnZlpYU1diMEljMmlYVWRhOUsrS2tnN0tvdHdmQW9y?=
 =?utf-8?B?RzZvcXduUDNBVGtyVjFST1E1VEpudFJjNERIK1czUzE3WDlmeUg0TUs2QmlX?=
 =?utf-8?Q?HiXVXABa6DxXun07O8GLqnksnKCirX+pSMYdFpqSlPE/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eba08871-5dcb-4b61-7d1b-08dd966c46ae
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 00:29:54.8341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f54TnR4EnV2FQ3IayZc1Fk78yLBrJkRQOvr5mtOZhavdPvpQj8gWHUhtGL+M6NSRoeFzjL25jhmTkL4yCl/y3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8017

On Sun May 18, 2025 at 11:05 PM JST, Benno Lossin wrote:
> On Sun May 18, 2025 at 1:12 PM CEST, Alexandre Courbot wrote:
>> On Sun May 18, 2025 at 6:57 PM JST, Benno Lossin wrote:
>>> So just let users ensure that they always match each `enable` call with
>>> a `disable` call in the `Dynamic` typestate?
>>>
>>> That is ok, if no memory issues can arise from forgetting to do so,
>>> otherwise those functions need to be `unsafe`.
>>
>> There shouldn't be any, the only side effect would be that the regulator
>> stays enabled when it shouldn't.
>>
>> It's also easy to implement more behaviors using more states. For
>> instance, `Dynamic` just proxies the C API. But if we also think it its
>> useful to have a regulator which use count is clamped to 0 and 1, you
>> could have another state that includes a boolean (instead of being empty
>> lke the others) to track whether the regulator is enabled or not, and an
>> `enable` method that only calls the C `regulator_enable` if that boolean
>> is not already true. That way you remove the need to mirror the calls to
>> enable and disable, while only paying the memory overhead for doing so
>> when you explicitly state you want this behavior.
>
> Aren't we then duplicating the refcount from the C side?

Not exactly, we are just tracking whether the consumer has already
called `regulator_enable` or not. Unfortunately `regulator_is_enabled`
appears to track the enabled state of the regulator device (not the
consumer reference), so it cannot be used for that.

Maybe a better way would be to have a Rust helper that returns the
`enable_count` of the regulator and check that instead. And to be clear
I am not saying this one is the policy we should follow - I just want to
illustrate the fact that the typestate pattern allows us to implement
different kinds of behaviors.
