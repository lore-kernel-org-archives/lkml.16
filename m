Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazolkn19010006.outbound.protection.outlook.com [52.103.75.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40B8227BA9
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.75.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745942510; cv=fail; b=a9MFiaQYl5oQXrQW4ShRjao05WmyoQFj6dlBfYH1VDRr1ahkiZkz0dX17KjL9xg4bhsKb6SGIBYRDhr3L/vwU0VEM5nnkIWtWakO6G6HgFCyp7NXhwhI2IyhaCCmFnXgoJN7VFCv1DaVDz/yHFDMw8Fhc2c2Z0qK8oFjnJR49Qo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745942510; c=relaxed/simple;
	bh=MV/f8uzM+NwFy3LDS3lKOD27gEeXnHRsyU0JlWLv/pM=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=PbGvB5VLoB8gnUTnVFsQMZNhDeHoyaEaa9ZJeDVhZGr8L4Z6hLx6/DpGEdQ9naVSx8BLGVMCqrQXF29E5vKse63HtfiE3cA1ozM/bmG2bq4QfUzv8rXp3OBJWhoqYbOdnPL3CNjecTMpL3dagAqdCm6nupuVWveDMJaEiogkCDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=mKbMEGEr; arc=fail smtp.client-ip=52.103.75.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="mKbMEGEr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wo5iQR4mBfTMXIf2Cybu0C8cC7IAuXp9dzW4IKPy0pUQFqELHeA/8pJYAPJQlZYuf2T0kzjCRJHyZMHWZBXZdcYYbhUpVovXzeOuppcSFVaDIj2fwTibXVe+qdlKRMohlckpbvuoyrfN3xc2P1WSSJO5wh874QnV7Psd6PFOG2qyXHG3OIFmTieov25G5i8PZJm5ohtbWdlL0W/jAn2VYSMVHQqwhJJKL+4GRApugsyjiXdVlrLlDHYcQCQY9J0x6HFN0B6I2Z3sCjoq+/LwALocdCy05IwpUmlnnqoidtnQfnPhbcCs499VxuGPlFT2q6RoVk42hvE0LjZppfp0wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MV/f8uzM+NwFy3LDS3lKOD27gEeXnHRsyU0JlWLv/pM=;
 b=kXConGeBClBI3rhkZULHen6o3XtL14WgGI/elhUVDEs40Eb1lj+24lO+ChV49TGGRuL7sUaZ140oGEt75Xr7v0KsQMJdK7mgW7E0Q2buJt5UL+wFP1eZ2kkAEky5OrSMn7Bhuo0hb9tHpc6USXlW93SeHCNDbrSOviifCzPtsi2dwnLmdp3Umq+m6bVGt0JM7kGyHG3nhvKsk9BYm/CpQYQApTA4hID3J9vnrGI3pyV9Wk24sJKMGDSiPWETEepItdaQhXI/8dNVVHYrJq95Gwkvmbssm/Mrioro8tJHpxajujpE4zdD7msHlfx9hJwy4EwULMkf6vmxosWYmI/o0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MV/f8uzM+NwFy3LDS3lKOD27gEeXnHRsyU0JlWLv/pM=;
 b=mKbMEGErS1c2a5L2z4m+dqexLJR+q80AVU60oN+2Q3U8hRqsbBR38YPwL+cK3P2swjk4CKKPK95Gv52JsjlA6GveRy1dGXaAkWawNe6n8PtdP/gZvyFfzGQq0dTgD7ke/pM6pkblyeMs5YDWcQOCQjft0Hcw+rJXUIfXQKSKse9XcU+HtUxXpLAUWp/jNXjEXqkbmiYdvx5jSP1y7RO+hbvfskAaiZBV8SUeiuCIwtx+VgpXL+jXa2aVa7O0nNBhtms1bd3vs9VQ63dFzRVDCUAhI8C1yOG9PYiJHux7bNBydMadfF4YPLEh0FS0+Y2Q2DHYg1eyivNGGd3W8DuSKg==
Received: from SL2P216MB1157.KORP216.PROD.OUTLOOK.COM (2603:1096:101:4::11) by
 SE1P216MB2204.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15e::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.19; Tue, 29 Apr 2025 16:01:45 +0000
Received: from SL2P216MB1157.KORP216.PROD.OUTLOOK.COM
 ([fe80::99c5:912d:7db1:8af4]) by SL2P216MB1157.KORP216.PROD.OUTLOOK.COM
 ([fe80::99c5:912d:7db1:8af4%4]) with mapi id 15.20.8678.033; Tue, 29 Apr 2025
 16:01:45 +0000
From: Lexie Hewitt <lexie.b2bleadlp@outlook.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: Find new B2B opportunities using InfoComm 2025 attendees
Thread-Topic: RE: Find new B2B opportunities using InfoComm 2025 attendees
Thread-Index: Adu5FEnwpfKBvTA4SIa670af380VzQ==
Date: Tue, 29 Apr 2025 16:01:45 +0000
Message-ID:
 <SL2P216MB1157D73585EB5C98193D1C00AD802@SL2P216MB1157.KORP216.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB1157:EE_|SE1P216MB2204:EE_
x-ms-office365-filtering-correlation-id: b6d3458c-9d24-41e5-550d-08dd8737241d
x-ms-exchange-slblob-mailprops:
 qdrM8TqeFBv79g9cjUdb3l4dEqMMhpkLa+9lyht0jUVat+d/iRtn+S9oXM9pbr31dD+oWBsUhi+JwoJouLmsOrFiqvOELglgB2DLd3TAHWhW26N+BR+9N1NsMr4tw080lR7iFcBDoOL+0ppFk93je+p3IyXUvGhq/uetFJTKff5tWcbrvelcCI8T5z8EUL58plw+pydN5htvQ9c5imUVo2ohUAuZmIfQVxLCqI/fUZKRFbDhr9LvzBID1Uf4sejeiclTVhzkk0g6A1EII7t4Teq7yVtsl4Av33ue5gzhurq7ejpeTjXZVUxhmX3Lj3J1rylvPbMz07Mq1YOx1cZAw9GjzzVLoSfNopoGjKbVc3YX+I3oSkAazfqiHqKO4TvCVlwgtS9BoFTypdJpbiEUkYK5MaubPKF8eJeWinUQu72GqcYNPy3MGV8hifq+FR0Fw24H+5rt33UUsUSbpEXzd1oJf4E4Tv9NApbqP+WOOK6KYd/YcqDzBpoah8xl35yuQ9iDE7zHppxU5q99mkukiNy7Xui5xfuA/x+FvrClsR7GGIJnqBbAc15qcrpVyT5Tj5jEfwtdSoYoVAFIymeQCW+r9kjOHncs3x+cbiKGD/BCsj7XKjZqCt2NtqMdOvPuWK8LJn4NE/Cn5tmgwAopGKIY24NZrj6m9bG0H40f7HZ1Dmd3P/zuVIDxy0LI0bZIpk62urLC5/hU5Fh+1gQ5PCVDyTvXSsVoFVfENL9yw9zIMy3fUGIif1/oufPSLHMgR2WlwCJxse2MOkAkOnG6GxL+jsBm3U17
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599003|8060799006|19110799003|461199028|15080799006|12121999004|3412199025|440099028|41001999003|102099032;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?3R1cDtgxm1JW3E0rgfcFYiiVKg+1dZPAaCZcu2ptFQrXIU3otFa6zsgPPG?=
 =?iso-8859-1?Q?mg20U3uw9CKb0Hpt8gy7PbWGw3zWN16nX6b/CqKFVwHIxGilEHlk04HsWm?=
 =?iso-8859-1?Q?Hz+DjA42s+zQAmRg6off9nhqg/g55fhEWHhJagdAljgMeYVEmXaAVSGax6?=
 =?iso-8859-1?Q?ar9VzPXwXqpQM9akwK+tBi8eh5WzRb1ALMmUvX6QJ9gu3q+NzY55UIsSac?=
 =?iso-8859-1?Q?m7pqnaPLqjyYBHYUTlo8RueqaMl23UZKhKPQ0ivp8twprKFKSicfczW2NH?=
 =?iso-8859-1?Q?FPHinE+CE4+HCd2taTu5MLLtpNJiZvCTUNYhB5iaUJJcgA+Zz+Hnxh0dfy?=
 =?iso-8859-1?Q?exsEZVqT6p5GeB5tbWs+bsC43ktoTgS/sykRkvccu0Uc/mELpC27ozi4b3?=
 =?iso-8859-1?Q?ER/GSA8HTW46gjkxLMpHxXgmRR4bI/OUCPD+8rRhPnOuYkqjk5aPNKWMF7?=
 =?iso-8859-1?Q?v0tnsNob1TRGIu4V7a8mNejr+ruc3EZcyJ4q7JsgXakUO/xTob3R+6Kjiu?=
 =?iso-8859-1?Q?LnDCRycJUijR9Z0PoLg2cbAlV/PIt67L+ot2hAyY+AY20ZSPRePRMUloh4?=
 =?iso-8859-1?Q?5g4X+d78EgBPIHKJkrTfIlIJ76uinclm+bsSYZeK1aKh6kbWB2jqzfQVMc?=
 =?iso-8859-1?Q?5zqsIiN/ov6VnV2g4IMr23Ic6SIL/rARjJ5QG72ouc0vJXEUaL4Yrc2z0a?=
 =?iso-8859-1?Q?UEBnrIH/kMdAww0R9TTu5VupwE6nq0Uh8z+LG+UxxCMdiwOcZn7qMrw0lH?=
 =?iso-8859-1?Q?RLNU+0l8Ju6bKUZJ56DPiQK9wQWtbW+SsXlJnr0rKDI5MPz6QvPXhloYjd?=
 =?iso-8859-1?Q?xkNx9jtIXIyeQ2wI30GcGFiZggjQTs47Bdtp/Ek3S64dW9pevc+a0ROrRc?=
 =?iso-8859-1?Q?hVFJjVKKKJ8IM4Bq8x5GCzx1kgm9kDg2lkCN2S7HLfCwHwEFLVHUc/CsyO?=
 =?iso-8859-1?Q?+GPryW9Nrnm2JFA0+cjNSjcHpRtdQJCsPNok4Lw5DLFNHyna92XCpZwy/2?=
 =?iso-8859-1?Q?SfbjjSugKcm6xND/pO9gqhKFEJ/TiZOynIQE0dB86NqpbQtGfncdPhcuzv?=
 =?iso-8859-1?Q?t0fSBLeb/yKSbJsJsyGyWnZio8F4FwfPWhb2tn/dka+232ubUw23Mlqb1U?=
 =?iso-8859-1?Q?5P+AH0c3bTcXk7eHSGqMZqzAOvnApUYFNXmvASZH6q9OxIUsXiqdZkfNrX?=
 =?iso-8859-1?Q?Nxl0YpVOEDwdZQ=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?C9EmXqcTNrAuUYm03CPUj6Z9AKS9IZTJf51CeJZnKLiVClU/OfLT9qtrfZ?=
 =?iso-8859-1?Q?RzHbmeBymI7w0UAfqGlgFNIBvmxg+tKV/L+G0O2uBZRZ6YSY0ISeg7yu5w?=
 =?iso-8859-1?Q?BkrWrMzk0ja5ea5uhBGQtg+l3qrZcf0YDh0meE0Dp2RK3ztKM6BkvAmMGJ?=
 =?iso-8859-1?Q?YjYKH4ScyAhdp/WJDitR8Lyg4Tvtp6wfdMardPBnYJSAZqown6dRu43EW0?=
 =?iso-8859-1?Q?1i3o6fLokH9OCBVj3iDldjHUU3rd+5woisXKF0VUKAVQd+FanHpn6M8dQs?=
 =?iso-8859-1?Q?ss3uGlYM/bfZwPOk/6CSKF4azzr4B6csB89d4CWzntypcrYiTvEhT1E6vw?=
 =?iso-8859-1?Q?hjlMHT7R6i43N814ochT7YKmZ2mPg7DShDrAIMlVn+ge9RRCjGPtOHWy0e?=
 =?iso-8859-1?Q?ZP4KewFlUgvLgmNy75cERSbpp2SZEl3LQI0yyFR8UB/X0nWgFGiadYsUeo?=
 =?iso-8859-1?Q?mtnvzQsVfA4lQFvIaWzwm92BNxV1Vx51Tj6bAuKAXQrOIEcodBJC3HLwSp?=
 =?iso-8859-1?Q?x1DZBNbDBpFpJhv303jQ2ouTMfnfcI9QJelvycd687rE2lIuF386ArBRCm?=
 =?iso-8859-1?Q?z212EWuiEYJKJvDkh8oEAcMu5MwWQV/JGUlgzE0pL2GRvY1xPEZfgab0pV?=
 =?iso-8859-1?Q?mzQOsXBnqQ5CmTgk1g0s14vi4FqEoZ4+THYKrsbBVJl1OSGNoB5HMBosoK?=
 =?iso-8859-1?Q?ccumxrO1FQ8lssOhOkv3bA5gmfxQ8CFLhtl8GY6rpzfVrsRk95AnfICg/K?=
 =?iso-8859-1?Q?j36Njqgy0OhwHrpMzZCvtsABrME32GXjm2g9Lr0QLQbATurThC2FJUJWk0?=
 =?iso-8859-1?Q?iNV2lE8uGr2DlWOxJ6JKiiLkbAiJIb/BlkC68OpveToIhLyaE1hvTsqfZx?=
 =?iso-8859-1?Q?UmFpQyx2sKAu6rTkyXjY0/UYJDZ4mYIBvPGoLBFF5XRkuH6UTfAPW76bHf?=
 =?iso-8859-1?Q?hMkG8eMQLuary4PZo1/3nzwRXxZQtlhMzh3eNyE4Ur/5Ta0O5pOAY/iPlG?=
 =?iso-8859-1?Q?jw7DINyJKNCOAUn1L0i2zSoLJVc/LJbZL3q8A4WSwPqRBBPakIluFqc6KR?=
 =?iso-8859-1?Q?cjcvuKArB4vW7fw7uKQNnNUftwuNJugpMWEn7fTqJi1R0+i0WI/FvrnTr9?=
 =?iso-8859-1?Q?dEE0iI5rR+d4q3irwCj6HoP1OlosWFSsrep0TKkLbZjTPAK7FjjhC54rek?=
 =?iso-8859-1?Q?s1NwqLgjDu5MqHbsvwE3vV63P5mGSr0pNYKJTBaH+fqbTu07OLddsidds0?=
 =?iso-8859-1?Q?ffrXaRgXl0pjDdie/BETwYoLhcPtRLaMdLEW0cM2JwheuG2LDcObBcp9VJ?=
 =?iso-8859-1?Q?OhT9iFILevei6eAnpdxaMVJ9kUws6/Y2gFJnyj//fSYNvmA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1157.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d3458c-9d24-41e5-550d-08dd8737241d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2025 16:01:45.4978
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB2204

Hi ,
=A0
Just wanted to ensure that my previous email reached your inbox.
=A0
If you'd like a breakdown of the figures and pricing, just let me know.
=A0
Regards
Lexie Hewitt
Demand Generation Manager
B2B Leads LP Inc.,
=A0
Please reply with REMOVE if you don't wish to receive further emails
=A0
-----Original Message-----
From: Lexie Hewitt
Subject: Find new B2B opportunities using InfoComm 2025 attendees
=A0
Hi ,
=A0
Hope you're good.
=A0
Have you thought about buying the InfoComm 2025 attendee information to ele=
vate your marketing efforts?
=A0
Expo Name: =A0InfoComm 2025
Total Number of records: 23,000 records=20
List includes: Company Name, Contact Name, Job Title, Mailing Address, Phon=
e, Emails, etc.
=A0
Boost marketing efficiency with our top-notch B2B data solutions.
=A0
Please let me your interest, I can provide unique volume and pricing inform=
ation for your consideration.
=A0
Can't wait for your prompt response.
=A0
Regards
Lexie Hewitt
Demand Generation Manager
B2B Leads LP Inc.,
=A0
Please reply with REMOVE if you don't wish to receive further emails
