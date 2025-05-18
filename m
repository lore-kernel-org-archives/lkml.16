Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAB64B1E5F;
	Sun, 18 May 2025 02:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747535303; cv=fail; b=WtzMy7b/2cc4ijnzFJrUESTGWWuaCnGmzrDAFuqxwiZJtHbv46RxVrqSglA5RL10vvSnAJPfxNPFVqV1hdJFK3wJVXdtQDSHugiHrlbM7hooXYZMdwdT3XEx4Z5TRNSpbbiildVw8C3134aZYmYOmP9ii7c+xzryHLP1Seszwvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747535303; c=relaxed/simple;
	bh=/OvqKeqkGIEtcW2f35Vol47kIlQbphYLDiKQVKm6+Ss=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=P809doXX1WMIUWf1IVm3hi4S48c+EIvnLc8KCPiyk+lPUKnCMI36c10g9mmEVAzI7BqD/gx/7FgGBAazbRH14pwUPYI/MeWC0Lb9nCe6wTD7dUsbEgJmlHD6JA13Uu1a5XquyWAAbElgHcFEnH2LT58YZFeK1/3l98nc2jLPFAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tVykpffO; arc=fail smtp.client-ip=40.107.94.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tVykpffO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9mkNFh8R3yosu6O5A7MwC4IMySWxMjd8TWYptTJGZZ45S4PK2ZKV72o1VE65ZCa4kO0dgtduinM+iNZ6vjVx9+YLjEpFdsh3OLR8yA5T5XOSlb1ubgUUiIpyP/diJYpTmH2wB1aHP0P3d3FgAK9d1uq49R1neD1XU50gibjjdWxco2CiTl0PRkOZjQuLxeDrZVJjTlL+kleniNZHxW1Tegj6mjp4f4LXAiSjgccGzy50MkF85HarNDGqkYqDdjRmFKb5jAcuJ8MEwTwxhBqOguTOyf3SvkfIj+I2w2CKQ65E/RmdzNyMtiqu66Xtzt7pVwUNH3f/4ReFckQHgMCcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igJMRTRDKePDLN275PHHgSAIprXSjZd4zW9EyqoLWBs=;
 b=XeWKzXZNwVrDmkOJ+svPFeeZYoMUyIWn5ttPiyM2stBW+G2WU5eMv98ubeGjHYA53PU+2YEQm9vnKjpp99K29GoO3dNzqz1O+MHmjgiaag/fk3oPXwqX5myLul/bvtfEp59L4BWW1ZeItoiS/TboqtrU8AKaYcWbBuazjyw9GI3UShg9O5GzBAMz6DWLxhXQSp20ptWMsN2b3tJPuzwroV6vYHzof0WkNYU2jWwQXBcEt+7lXwyw5VYKrQiRRCu1hQpWLBAJqjB0H2h2+yU3r4jv0sj0BtKkNSMiZ91Zndzs8LfnJbpFcdm4Tgg2z78YC2wYEN1uO2FwytReEW9ICw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igJMRTRDKePDLN275PHHgSAIprXSjZd4zW9EyqoLWBs=;
 b=tVykpffOP3SYvGxDfAzvhUafsPcQFwnNTKmqfhVU+AeMcefx+QTrAqQPagtW+surDQEkl0gQ8Oeqb4B+g1JyMAa2ob4+PJBmJaSvObEb7Ae2+a1uYE9Fdv1hsUxWTJxCXsPk0TOiqKJkLEF4QDiYhyh4YJrcN5klt1gXsT6/OKY7Ef7ZI12poP+/cF2HCqM1FawPOqqdai29vpSF7y0JxTsMnacPo3H7v+4KJDd3UZFR9240b10wBexFblE7HbEc79p0eMrgBjgAGUyU7gN93GjQjFWdqFjZGcTFVn3ilsFrSYcVreNsSdwb89+xeDwpvg6ylwNkHNnzzN+hPRzxMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL4PR12MB9724.namprd12.prod.outlook.com (2603:10b6:208:4ed::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sun, 18 May
 2025 02:28:18 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8722.031; Sun, 18 May 2025
 02:28:17 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 May 2025 11:28:01 +0900
Message-Id: <D9YXK1J1XO37.JVILKENRKYXD@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Daniel Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Sebastian Reichel"
 <sebastian.reichel@collabora.com>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: regulator: add a bare minimum regulator
 abstraction
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
In-Reply-To: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
X-ClientProxiedBy: TYWP286CA0029.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL4PR12MB9724:EE_
X-MS-Office365-Filtering-Correlation-Id: 85ad0a56-0f42-45a4-9474-08dd95b39eac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7416014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZmdPTWdhODhSKytHdlBaZFNNMlRrUGNjL0NoVjAzT284RkZZQWtDQ002b3VK?=
 =?utf-8?B?MnB0NUJ1YWtiUi9lOE5wS1MvUFJ4RkNPR0FpYU11THJMWmxYcm5BWDZjeDBh?=
 =?utf-8?B?bWVBSzVVbzBBNXNnaUl3MGhHdEZBWFBOakJpVm5jeGhuYVRwYVp4djRmY3Rm?=
 =?utf-8?B?R0hSWis4ajB0eEZaR3Z1MWxHUGNQZWpid0ExWlg1ZHNZSXI1TnZMWkFIazJv?=
 =?utf-8?B?YXAxcnBYWG13ZHFtRmJJL0pLVFEyTHZGUFpvY1N2TTN1WUtIYVdEZ2pZRzRi?=
 =?utf-8?B?TTMrTFNNa2RsWElWSlRqL0hrNVJRR0VRMVpKYmIySUoxblI4bmNDbk54ZDBa?=
 =?utf-8?B?blpDRVRUVDZCUXI1ckhhamlUSnhkbVU5bUg1MURhYkhNa3dSaEcrMXhIWE1w?=
 =?utf-8?B?TmxLSU9GaGlsU1FhTFN3Qy9xSnBzcDdlNWV3UGY1Q01NMkRPMXRWTnJXRThZ?=
 =?utf-8?B?M1BMSmNmSXZmc3o3b29lRUZGb2xZViswQ25USjZQSi91bTQ3N3FRRGd0N3RN?=
 =?utf-8?B?U0U3WHZXakpWaDRqNmdDWXRsT2loK2J5UWh4NTFtd250Tmt4U0d3YlBzREhx?=
 =?utf-8?B?ZEthVDBHYlJpWksrT05WbHhuRGpzejVibHFQdDRjVXUyTlZCOSswSmdCbDJJ?=
 =?utf-8?B?Z3RaVEkzQ0NDU1lIbTdtMjRvd1c2dzV2ZEppUFFuWlV3d2MzT2V3WUcvWGly?=
 =?utf-8?B?ZlN6c1o4K3dCbS95TFVKYVVVbStWS0NRSHZxeWF0TERrcEJ6TnMwY0J3MkZp?=
 =?utf-8?B?TGpUWVM5RE8ydUpPRmRiQWJiOUNKODJsZjNjcVpqTEpTa3JYd1FvYklDYlBp?=
 =?utf-8?B?MWI4T2xvcHYveU5RYXRic1ppMStEM24wNk11aGo0TC9MNVJSY3NrZjdvUVNo?=
 =?utf-8?B?eitRVmxSUTgyZHBGTW1hKzBpbzBCVjJZUjZEOGZ4TFFyZW9FQitPanJwclgz?=
 =?utf-8?B?YU5aVzIvTWJBdEkrR0Q0MXRHeUtnK3dLWk1BU0ZsdkEyNmZiV0wzUHQ4NDRC?=
 =?utf-8?B?T0gyTG0yMWlwZUJpdGJLdEx1V01MREE4eVZMeDNrY3FUZG5LNFdNUTU1VXpo?=
 =?utf-8?B?cDJzZEh1alErUGhpQkxpc2tIZ2VaQkU3dG0yQ0RaL3hCMUM1Wkw2MGhWMDFp?=
 =?utf-8?B?NkJ1YUV1UVVsOHRNMkdIMVFXS0ZtOVVIMzVkN0tEeXhDbEs4Nm1OUTlOdzF6?=
 =?utf-8?B?UTM3THNmZ3VpM28yUmdKYzl3NDhCT1drcXljaUw1b1ZNbzdlZENDZm5VS000?=
 =?utf-8?B?Y2txUzlGbkdCVVRNSzc5N0hjMmVLOUNTOGkxVitaajNJVngrNGFzQ1ZOYzNG?=
 =?utf-8?B?UHN1Q3BtMGx3MDRYelBkL1hiTW1yV0ZUbmZLeHgwNmNIaVAycVAwdDJLK1JU?=
 =?utf-8?B?SmNhWXVPaXR6Znh2YkZEeUd0ZEZva3hKb3pPamdmdzQvK2NCenFIcWRTZTFP?=
 =?utf-8?B?TW1lWEZibkh6VUJ3cUNKejJZelJzQmJ2UGUwdXlnWWQwMjd6VG1Oa2pISTFi?=
 =?utf-8?B?cW5QTmN2U2dDL3NaUXhnMnlYZ21hZkhHYUFGV0ZhOGt5QWJPSjJaQ242TWEr?=
 =?utf-8?B?b0N2dFlOT1d3bzFUYytVdXd1QWZSMDMwUFBQMWYwYlZCekN5ZUcxM09vTE9t?=
 =?utf-8?B?azJWRDJLbGhRYzcxSG42RG5XMllPLzE4NzRUcnYveThzQlkxWmRPL1VHQys5?=
 =?utf-8?B?V1ZCbFdSdDY1cUNPMmlVbVJhNmhUaFAwVG1nUFdlcEJ4YkMvS3lJOTVsR2ZM?=
 =?utf-8?B?VkpZdHlXSnBubVFTWFBPcWl3d3VMNis2NEI5a0dmaVVnYjNwQUFxaUloZDlY?=
 =?utf-8?B?Uk12RnVvQzdaeDE3L2dsYjVVMFFJUVZvUmY3UXZ3bVpjYnIzRTNveDUydjVk?=
 =?utf-8?B?UExqbmxwZEJFTkhQYjZsTGczS0pQUC9DaXBEaE9GSWJDWjJQVUxiUDVyUDY0?=
 =?utf-8?B?Zll4azlmalpzaTNpME5INzlIbjd6V2NmYmwycUxsNjQ2MVltTHorSjQ3UnZW?=
 =?utf-8?Q?ZiQLigaxDtLn7JKL11vavScllmEC04=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGp2NjVTRERHOWFwY2grcVpjMDlJY0h5WlJ2MU5senQ3bnJjV2k0dGwvdEh1?=
 =?utf-8?B?N05ENUtFZVZnS0tKb1ZiUG0rNVEvbWswSFZRMExRa3Yyd2tBN0VEOHB0R2tT?=
 =?utf-8?B?eWNRYm41cUxIUS9kNkt2L2xsYXI0cklvSGp3ZmRsVmthMDBFN3VqWlgyWGJY?=
 =?utf-8?B?Y2hlZjk1OVBuakRYREwrUkt3QlBaRHZYTXZqWWVtVnYxVU5FQVhiWitQcXdX?=
 =?utf-8?B?TFU3SHdVdTQ2bUlkTnpqZUptRjRJd25NbHFaQVYzcE9rZTRnTzBobXJ2ejhp?=
 =?utf-8?B?clNrVmtPSnZoY1hkbzNtS2M0UkZkMVhRSHJYekNYMlNNVXVFeHRRYjFGbVpm?=
 =?utf-8?B?M0I3aDZ1UnMza2FpdEVxYXVFQWdEcytkVjc4QlhmVEEwL09BVEhNREFURmFh?=
 =?utf-8?B?NzlzVitTVEl0VW5QSE5SSFREd0JQYko3T2xtNEdUUEVaaG4zVThGb2krTkxT?=
 =?utf-8?B?U1Y0OXdXNUFEWWJOSmNTckVray9pZWZhNVFpdDJaWXV3UnZ5bHJkYU05NHVu?=
 =?utf-8?B?SGlkWGRxclRYVUVFNWNGTzlrdTJjdklJQit0dzhNU3gvbzZxU2VWSVhNcmNO?=
 =?utf-8?B?N0xRb3N5bXJVM2RSd2p0Q0pCOUlOeEZBa2s1UTRMWGpDYnZ6c2JDYmx2d3ky?=
 =?utf-8?B?V05kdDltSjhqTlNiVFpmT2VPdzhaVDl2TDUyMHFDSkFhQzNQcVcrQXRCVXhH?=
 =?utf-8?B?Sm5rQmE3aTZ5RTZmQjZWZFRzeWx2UGs0Z0hweFNjU1JKbm9OZWhkQ1VoeG9m?=
 =?utf-8?B?Q3dYVUFGbFYyb1dZdjlWZzVPeGZWQXhSVlIrQ1VLaE1teXJ1N1g2Q3d2bVNR?=
 =?utf-8?B?VStPMWxIM0pQdlpZR0pUbzBGeUMxLzdoQi9BcjdrZE8rV3Bndis3cStxVi9Y?=
 =?utf-8?B?MFNqMEFrZkh3WHVNeXlCQXAveWxIdjB2MlhOZElDZkRuQmVhd3VTZk1HR0oz?=
 =?utf-8?B?a0VYRDdJZ2lZNWY1STZURTRUWFBtcnBtSEIxRzN1b3NGU3VON3E0aVhZVlJ3?=
 =?utf-8?B?RmduOFpyMGlKV200UWlXOHFjalN0Q3NuVnM4eUkvaWxWSjhaeXk4SFVmQjFP?=
 =?utf-8?B?dWpUS1RRUnlJVnpzNWtERm9hN1hjbjJTWmlmWnVnTmdPY1JVdy85bmpzZ0wv?=
 =?utf-8?B?a3dCOWt3N2pEUU5GbHgxZGd0N3J1QXhGVDNaYTkvTTVOUHRvSk9ZaVZTVWVB?=
 =?utf-8?B?emxNR2xQVy9zakwrYnVKMzBpRkQydVZvQldBWFRXeU5RN2pEenlObW9rekNZ?=
 =?utf-8?B?cTltZXQxUWo3QjN0RGNTWmhPdFVaOGVXekd2RGdBL0tpZlMvRjZmL1RSbldi?=
 =?utf-8?B?VzBPaXZwNlljYUZzekJ6Q1BxajU5Tk8vRWFzcWxrL2lBaDUzQml5TXJGK01x?=
 =?utf-8?B?S0pzYWFmRkJJRTZRb0FBUm5xcEQwVmRPRjlrdGlYbHozZG1sc3Awa1ZXSjRV?=
 =?utf-8?B?LzlrZFNjVDVJR0tNNTR0NVlGSGFGWkk4TzZSMWpRZmRDTjg3S0o2T21YRWRa?=
 =?utf-8?B?UUJ6dG81eC80Yjc1MWluSjFFR3g0UnU2ZEhPMEkyQllUMG5WYzFFU0hVd2tN?=
 =?utf-8?B?d1V0SlFXUjNFM1NEQW9SdEpCZzJVRjI3STFqL25sb3dsTXd3YitPQXo2QWI3?=
 =?utf-8?B?M3JDRnk4eitRVllaQXRvaXpXNE9GUTRaT29TYXN6ZC9hd2grQ3BuS2hGbjE0?=
 =?utf-8?B?MVhTY0NpK0xTb2V0SjNvWnRLZjZkQXdYTHhqYU45RllLVHR1clIvTGlwQXBQ?=
 =?utf-8?B?aUExNHBqKzVFRnppWlhlSlFYbEpFelhadEkxMUN6UTluNnVEUWRPM09CQmRv?=
 =?utf-8?B?S2d5L01ldHBncWVRaEQrL1ZnRDNzU0xXUUVkckwxaUVhTHBFRGZ5aCtNeU1B?=
 =?utf-8?B?OS95OFVoOXl5ZDk3clljbnM3azRlZ0dpbzVkZzRaT3BaQ2sxSHRXV25KZkVH?=
 =?utf-8?B?VVpyd1dYWFpvMldkT0N3YmpVc2NpRnVvZmd4Uk03emNQS1Rna1kybTdTQWtq?=
 =?utf-8?B?SktvUjVFVUlvZ0kyb3Q1dHNYREhiYVRWa0FSc0MvdXoralZJam9iRDZ1MDc5?=
 =?utf-8?B?TktuSW1YczRoRXg4Zkl0cVVNaXBJVlduMlNzbHlCRk5GU01rRDlJbjJpTllP?=
 =?utf-8?B?eGUxNGp6MnkvdE1Gbzg3NjJTQkRsenBmWXBhZFI2ekxsZ1k2em9RNEh5VWJ1?=
 =?utf-8?Q?OXtlq+DY18+4q7PEJIHmevbHMv5Og4aVMxGcgecohQUu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85ad0a56-0f42-45a4-9474-08dd95b39eac
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2025 02:28:17.7108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4L17hoh5frSTIACK9aTIxHhfgezZOiPKAQb4eLhq1gniM/17vWVcc8xYLoLxlZo7dHCl0S8RtoSBU9PV6Ynb/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9724

Hi Daniel,

On Wed May 14, 2025 at 12:44 AM JST, Daniel Almeida wrote:
> Add a bare minimum regulator abstraction to be used by Rust drivers.
> This abstraction adds a small subset of the regulator API, which is
> thought to be sufficient for the drivers we have now.
>
> Regulators provide the power needed by many hardware blocks and thus are
> likely to be needed by a lot of drivers.
>
> It was tested on rk3588, where it was used to power up the "mali"
> regulator in order to power up the GPU.
>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
> Changes in v3:
> - Rebased on rust-next
> - Added examples to showcase the API
> - Fixed some rendering issues in the docs
> - Exposed {get|set}_voltage for both Regulator and EnabledRegulator
> - Derived Clone, Copy, PartialEq and Eq for Microvolt
> - Link to v2: https://lore.kernel.org/r/20250326-topics-tyr-regulator-v2-=
1-c0ea6a861be6@collabora.com
>
> Resend v2:
>   - cc Regulator maintainers
> Changes from v1:
>   - Rebased on rust-next
>   - Split the design into two types as suggested by Alice Ryhl.
>   - Modify the docs to highlight how users can use kernel::types::Either
>     or an enum to enable and disable the regulator at runtime.
>   - Link to v1: https://lore.kernel.org/rust-for-linux/20250219162517.278=
362-1-daniel.almeida@collabora.com/
> ---
>  rust/bindings/bindings_helper.h |   1 +
>  rust/kernel/lib.rs              |   2 +
>  rust/kernel/regulator.rs        | 211 ++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 214 insertions(+)
>
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index ab37e1d35c70d52e69b754bf855bc19911d156d8..e14cce03338ef5f6a09a23fd4=
1ca47b8c913fa65 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -31,6 +31,7 @@
>  #include <linux/poll.h>
>  #include <linux/property.h>
>  #include <linux/refcount.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/sched.h>
>  #include <linux/security.h>
>  #include <linux/slab.h>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 28007be98fbad0e875d7e5345e164e2af2c5da32..c8fd7e4e036e9e5b6958acf0d=
cfa952b916a3d48 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -86,6 +86,8 @@
>  pub mod prelude;
>  pub mod print;
>  pub mod rbtree;
> +#[cfg(CONFIG_REGULATOR)]
> +pub mod regulator;
>  pub mod revocable;
>  pub mod security;
>  pub mod seq_file;
> diff --git a/rust/kernel/regulator.rs b/rust/kernel/regulator.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..7b07b64f61fdd4a84ffb38e9b=
0f90830d5291ab9
> --- /dev/null
> +++ b/rust/kernel/regulator.rs
> @@ -0,0 +1,211 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Regulator abstractions, providing a standard kernel interface to con=
trol
> +//! voltage and current regulators.
> +//!
> +//! The intention is to allow systems to dynamically control regulator p=
ower
> +//! output in order to save power and prolong battery life. This applies=
 to both
> +//! voltage regulators (where voltage output is controllable) and curren=
t sinks
> +//! (where current limit is controllable).
> +//!
> +//! C header: [`include/linux/regulator/consumer.h`](srctree/include/lin=
ux/regulator/consumer.h)
> +//!
> +//! Regulators are modeled in Rust with two types: [`Regulator`] and
> +//! [`EnabledRegulator`].
> +//!
> +//! The transition between these types is done by calling
> +//! [`Regulator::enable()`] and [`EnabledRegulator::disable()`] respecti=
vely.
> +//!
> +//! Use an enum or [`kernel::types::Either`] to gracefully transition be=
tween
> +//! the two states at runtime if needed. Store [`EnabledRegulator`] dire=
ctly
> +//! otherwise.

