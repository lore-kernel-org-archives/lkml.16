Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2064.outbound.protection.outlook.com [40.107.96.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE083C00;
	Tue,  8 Apr 2025 13:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744118360; cv=fail; b=hxAQAimoW4jQx+kXSUs5uuD+X3T7PyQ96nVsyaFu+ZNfIGkkQEgOOguG8COY3fE31L0nZXuacnatyUH5ZjgdKKP0rY4F6jGM8oTtuIWGSqqJKGY/QUS30o9Lqd89gP0ihpDc/hAmwsG3MLeQCmmvzjzX0aZGtmmbwn0YvbXRSAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744118360; c=relaxed/simple;
	bh=uoD6yinaT9cF3fthC6n125mh2q3GI3kyCADc88Jq6pc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=aoaj+jraCf8zIL8IJCjx9c/zceoeKE6Q9LbxO1WAYESWKhWVnj4Dcvi+pZsgan7yglQ6QlLEU4JmjrjPGtD9gDn0vcv/UDBxEFSH92ETBfodDLjSwVy3mN2hUmYO9O8NOzHnaKM/MlbtDowqJ6i5A1SmFnZfeTp+k2xq6aBTSpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gG31rh+j; arc=fail smtp.client-ip=40.107.96.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gG31rh+j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f8OeU9K3iZs9ySL5+wDFOOwzK4c8wSejo/Fov7e/mxpfkF3etN51HjdQvl0EfnAAgO+lXvhTMZcrlnvF8UFvrW70YfYIIwK9QPJM+Fhv6ErxaF8rX4yG0OSvIZ1GZRpK9g9MhwZRA8/O1FhPAmVm9xstNNo3XWaPHrO7f9DhXA70ZWcMWCpnC9iorrrB88esaaH/rm1FFum6dmpwErSuli8NMLzxwMON6evFuiDAXZzHCf5Nozh814qqXKOct62U0Beg61fTmKtQp5z/fgcUdo3p5t1TpszHyrDm83ACuGY0ZiLuAjljDRoqBnSzV+FgLgT/vZJqVPxEJM6iSk6QMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4GE9g0FYZQ/AsdykOyAdaYzjUgJFAoVJedyiuWpTrhc=;
 b=qxQ8XVByjII98acBUKWj4kJD1a9qQu3NaknAcZg50su3UzWhn/MMQ65a296aclG4gNeKBGFzE/pm1jNApmIeOfRYcqwhxnnQVp1Bd/QcUgD+cUZi9UxU87QDVcX9HwDofnZbwDOuHn8ImkMPW7iKcqqE198V/QCXgPGu6Swy9BMzQT3fuijyn3xdjEIyiuENUgE3q3+yzhV+hbA1LiUdRDsG6mLjicXxHQCHknBLyMiyeo3EsfyqjJE+SoX26ZCs1pcWMWQ+fAU9pn6/t9QhS87QVMr9Lbr/T5Bg2E2vCZAxZxehhuxfJP2w2Be0hvzY2ATLVSsIY/gzvcINMSpWDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4GE9g0FYZQ/AsdykOyAdaYzjUgJFAoVJedyiuWpTrhc=;
 b=gG31rh+j+C2E1bKu/9W/5erxhfxwgoE1oFd1QYQm/Zce0tGQ1fVjrGYb1s1AKh+XVJPAWGdos8U1fx4Q8GTnF1KN7lG1rGFEJUDOwuureRmvYi4Ik6/7fjjzQkyea4QgRY71Q4ZmP6bnxf1eKoVIjO4ErK1wktYU8p6O6Ser2A84vPYUkj/H6st/hit+03UeLQTv9WPgMlnn9YKWIiCT+k0h9g3m8iKwpF/lUSkpc8fXxYo6i6BY9NRg7fzUa5Tag7GDF4Sy+C3kbouyGG6bEwHy+9iH9S3tR/TeHzXTWYbqpjQReteo2ZqFGTKErm3v6qwEmSMEUvL412/1+y3IPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA0PR12MB4381.namprd12.prod.outlook.com (2603:10b6:806:70::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 13:19:16 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8632.017; Tue, 8 Apr 2025
 13:19:16 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Apr 2025 22:19:12 +0900
Message-Id: <D91ACTUAWQTF.2AZ98BUA5ZKJ6@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: alloc: allow coercion from `Box<T>` to `Box<dyn
 U>` if T implements U
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250408-box_trait_objs-v1-1-58d8e78b0fb2@nvidia.com>
 <D916LG7Z9Q31.5RVNMYM38E2D@proton.me>
 <CANiq72k9Lo-M5v338iWWSiwrnU+JwP+aEZeLiR291xc2c+ESOg@mail.gmail.com>
In-Reply-To: <CANiq72k9Lo-M5v338iWWSiwrnU+JwP+aEZeLiR291xc2c+ESOg@mail.gmail.com>
X-ClientProxiedBy: TYCPR01CA0050.jpnprd01.prod.outlook.com
 (2603:1096:405:2::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA0PR12MB4381:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d6afc43-eb42-464c-1469-08dd769ff5d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TjlKbTRkMGpxdmdHNno0TkkxRllSYnhieHE4YXN6ckRuaTRoaGYweU9wNG9u?=
 =?utf-8?B?YXhwMkhTbHgrc0hJamZxWDQ4ZXNOSFNVN3M2aUZGbHd5a3UwUTZkaXE0TmNw?=
 =?utf-8?B?TFZaUk0xZG1RQXpGeWRlT2paYWFRNE1nTHFxRFhQV2hCVXZNc3dSYVJTaVRV?=
 =?utf-8?B?anZ4UUdoZ0pUc0FoeEtGdDR3KzRLWWdqV3pOcVpvWUVBVHM5akc1aFpTVENM?=
 =?utf-8?B?V0dmMkYzWVQyL3kxbnFYT3g5d3FMODhXYk5ObHpBdVBWdDRlS1JtaVo1cml2?=
 =?utf-8?B?ZXRxdUVuUXRLbXpNRklMSTRQcTBhNkgxUnhRYmhYTDU3eXdXKzBvVll6bGNh?=
 =?utf-8?B?cUtWQU41S2JOeEhaRm1KbkhEU0cvTDRzcDJPR21aQ0dKWXQ3K29pQytzNTNs?=
 =?utf-8?B?UFRDVkM4MmlReG52Mjg4YVpVTUtVdmZSQms4VThNbmlWdHJpVjBGN011MWZP?=
 =?utf-8?B?Rk9GUHEyNmQrR21uRTY1V3pSa01pdUNOTHJ2dy9LRXhIclQ1dDRUSlViWmZV?=
 =?utf-8?B?bzkzUENabkpreWphSWZhZmNPUE1GYlhVNkVsUGx2S1lDaFQ4b0ZKak14Ujcz?=
 =?utf-8?B?NmxaQ2xuQVFTaGJENmIzODJIN0FNRWNPMktLUFVUMlVncUVtMmJYbXFGRUN5?=
 =?utf-8?B?d3FSWHliVmhtSkJURXdFeXNnSFJzTkJ1RFlVRUVRWDVKVkRzQVk5TWJnVkhU?=
 =?utf-8?B?TG5Sc21KR2ZuWkpRRHZBWWVJZ0pxMkRwT3FjdkpOcW1pMFBybTFuaEtQTzdB?=
 =?utf-8?B?Y2Evcyt3UHFMZzBER1IyV01Dd3dwL242Sm8zSElMTE4wNGIwUU9ZVXp2emg5?=
 =?utf-8?B?OWhTOWwxSk5HZXgreUtybHpCOUg1WGZQTk1xVUNNTWhXM05VL1FuaVpEUGJB?=
 =?utf-8?B?Qjh5OUVDK2s1clBnNFAyTCtXUldhbmplYmovTHpJY3lOdCtWMXo2S1psbHNi?=
 =?utf-8?B?Rk9CMUw0UDFnR2hDaklZOHl4ZzRKVmQzVW9acEVLYTE5UWVPSGFjY2J3ck0z?=
 =?utf-8?B?bDBXMzlFdnNES21IU0JnVUw3ek9GQXpFQmQxNjBlVnBIOVd2UHNuUjdkeXpN?=
 =?utf-8?B?YStLWWJXcEZXczg4azcwRlpEK1UxbVNkWjVTTXpibWNrM1o5bC8zdXdnNGFL?=
 =?utf-8?B?cE8zZWRLWGtLWmJDbGpCWkZuSHQ2WlMxc0ptSEdPdE04bCtDQmE2ckVZcTJ3?=
 =?utf-8?B?aFVXWlZ6RTlUaW1yZFZ0eTB0d3RPWllmMEFubjJRMlF3WFFkMVZHQUhBZ1Fm?=
 =?utf-8?B?aEpNRDMxWlp1K08xTkFIREN3elBzSVNBalZlek1lVFRyTllDSGRwOWpadEkx?=
 =?utf-8?B?ZGdTNERITnVoSjZNVUN1Y0FNUmx1UE9DeVBWYWRIZW4yWjE0RmZyRE4yUGM2?=
 =?utf-8?B?T3gycWs0SGRwZnU1ampIU0YvK1FMZzRPWXduYitFcGdEVHIwb20wR2NRSisy?=
 =?utf-8?B?VDdNUmJ2OStPaXowdVZmNzAyR2Z0Qmc0WCtUaW5kenZEem9oNWZRZk1qZCtE?=
 =?utf-8?B?ekgrRWR0SmxvTzVjM0ZJbW8rZjFZVlBHZVdUOForc0VXZlBENUdOcmdRWHJ1?=
 =?utf-8?B?RzVuWUhJT2t1eHZPLzFIMk5jYUsrZUFUdzEwRm4xRm1UWEhsUWI4eExyTUVj?=
 =?utf-8?B?UjhJM2ZPUzNCMUl1dGswaUJxd1N0T3o1YnNWbktDczc2M1dadndiV2pCZ0tv?=
 =?utf-8?B?Y1BhOVBKUThuU1Q3dkZHMGROcVBBV3B3d3hsblRGZTdYSncrVG5tS1BNSTZG?=
 =?utf-8?B?bmlncEdWSnZ6d3Fwa2Q2dURYeVJWYXNPa3hWQXRBRE0vb254QzU4dXo1c0hj?=
 =?utf-8?B?RkJGTnZ4c0hJM1A0ME5DK3ZzZFM3QjliWGgvNHBHNDFvYTJtano4ZWVGMy9y?=
 =?utf-8?B?OUhRSlFmUHIrdDJJcTgvN3JON3UrM2VOVm9tTzludEl1Nk9qbjl2WHR5TnFX?=
 =?utf-8?Q?tQVX1xN5OZ4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1VreHArc3NnU3hKa3Z1aVRpMVB4dTZnaUJ4V0Jrb2dMdUZBa20xU3FzdDFY?=
 =?utf-8?B?RjlWdmI5cjZxOHp4QlRRSEpRVkZmTnVSTlBqbFBOQS9SUEdqTk5pV1kyZGlY?=
 =?utf-8?B?VlphN2F2OHZvTSt5c2FyajdRdWE3d0RtRnNwOFQzayt1ZjF4L0sxOW92SGNZ?=
 =?utf-8?B?d0tRbndRU09KSzRGQWRaclFoWDNPTUEzejkvcjR3UjBiOEJlYjBkNmx4UmVL?=
 =?utf-8?B?MkR3K3NDM1J6emRkSFp1bW9rMytzdUJlN1NZa0d3SHQ1TDg0UlQ0Z1dUS1NI?=
 =?utf-8?B?cndWZ0k5aGNqbVlDSjV4MjdWcU1OM1JxMENTUEJKMmc1QUdYckREMnN5M0Zx?=
 =?utf-8?B?a1lLTWRsYTh6bDdTQ2wySVBiY2pJc1Y1bzlFeHlFMy9QR1JCZ0R4MU14cWpj?=
 =?utf-8?B?VUZOUXpWSmtYN01mUktaU0t6VURoRytTZDJpdGZqL2VEUzUxTlRabUJieURH?=
 =?utf-8?B?WXNYVDBzeVJjem9YTGlkb2ExTmFKOVFHc1k0UHlvdmVsTmtHZWpKZDliWlBY?=
 =?utf-8?B?RlNiVFNuNGkxWXY3bjk1ck04K1hXaGZRWUtHbmM4d0tPVkIxeE5STVlZclF3?=
 =?utf-8?B?akNYSnc0citSWEU5QUVKNG96eUQxWC9QVTd5dDAzTG84SFpCZld6YzRKVldi?=
 =?utf-8?B?N0txQXdEbUtocTlIcytrNW4xcUwxUTFYaFJEa0s0MHdJMEZCRHl1cUE3YUVJ?=
 =?utf-8?B?c2dMb0pVVXVOOWlqUE9zaFBZVkxtWWZDUWROR0J0U2lIcGtxVngwbUZCdzZB?=
 =?utf-8?B?bWVjK0N6eGdpY3VDNk9YM3Q2UDRPOEk0V1BnU250MDkvTzBDbmNSLzhNUlZU?=
 =?utf-8?B?NUwzZStULzZkbHo0cUoxQUJ5V0VOKzVLelhqd1o2Q0NBRjNWV3dLSnNwNDBS?=
 =?utf-8?B?dSt2ZGxzeEJGVCtyNHdYeFpNWGFHdnljTVI1K0F1UmdQNWxEWmNpY3ZYKzk0?=
 =?utf-8?B?bFJvcmJVeDRtcW1GSGtjcFVyc2pseEFTR244RGY1bVdvVDZ2cTBVdDF1NXhx?=
 =?utf-8?B?dG40MDFTMzJtSGZHN0NPekNHcnlGdGNybFpKalVFMGxGYlJhbk5jY0NsTFps?=
 =?utf-8?B?bWhZaEZhd0hWcDVHSTRPeXNDaWRGOFE5emI2Wk91RXlYalpmYjVyc2F6clpY?=
 =?utf-8?B?NDFpTExaSW4vTEFnYUFYNjE5dUhnVStIM1BaTFpyT0hNMjZ2VThTQ1hibzdX?=
 =?utf-8?B?a1ZoMnpHNkdlZ2lLM1hESTVJc0tKbDc2VDA4VTNxUFNmUVJFRTJQTzNrZk9J?=
 =?utf-8?B?Q0Vabkg2SUFyZVUwRmdJZ3hoZW0wOWg0VTFWWVRkMlhVSkl4UXh3N3hkN0t2?=
 =?utf-8?B?cC9ncDhzZi92dzRUV1o3dWRGQ0RoS2p6TnBwcmxiS0hiM1JQMW1CeGZQaUhQ?=
 =?utf-8?B?VXp3b1pRTHRkNDlGWS8wRmlRYTZSNEhVUTdSWWZPNTNaKzg4NVBXSURCQVhq?=
 =?utf-8?B?ejJYN2RpTGt3elhxRUhURVVGUmsxaDYxWmM4WjUzSisvUEVaNXZPV3JMaE8w?=
 =?utf-8?B?N3dqYUVLeERvRXBKdldvd3VIaEpSYXQxVGUxS1N0dDgyUncvOEMvTDAwTVJw?=
 =?utf-8?B?QmMxUUhPTkR4TGFUZUpmaUdHNHNuM29HMng3MkdnU1JZNm5Zbmk2OVJqaGUy?=
 =?utf-8?B?STNjbmJCaVBPc1pmU1JFL0Y5aXlsMWRTcGhGUWFqR2tTOXJneFVLZUpUdVll?=
 =?utf-8?B?b0E1VC9vMElCeWFqaFQzNFJPWVF0N1IxSURXTTlpdzdwa2V3R2wyMW9RYTRv?=
 =?utf-8?B?VWgvTUJ1a3lIMWRXamlPTVdmeDhRR0JHVXg0TUFQQm5BZytCVDFrWTNSSlBn?=
 =?utf-8?B?ZWxhVEtEbStoK0pPeFlzOHR1UncwTk9VSk1xRmc5UDJpWlhWdWJBUWNIV25l?=
 =?utf-8?B?dWN5Z1JPTzVjcDJ0TnNjSlQ1eTNRT2hQblpWeGxlZmZRZmxCdXNJTElHcE9U?=
 =?utf-8?B?K3ZsbFExWjRlTnJOaGY4TGtwTnprd0c1MkNTTzRsRmRNWWhRQ3FqdFdYVVFw?=
 =?utf-8?B?TEwrL0ZaNFZwTEhWME00MzZESzZGdWZCbFZGVGZ3d3JnVTI3dHBsYmpkdjI5?=
 =?utf-8?B?WFVPQVRVRWdYYlRFVHh2cTZOd3JqUHJZQVQzWStCL0lqT3Z4dUhVY2RmZDM0?=
 =?utf-8?B?a3Q3YmQvcFgzNkRFOU83R1R6SFpTQXBFUmIwNGM3R0NBZmtWcWNpR3plczRE?=
 =?utf-8?Q?JjyDSQaWZMW+M2BUfeoGr0Q0trGsTEzPbcu+SjHY/Ped?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d6afc43-eb42-464c-1469-08dd769ff5d0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 13:19:16.2631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5LW2mxTiBbZPcyEX0nbRe7zFu4GUcRWtTLb9NKFWxbItg9bMmGI7+n3hDS/bYVGMy5bhzyGEYu55qpP/xZdY8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4381

On Tue Apr 8, 2025 at 7:35 PM JST, Miguel Ojeda wrote:
> On Tue, Apr 8, 2025 at 12:22=E2=80=AFPM Benno Lossin <benno.lossin@proton=
.me> wrote:
>>
>> You forgot to add the `A: Allocator` generic here and in the impl below.
>
> Yeah, for this sort of changes (ideally, all patches, really), please
> test with both the minimum supported version and the latest.

Apologies for that, I had no idea how to build using a specific
toolchain and did the wrong thing, which is sending without proper
testing.

I had some trouble finding how to 1) find out the minimum supported Rust
version, and 2) how to build using a specific toolchain.

For 1) I eventually found a hardcoded version in
scripts/min-tool-version.sh ; and 2) is somehow documentated in the
Quick Start guide that mentions the `rustup override set stable`
command.

I can send a patch against the Coding Guidelines adding a section to
encourage testing against the minimum version and explain how to force a
specific Rust version if you can confirm this would be helpful (and that
min-tool-version.sh is the correct way to check the minimum supported
Rust version).

>
> For instance, there is another issue, `#[pointee]` is only applicable
> when you have the feature:
>
>     error: cannot find attribute `pointee` in this scope
>      --> rust/kernel/alloc/kbox.rs:66:18
>       |
>     66 | pub struct Box<#[pointee] T: ?Sized, A:
> Allocator>(NonNull<T>, PhantomData<A>);

Mmm that one is trickier to address - I don't know of a way to make this
`#[pointee]` attribute depedent on `CONFIG_RUSTC_HAS_COERCE_POINTEE`...
Only solution I see if having two separate declarations for `Box`, and
then we have the problem of bindings the rustdoc to the declaration that
is picked at build time... Any idea for how to best address this?

Thanks,
Alex.

