Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azolkn19010008.outbound.protection.outlook.com [52.103.10.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016B92522B4
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 14:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.10.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745591817; cv=fail; b=iU5jxT+wAJnaG5imKJyWUwkAHKnLgJpjJfciT9tC3MfMM7crHIEWKdMmudTeaYtzgIGiBE2rz3PdlMO2i+bhaRhKKmXutfRaGrCEcNNdSryx50m9SeWbKZZjd7uTZ3YmGyQLmhWn8nqP0PZVurOiU0aHf7e55SPjvvvMN3Z/26g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745591817; c=relaxed/simple;
	bh=H7WgbtCFL2Rp/KrqflD8omf++6hPA6lwObrteTGeZEg=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=EB/OXNfgWpT+25DKfBP70gmQd6fJGsHOeuiMGWxNjhuobFlcf5zP/9SfbYpnFxTa66n2ySoTiUHipQixY5Xb/0mqZ01gtHYB6az+rnLU7R2QSwRj60aC+VyZkV0UP9zwYx8RPuoA5xCCl46jQ+Dm3bLqBcrV7Toa8c5RoJxbcH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=aIQwZYtK; arc=fail smtp.client-ip=52.103.10.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="aIQwZYtK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mTn9aB9BkRYRVyZRdXkh2cDfwCsF5VZb28WKWVAigYNJWNK2Ab2WOHxVWsTY+t8tk7ycKQMrj1YhNDCc5rbX7VCN2FTXDQ1NS9Sv3h2A9K/vD7dS7IGl6rhWCXhanAO19djpZb55LcNwrWFHACPpivOoM6MJYEnWhYniw0e4insVTHn2IwAixgfPOOgRNFbrbODZZhTX4qlz6krLK74ZJu2MJwbPnMwuyAfKnYYrVjjhV3KkpJ2331GWwtQWqBQBMnWh3h9DpMNMgeiO+Ncum/MiiKdfTTAYOWfRhRm0zws5XdPzJZdkimkLJqDZuFhfyv+XOEA9nxlYJ9NMM8w3tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7WgbtCFL2Rp/KrqflD8omf++6hPA6lwObrteTGeZEg=;
 b=RFJ51PrjwcF/Ikema7SqhAtYjSaYDwI2TTC6VfRJK35dS8vLa05uGpwvDEOG+2JDqRTrlRW6lBqjmK7MELTRgo2e9q+MPvgkwWeSGLgYGgoVm+iNxdIiqBR0Ee/TVF0nN97CKEROJYIoiIXa/VFj/WQQL1ZsZSeBdSzZU8zjxn+R/Lt2EuWq00Ct9NtpH5GjjcAEGw5PUI3lqfgylO26QRg6Ow3yvuaDeuvRm79IIj35TalsmYIKAum7JOZUzh7pd1E4x2DBvjyfb/gbmQgp0g4Jbp6EetDve2NrkQD3F+dj/nSqP6cyN8VKCUg9jv/LsVidhq0s70CxxRph1FCX7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7WgbtCFL2Rp/KrqflD8omf++6hPA6lwObrteTGeZEg=;
 b=aIQwZYtKPYSzqLnWpVlpcwy4NlwfPk/w9WbWsVFZEMsPhu0XiswAmMHDcFFSpoZmnNhBDxn2WDfAS58KqdPishnPsSljexi9OHiKp0+2MXDSE+jQCJy50TgNNA4wsKZyt3jI9aznmcouAa9u7tjbKYjCtbs7/RhE90A9ET21VsYrdBeI6MGy+poS2hvpqyjzFvIXNO62DnXpBCMutA5hHrzNXDkrwHwELwg2nbIuUjR0UhP9ffrEwW5kC7+9OoYj+g2zCLYSUJUvaKddVvKxCyxPm4I9hvfLjlH21z6VJPpUCp9McKKVIGOIeq6ESdiSJLb51Lmyf1kDG9g85bYj9w==
Received: from CY4PR03MB3335.namprd03.prod.outlook.com (2603:10b6:910:56::14)
 by CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 14:36:52 +0000
Received: from CY4PR03MB3335.namprd03.prod.outlook.com
 ([fe80::e8c6:bfb:511d:77d8]) by CY4PR03MB3335.namprd03.prod.outlook.com
 ([fe80::e8c6:bfb:511d:77d8%3]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 14:36:52 +0000
From: Jessica Garcia <jessica.campaigndataleads@outlook.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: Access Sales-Ready Data from the Coverings 2025 Trade Fair
Thread-Topic: RE: Access Sales-Ready Data from the Coverings 2025 Trade Fair
Thread-Index: Adu16q/BJJpxUf3GRbSKSldAZA3svw==
Date: Fri, 25 Apr 2025 14:36:52 +0000
Message-ID:
 <CY4PR03MB3335FDD27795652C809F3313E7842@CY4PR03MB3335.namprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR03MB3335:EE_|CH7PR03MB7860:EE_
x-ms-office365-filtering-correlation-id: 0b1a8175-b136-4175-d1c7-08dd84069eaa
x-ms-exchange-slblob-mailprops:
 dXgNGeDBlWd9yP+RmpOm0BzxwVZOPl/b9OimgfkUKo1jJRiwitCuDA/baMo9+1G3cPTmfDCmvVurwwCwtW8goyW7o8+ZH3a59ELzXtY/2cn7+ptnrxmVjEbqdAFTM6VMbArCuRANNd3BE4xLloAnqYpRWLZ82xST4zBCxQTr9f5kmvQ/hTQJr2vRMorrQorXyqv1SjeRvco/XqQN4fHRGyqozrbqUUTjqU0oHiNAHlMmf6ipELrVcM012v1w0MZC/qjU7/Y0NsgLUthZy6EFeLvJiJ04qjUR4tnwZl6Et6pS4cQmB5VjLJ8iYw7sgcS5lmqOGS+dGIMto4p63lbjjsD64HyUreYNte35fpsfSE1apQdlQsuWCJX4EagaXod2EgIMqFjDxFPReFAPR2Uo5l6ASwejWvEBkJsDotqj46OrTD2HdISsC1EN87D4NJhKlwgqUXzt9Y6Hk+q4j9KV8PJjJjG7GpMLzljIhaIRifId/V3nJWNN8i1NixzFfdqu8OxMa+a/UCQqr1k9vBzAZI+/F3K+s+qopeq55cp/pY5kGBYRyyutXNPPNq8UpKgM8k3LUIG764ewga8YZAIw59FW/et2bvB5Mc/PQJklwGkQBZo5UptfUivoRZ+2vR1p
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799003|8060799006|461199028|15080799006|8062599003|13031999003|3412199025|440099028|102099032|41001999003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?VCVUSBX+I8oV6SqiyDUVp9jzLfVni+klsCipN4Tp4qrrj46tdPm7fu8+A+?=
 =?iso-8859-1?Q?6+JWwJRj8a+yUOnsqlLqohX1r3hHT1EY3fRm83cn1OjoQJrX3YwVsYeGv4?=
 =?iso-8859-1?Q?6UEsQn/MFANbo1O2cdxk+tJRZEVbbkL97Z2vkXBHH8YjGF0nPzGiNnWma8?=
 =?iso-8859-1?Q?K8E7Dytz9/7TAq0bFnWrfWLaXyt1FM6ZWlhVqP2bXrQb07KWBGhEopU+K2?=
 =?iso-8859-1?Q?wo5Es46GUP6jaVvCT08CRMLCMEiIMZuOVuEUNC/kOogUMO26NGmKpRJC8h?=
 =?iso-8859-1?Q?3KCF+7IAwoDpPrgpOKvr7txVZ7qVgcAYMwRrhaBx6r2yyTj/MD+avbnZoV?=
 =?iso-8859-1?Q?2MNOmmKJGDYF0cFxi62bmC06jQ7cXH/LDgbGGTkPU3lxAIHXtoHK/bH4jI?=
 =?iso-8859-1?Q?QF3j9R5Rg9FLZUBvGkAE8WQI6Gzy1ThKEBFgdmD6Xp+oOOJsQzvqyE4Uja?=
 =?iso-8859-1?Q?7xGJgZv5QZOc9nNWkjuagSjRuG7318AyxBoKiqSxUEAsanavpVPeDfXOS1?=
 =?iso-8859-1?Q?GZJ9W4nuCsb3gGA2i9GppigTtczu+Vc8zwXYWXnz0AhE3NhJijqM31YnUM?=
 =?iso-8859-1?Q?dxdtUWCWyPR8QoSfV/athrCQLC7jfjGwPBsijIVs77+HEsxhQoxG6kb6tI?=
 =?iso-8859-1?Q?Dj9mPxtc9+aC5LUnfBNgYhfFC2Ivn3xyz81XPxeyLao54xGrFtpvbTcNrX?=
 =?iso-8859-1?Q?aBVKAwVmUzUrULFtLaBKU9ExFVF2kUGCbMhR9pN+4NDWPxz2pim9/RMPi6?=
 =?iso-8859-1?Q?L6zumpEz3N/7QnRL741q/IviKnmp/IQ0QoKKLEBSMSbPu9fBf/WaKEi/Li?=
 =?iso-8859-1?Q?PdYGI3LEBfCLJwzIoMJDhOQrvfW9bqqAEWXs77RPv+XtDb0Wbpb4LidQLs?=
 =?iso-8859-1?Q?PbapnKLs9TlZpoZzGZY23bPhKod3bXqG2botgUOconQr2fx0TWhjwV2PKB?=
 =?iso-8859-1?Q?odYugW1BxXWS/Jfc2RTRMwPDbS/EpyqXG5Edl4Kr5oIeJiUQThm2gGFKYU?=
 =?iso-8859-1?Q?MVZ1rtOZsMP7bDt68TfRxgIBtIlLm5J/sqCrdObYZK5+lwC/C3z4aET6R1?=
 =?iso-8859-1?Q?uJiUhzpwfDFrYOyLMm/uGwzvaqHCrQZfbTMIiyWH6skEiSsT+vBx4okdgz?=
 =?iso-8859-1?Q?JtzFU5wlcR5Emspc3tLO6AEoc73U3RBd5cST/1uoEUZtIrCUH40LWesbZX?=
 =?iso-8859-1?Q?f7d2c+6/kXINIw=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?L7zMxZxbzaK62BQfZ/rldtyyQ5B6/iia2UDRVz2f/oeZ8D/Opq3pb1eM1j?=
 =?iso-8859-1?Q?UbJCNwUNfnXLuTWjsrWXx7iUrEDB9Y7+nS1rxOcIG18Pbtrj3nQwGdLqJe?=
 =?iso-8859-1?Q?ekfAAd5G/P/IEQxDNv3jVd1FVuEdqUNU5TqUdZ0QZgLm+vF6HWBcps4/kZ?=
 =?iso-8859-1?Q?u8Q+7J9LNPAfhxEZSZ+wJ6yIwtByp5kXXhr1vXLMr8cQktDsXWFvSQTzkH?=
 =?iso-8859-1?Q?54dZDZnPIl6Ez3Hu31dFPeuiZtNY/CmXV/hiksA+F6YNPxPo4gioMJq0Tu?=
 =?iso-8859-1?Q?bwJ/b2Zq0WRVyKRvMKOar8u+Y5kfHru3lzUjLb9scJur7JoLIu+FbzbbFw?=
 =?iso-8859-1?Q?bYkmlSeBsPAnR667IDLY65kUP3479lxsyjYp6NX/cAyhuz5mWQ5geHa7wX?=
 =?iso-8859-1?Q?lHq/NBBc+ncBkKfPA4OY46fI8f6bBQ6a8yXQW+ozq8tDbAhT3nuBX6Ud68?=
 =?iso-8859-1?Q?An+eBDnuM+9yAdziaHtdqXMTp+6+h2kW/rKFf5whd7Gjeq35vtgYN69N6Q?=
 =?iso-8859-1?Q?qD7/pDeSfWBwtNdnaIshLR2Jl9+Us/wIfJVeydTWKCzPRY8Tf6mU0yfcnT?=
 =?iso-8859-1?Q?rYO5gMy7nnh2++o/1aE5ygZJ1+rLCqnfj374wm5xwi1CG7LGIWCr+VHmQZ?=
 =?iso-8859-1?Q?Xs765+1UiQtwQeQ+TwJxUTdeKUV2cgUFTSAqeG9H6m5U6kDHruj/gK915Y?=
 =?iso-8859-1?Q?EcNV5D75RZpRpnF1nYUGpeJzzLTj9CCcl+7sTiA1v6iTLzkZNfzlkOvihN?=
 =?iso-8859-1?Q?Rq0G2Ubpw1q/0ypshaLFYy54ReVq54RxpaGYYxw7iExOxEFq/DkaeMazvu?=
 =?iso-8859-1?Q?+FtWc7mcdaqFdIg/1LsYGT3RhgETyvW+/eCcxwNRxkJh1xHmz6EQ20mGs3?=
 =?iso-8859-1?Q?kLNvmESWH8GeyS8rrgShgL6ruDdvecWlmd8cXSaDnbIgwqdql+xvHCAYox?=
 =?iso-8859-1?Q?mKC2gfwy+ZOaCOOeoJ/VCZvUs1Ku8Qi0vGaIm6le8crQO353xRlZcoP0Kl?=
 =?iso-8859-1?Q?fXY0GYRNmXXlFBPe8c1nIzVTIzOpfpI11WmZbBw9oxpkGRgzUXJaZor8xs?=
 =?iso-8859-1?Q?8K3cn1aXVIL8LI1n63wrCIeAbDtny/qWUDvmKTsXaJDUmAE9c9khI31MIJ?=
 =?iso-8859-1?Q?7KcarF3Z9JodfblpCXMgEeR3ESx9vu/sMtRrj6XARecv/tpvSD6wrgu3a/?=
 =?iso-8859-1?Q?VPDKlXFvOLByHDUVlI5ZatBi+wnTbOu2G/RCJFII/cspT7w4iIK6MsdtN8?=
 =?iso-8859-1?Q?2ExmdTdxce3Rz453UqaiNy405hdn6vp32rOuCipcHsv4ged1tYmrdzLdRk?=
 =?iso-8859-1?Q?aJlyTNCUp0JraSPxhtEGOv5mtPNdsX5+BwK14mXtD06BoSLYynRJn3Lz1u?=
 =?iso-8859-1?Q?Jg86JspEJbTGLfmznXpM2CsW+rzR0oqQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: CY4PR03MB3335.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b1a8175-b136-4175-d1c7-08dd84069eaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2025 14:36:52.2826
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR03MB7860

Hi ,
=A0
I wanted to confirm if you've had the opportunity to read my previous email=
.
=A0
I'm happy to provide more information on the numbers and costs whenever nee=
ded.
=A0
Regards
Jessica
Marketing Manager
Campaign Data Leads.,
=A0
Please reply with REMOVE if you don't wish to receive further emails
=A0
-----Original Message-----
From: Jessica Garcia
Subject: Access Sales-Ready Data from the Coverings 2025 Trade Fair
=A0
Hi ,
=A0
Would you find the Coverings 2025 attendee list useful for your business?
=A0
Expo Name: =A0Coverings 2025
Total Number of records: 20,000 records=20
List includes: Company Name, Contact Name, Job Title, Mailing Address, Phon=
e, Emails, etc.
=A0
Are you considering buying these leads? If yes, I can send you the pricing =
information.
=A0
Awaiting your comments
=A0
Regards
Jessica
Marketing Manager
Campaign Data Leads.,
=A0
Please reply with REMOVE if you don't wish to receive further emails
