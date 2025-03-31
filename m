Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12olkn2104.outbound.protection.outlook.com [40.92.23.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B46214A8F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.23.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743457750; cv=fail; b=h8cqRiBBADyHjJpTau2gYW6ExzclgBW6GQ4QYSesvc560+uXRYspG/MeR5Z8TPbAzoKxeVS9RqMVRbMEtEVpYs9QAwTo+ubypLYRfxA+u8jHhQt8w4cgmbgBCuT78/75FKXV8bTOmUiOtyHoKhRtYSfotM0Hn9yzfaK/xKDDEHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743457750; c=relaxed/simple;
	bh=i3z4cyUG9OnEXT6jrPovFb3kNjp5w3s2CVqIhnxwNhU=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=JWnmSKHzCjNiccz5iPollelLOU2J5PNGeudPV+PwE/6WAVddk4I/c7v7G7RcIwKWHEzcrgd5JU/peAG4y442T6rgmyZ44H4YRopbTdtxF+CPjM8T+4oo+nWVp7VbC5zg6COvidub6qmC5Ch4aMyyp9JxXn42xkgJxQqvw/S930w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=T8nakCU5; arc=fail smtp.client-ip=40.92.23.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="T8nakCU5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lyKYaaoyFlD3afqNfzgDPi7qc994w8pheYNKqADA8IHLS7598VmwJKA+CkRs+2EKXfM/kUCvYIKGvVQ6UJ4kiwF5go2BF42alhdfxv6hQ6iRjz+oivakxCVAc3+8S1JY7AAG9KmEMBFEYdZqEtnIz6I7MTYmKY1ETmIkkWLz94idP97EZ7aqF/46xBDVD/9m4jnrHMRlmhiHp9Lr5v2tEeDPUyBBgGWN2S/AtuNf0Qs3iFB18Q7lyquCRSqygg2z1+EP0mTTZHeOU2PDdAEMVCnshUx/7KozRj5MhrnQXQ/60jI8Ry2Ml3kiaYgun1ND/Cogf0zSirT/zPqCyZhKQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3z4cyUG9OnEXT6jrPovFb3kNjp5w3s2CVqIhnxwNhU=;
 b=dz7bBddBqEtNOzu4uZf1kiasr7VQhS70hpL7HOmtKSVKQ3wEFtjgnPRNfBV4gPOIlHPGAgW9zjPTHBizzeZFUqVvubBce/YZyTsYEzUHAwWIZqU3j3KsxURO15BvFKSUDyko5zGSF8ZM1WIaZL694FYcGy1HkwRo5IQy2W4247Rqw/Z6kL5Dt0RwQTl79QOqI66YqGMS5rxfCqcsYME+n0vdyVDlSzETbSWptG7ATXjLXZEXz9S/27V7KpGBrnsOLgssIi457e3hYFBFIt4OMeDXnrKMh5m5bMtC6RYaopFvmdCH+CiHU5Dhmy8LTnqMLtYWIXukIsMVxLFvY7tARw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3z4cyUG9OnEXT6jrPovFb3kNjp5w3s2CVqIhnxwNhU=;
 b=T8nakCU5e/g0emwUtMseXuNyOulaDBbs+Z9zSJkD8l8YsBal6NcPoNY0TSy9nqSEzTSAYGu6viKZ7GsEBwto04EWgGJUjb4pFyaT8qeBlytvubCNlYme0c2hXBjcVGoXKESRGmtI3gTXI12cBkJoxUOs9Y3iKG+WzhyX9QTRz9b7riYULpdH0l+5xxH8ZJhFIwujDgIzQ9w6VBFVXtGxQvXDznonCEr0hKTL1IEfZYNFgYYgN2Ao0yhHxbnaP0SlZKJV8nkWB0e80N9EqIOs15Pu6I8dCIkgIW4rhE10zmKy4mJ42NLcxeshUpLHsBts6QEH6irFoRpwxoCy3d3Lqg==
Received: from BYAPR20MB2247.namprd20.prod.outlook.com (2603:10b6:a03:159::24)
 by PH7PR20MB5210.namprd20.prod.outlook.com (2603:10b6:510:1ad::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.34; Mon, 31 Mar
 2025 21:49:07 +0000
Received: from BYAPR20MB2247.namprd20.prod.outlook.com
 ([fe80::e60:961c:9981:2755]) by BYAPR20MB2247.namprd20.prod.outlook.com
 ([fe80::e60:961c:9981:2755%4]) with mapi id 15.20.8583.038; Mon, 31 Mar 2025
 21:49:06 +0000
From: Ben Graham <ben.usmarketingdata@outlook.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject:
 =?Windows-1252?Q?RE:_ProMat_2025_Attendees_List_=96_Ideal_for_Lead_Genera?=
 =?Windows-1252?Q?tion_Success?=
Thread-Topic:
 =?Windows-1252?Q?RE:_ProMat_2025_Attendees_List_=96_Ideal_for_Lead_Genera?=
 =?Windows-1252?Q?tion_Success?=
Thread-Index: AduiSw7nybHImEqdTo+p9/qVjJ3tKA==
Date: Mon, 31 Mar 2025 21:49:06 +0000
Message-ID:
 <BYAPR20MB2247160CB3D71D83B221DBDBE9AD2@BYAPR20MB2247.namprd20.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR20MB2247:EE_|PH7PR20MB5210:EE_
x-ms-office365-filtering-correlation-id: 8723a011-0c57-405f-e3b2-08dd709ddc20
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|8062599003|8060799006|19110799003|15080799006|440099028|3412199025|41001999003|102099032|56899033;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?ZnDjrZoe6CHV323J1q7l53DRkCF7fy3RWw/j35nI/MGmPQYt+yP8jERn?=
 =?Windows-1252?Q?yu7rIW42QyOfWNQsF2YoVkzvtTvro0cMkcoFOQ9w8Lpctx6lZed2X7sz?=
 =?Windows-1252?Q?ztJA8wEfDu3CdDWi529s31uZ1uWVpjKRfJsgd2HeT2TpXH6HL8Vo97aW?=
 =?Windows-1252?Q?yf6UjL5LDt841DMHhhZx71rN5IEdLL4J4kMJWlYsEqUws19IOsEmFasr?=
 =?Windows-1252?Q?Ut0D00DTwM7R4XUTwbbv/km9shbppjiBtyQQ6IcSz50lOsGU0eijBDX4?=
 =?Windows-1252?Q?SIYfXKIUIj5UEpc/4eTX8V9pSeX4ZMX4mt6YemSr9H5uzrjDw9AKSKKU?=
 =?Windows-1252?Q?L8Y7aXigwGqxNN7bYmL3VwKAAOwTH0lgC5GUa9AAclkmm1dfHLBW1Iq/?=
 =?Windows-1252?Q?wPTU9XyHYG6D1ZAkvZ3+8nFRq1JFzKVHKigufcUJ7sxIM51TnhMkXLPX?=
 =?Windows-1252?Q?U1c/FWya8W4aUBVHoKmu+ryvZ4WHj1+OnzdeqODxxQK2E0kjc3EZxo+L?=
 =?Windows-1252?Q?Z0Q5CM/oHupbu4Pbilu2hXpLpUobB99y+Jbd8M5DVWb5SidjrN8zZ+Gr?=
 =?Windows-1252?Q?Z5OnohxAnxt7EPhsDXgOPTlm0PaDbnEBJS/fKkXFxhFRnhca6AS28W04?=
 =?Windows-1252?Q?6w8pYVXTFHJjfsTbxrHfy7wdT8tv1t+bWEmDrOBDBcOpDLaepdUd6jKy?=
 =?Windows-1252?Q?kmfBTZaFrJeHOicwRI+Sl/5dME3AJ3kRZrEOJKo8h255oE69DUlNwGOv?=
 =?Windows-1252?Q?gvhw/63tWzBgkNcFY0fOXad67a50494wlbHqzTc29N8poYmgKmeuwxbd?=
 =?Windows-1252?Q?mYR9+xJq3ceTWikoB6evYY6dIzl5p2MW17/W/U+6O32u/bHJ0kTxTq8T?=
 =?Windows-1252?Q?rxvGPrZ/+tkSR64Q58kS9DdMsJgNAMgDwN947j1D8gD91imdbZ6NUHYN?=
 =?Windows-1252?Q?A2OQ9YVwulBVB5WswObt4hJlac4CbeRaTja5aMQT7AcsZGY2Zf11R2R9?=
 =?Windows-1252?Q?91ymG+DNKvF/njCaCz99GAKB5SuClTrw/cukEfxQv48rMN/7pBH3jTPO?=
 =?Windows-1252?Q?tJeJDAc0PODFtq6D8LnQQiuhIUMsYVNDVuYKgiDd/7RS3VigQTTztDC7?=
 =?Windows-1252?Q?/L0PnesxeRjpdbbKLWTkX1B+oNP81IetTwVKLCy+XsjeBg2ZYweCvn1t?=
 =?Windows-1252?Q?a+xZg/SN/ZifxJLDDRf2PL9oOP07GmIj?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?SlfIdfgyk/ZZyavzznjCNpo9hjGdwh/bUYfx0lVo/UvSsJS39WsQ5tYt?=
 =?Windows-1252?Q?bWa7zfmdgEXW05+SRqmtOTbFqbZDwv7Q1Nil9nCV6k+38b+cpvSRR9eV?=
 =?Windows-1252?Q?G03DndB+f1hIWW4D+dDQvbwH5oAS4MftPOX5FLXtJgK5yc0XaP6p8tZ8?=
 =?Windows-1252?Q?4W2ir011eieFMjhLwUYB/DQDeFu1scj+OiZlLbYLCLcGcHE42+lWl7N5?=
 =?Windows-1252?Q?bmtmF2RLRifzqWvWoQw4L/17b1wPxG9JSV1Ip96mapmVO0VEZ25Cj+1Y?=
 =?Windows-1252?Q?Q8qPT6szC4g42LF2PxTv5bJIILp8Sv9l81eck5PqbubKPmjCb571AGhU?=
 =?Windows-1252?Q?OVl/4Qqbtl6Kh22W+DZFUeAx9bEv73Ovxkr2Iwmh6rajYH63tmeF49U1?=
 =?Windows-1252?Q?GnjAPuupLb94c6oVetSCdTxF0WzlIzM2cJLORtC+pscB4EVwTPdFUfWf?=
 =?Windows-1252?Q?VxHerwFhFGjTAUs+ZjwWgcOd/RruNdX9Jb+VmC3LNmYxJ7MOFCU3YX1C?=
 =?Windows-1252?Q?482qxtm/+293BDsp6Xdf0yhwUX4sKU13CH0xhUFM9VyJdzW37thuV7tN?=
 =?Windows-1252?Q?IRmCUA3ETpREhp37PfCLA9X6C1UhNXDIppXKPUR7QQj145fMCWP0B5SL?=
 =?Windows-1252?Q?4BGIvwF5yyxMuv3pwqGkWcL00gpfmNQmnwNJxspSzCazFECt/Br0XekF?=
 =?Windows-1252?Q?CDcuEMBmGfb9Oq5S1cGGPI6Qdsj6ejPQD/sDG//rB3Y9qtlsEFUuFCA4?=
 =?Windows-1252?Q?y8vIAc4R+WIpeTbYtLuhhhGYxMJnwUpcj5vjVoLztRQvAGNBalom39Iq?=
 =?Windows-1252?Q?RLg3XQKAh2628P82LSx7TpI3glJ4UBO2NTSb+thIdK7MFqU8uw5NDBO5?=
 =?Windows-1252?Q?UQAjpSk+pfxl/BvflM3q1iQNtxzr4RU5TTigqbxJbF0V26H3VwnVKPD/?=
 =?Windows-1252?Q?13SeDLVEmbw8w4QwGYY9y+gTrIYYo4voUIRPDoWe9A0XjqOGxsep+ICQ?=
 =?Windows-1252?Q?ZshkrRtcLIx0B28I2Jydeu37mLPolX70zDUwh3HUJ9SU7FpM/dRg8Ikf?=
 =?Windows-1252?Q?EsLtzh/J1sV0/InZ5en+wUtJfCvZUBP4P/+rU9WV+PY5JugZXIJZZdoM?=
 =?Windows-1252?Q?IlstWTwn/DsvrD1ym1RMulK2n3BV7bdT+5FMk7JrvV40o2ffmtF2MLZG?=
 =?Windows-1252?Q?OnYlBDDwS8aJPH/f5rnz3qT92xNC46xU88Tpe4oEuOBpsaRyJlm+uqDq?=
 =?Windows-1252?Q?B4W8gVktODDWL4/CCYoil+YC/uauzxPZRHAafn2cH7gMg8RpWfZdWMfK?=
 =?Windows-1252?Q?pEAvcUe3IwV/KrYTZxWUYjJxDTBSzfhvv2HBrdLd4GqVtnVMX9mjnPbn?=
 =?Windows-1252?Q?GMNwK+3arXmOuapCF4rmqHBLa2kH2E6E0DSxHk8Qc1+fBz+L6Zr7Udnn?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR20MB2247.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 8723a011-0c57-405f-e3b2-08dd709ddc20
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 21:49:06.1345
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR20MB5210

Hi ,
=A0
Checking in to make sure my previous email was received.
=A0
I=92d be happy to discuss the numbers and expenses at your convenience.
=A0
Regards
Ben Graham
Demand Generation Manager
US Marketing Data Inc.,
=A0
Please reply with REMOVE if you don=92t wish to receive further emails
=A0
-----Original Message-----
From: Ben Graham
To:=20
Subject: ProMat 2025 Attendees List =96 Ideal for Lead Generation Success
=A0
Hi ,
=A0
Are you considering securing the attendee list for ProMat 2025?
=A0
=A0Expo Name: ProMat Expo 2025
=A0Total Number of records: 35,000 records
=A0List includes: Company Name, Contact Name, Job Title, Mailing Address, P=
hone, Emails, etc.
=A0
Would you like to buy these leads? I=92ll be happy to share the pricing wit=
h you.
=A0
Eager to receive your feedback
=A0
Regards
Ben Graham
Demand Generation Manager
US Marketing Data Inc.,
=A0
Please reply with REMOVE if you don=92t wish to receive further emails