Having the enabled or disabled state baked into the type is indeed
valuable for drivers that just need to acquire and enable a regulator at
probe time. However, there are also more dynamic use cases and I don't
think the burden of managing this aspect - by either performing a manual
match to call any method (even the shared ones), or implementing custom
dispatch types (which will lead to many similar ad-hoc implementations)
- should fall on the user. Thus I strongly suggest that this module
provides a solution for this as well.

It has been proposed earlier to use a typestate, and this would indeed
provide several benefits, the first one being the ability to have shared
impl blocks (and shared documentation) between the enabled and disabled
states for methods like set/get_voltage().

But the key benefit I see is that it could also address the
aforementioned dynamic management problem through the introduction of a
third state.

Alongside the `Enabled` and `Disabled` states, there would be a third
state (`Dynamic`?) in which the regulator could either be enabled or
disabled. This `Dynamic` state is the only one providing `enable` and
`disable` methods (as well as `is_enabled`) to change its operational
state without affecting its type.

All three states then implement `set_voltage` and `get_voltage` through
a common impl block, that could be extended with other methods from the
C API that are independent of the state, as needed.

To handle typestate transitions:

- The `Disabled` and `Dynamic` states provide a `try_into_enabled()`
  method to transition the regulator to the `Enabled` state.
- The `Enabled` and `Dynamic` states provide `try_into_disabled()`.
- `Enabled` and `Disabled` also provide `into_dynamic()` (which cannot
  fail).

Essentially, the `Enabled` and `Disabled` states simply enforce an
additional operational state invariant on the underlying regulator, and
do not provide methods to change it.

The `Dynamic` state would be the default for `Regulator`, so by just
using `Regulator`, the user gets an interface that works very similarly
to the C API it abstracts, making it intuitive to those familiar with
it.

But for cases where the regulator is known to always be in a specific
state like `Enabled`, one can use `Regulator<Enabled>` and simplify
their code.

This should retain the compile-time safety that your version proposed
for common cases, while still exposing the flexibility of the C API when
needed.

<snip>
> +impl EnabledRegulator {
> +    fn as_ptr(&self) -> *mut bindings::regulator {
> +        self.inner.inner.as_ptr()
> +    }
> +
> +    /// Disables the regulator.
> +    pub fn disable(self) -> Result<Regulator> {

This has been mentioned, but I think you will want to return `self` in
case of failure. Granted, most users won't do anything with it and fail,
but this is allowed by the C API and we shouldn't restrict it.

