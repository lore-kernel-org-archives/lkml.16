Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11olkn2099.outbound.protection.outlook.com [40.92.20.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E25A1B87E8
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 13:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.20.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743255298; cv=fail; b=nyk5qNex/j48tmMW4/sT2riDhLZyFSSIME1g4JvkkvzF1L6Z0vJEVLTzHl8kK3UTOLmtjI4m2/1xXOHlEZWTrLZQHmzBVw3coYbqxmI0ZpXg1jthg7IXdAp/0tDDgFUgHv0v0SxNijAMBVZ/EvwY2qHguVF48NLQl7+ZE/sX6IM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743255298; c=relaxed/simple;
	bh=nPNDLfCVKIQIiFWP4pEa9UMZAzkoY4m51dHfnlq5DHA=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=duUDDCmkq/70VZ1xdLhlU+JoD6bGGQQPoWS/c3FxSSQl82WEAN36Bf9KPJgCsso5AyvcCivstihbVaXJt5gCrTgkiPaUQOp63kT5eaULWGPemd+IEEkkP0U58GQEkvCBU+7bVoMbMmR7mPmAjezAFc254YZ4H5K0Ysj0T4/n6ZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=hS9iAew6; arc=fail smtp.client-ip=40.92.20.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="hS9iAew6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jUFoLImWP+PGQt3P1JADlUoK7SomfhQCakeg3safppCFw2j9XSRgpJvkpKikDQRIG1MKG8qpo+kZDVWxuUHGPq7HXAR8FBbtk9E0wjrNJQiveu2ZijFrRayQNDzMlFNugIPTBZol1pAeoL/KU2X8aH1+pPHu3gOIzZwx5KGAzlSPguXoyGyr1oJypEXpYN1Wn7Epg6VWDeFGrdOtZ7PtSNobYyWmOsZiqWFrs7DE1d6iCFM8soMrI6wHNBEOFWtckYkdgn0iCbmf7FTHzg4lOl2yITS2N12adlLj6sISqnQrIpw8F8ZDnjZY4uBqxMa42fDQT5AvWD51i+RH/Nqq6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nPNDLfCVKIQIiFWP4pEa9UMZAzkoY4m51dHfnlq5DHA=;
 b=Av5MBWgly/tsBLKGnn0QkNWbi/r6Dv+ytFU39Z4cLsNM27pkx2SV2xhmyLoIBm/XcigXk/lJNdqp8nhCEFu5pwJRJPVAzUc/1Ym6W3OBINdKBaygveUvQVcX0HyitTL5F0g0SO5ISx6zdse7UTZpGhbBfln7dcnI5Hhu6l11FkPnk4wZcNRX+Hy1vwexJtpCCrIwHqujFy3i6g3DdXd+ZeNs/T6TrO8KJlbYdSQCU6z8bZbBGc1omTlcIX697vHz73LsKqnIZYJ6h3HcxV3qQiAsUCiiJywPBC4bJMLDj3LO9GUvdApSYNGY31y5w/ekf3fuzjh/J7Dq92Yl3IpVWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPNDLfCVKIQIiFWP4pEa9UMZAzkoY4m51dHfnlq5DHA=;
 b=hS9iAew6eaDpTsOL+UDzSH9V1KGTI7meBSUwfBobazKokv0efLJuuKlz2yLsvXFG/2omfcCTYOFYvuq48UQwGGnudNg25HtshecnH/sHoW9B+R0VKnXugbX8GtUHw/QyxmA/jQoGH+nRXGZmmBxr8zUwIP2hmqSy5eib8O6oExQhPMycHE0fAjESbNfHfl6YOiUvhfBQXMp7b7piQ+p2gCX2LS86z3iNF/KXjaLivRxw1xKshT565dBBtICyF1AyCamg3U7EO6f0ayRWOJHYnO3dBv3adsSS6HC5US6qFmHJI406Gupb9PTDbOy4awB3uiOqxVWRXwwaa/7NQSA0XQ==
Received: from BYAPR20MB2247.namprd20.prod.outlook.com (2603:10b6:a03:159::24)
 by SJ2PR20MB5826.namprd20.prod.outlook.com (2603:10b6:a03:4c2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Sat, 29 Mar
 2025 13:34:53 +0000
Received: from BYAPR20MB2247.namprd20.prod.outlook.com
 ([fe80::e60:961c:9981:2755]) by BYAPR20MB2247.namprd20.prod.outlook.com
 ([fe80::e60:961c:9981:2755%4]) with mapi id 15.20.8583.026; Sat, 29 Mar 2025
 13:34:53 +0000
From: Ben Graham <ben.usmarketingdata@outlook.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: ISC West 2025 Attendee Contact List for Engaging Security
 Professionals
Thread-Topic: ISC West 2025 Attendee Contact List for Engaging Security
 Professionals
Thread-Index: AdugOPL6PVawQThNTsi3ubB0318R1g==
Date: Sat, 29 Mar 2025 13:34:53 +0000
Message-ID:
 <BYAPR20MB22477835D045C53A784E7189E9A32@BYAPR20MB2247.namprd20.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR20MB2247:EE_|SJ2PR20MB5826:EE_
x-ms-office365-filtering-correlation-id: 8509f06d-7647-4f7a-e795-08dd6ec67d24
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799003|8062599003|8060799006|15080799006|461199028|440099028|3412199025|21061999003|41001999003|12071999003|102099032;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?TcM4PafRSh6X7OGTdmCUjh9fZAl/lbAGSpMZ+pp6OHd3Xxu9FV0zHesDDG?=
 =?iso-8859-1?Q?IsdDSA9Kk74pve/LoQmPzimPIjriq0AiMwKWjnOUzb6V0daQ5CIBGXa7IZ?=
 =?iso-8859-1?Q?foqjuY2O/8BNSHBZ6zwRTQ75tLgDfkZpb7I/qITwrNfircIsHo1jLfIq0K?=
 =?iso-8859-1?Q?7tAKIoJPFGtuNq+9HY98m+KOs38/NEFW4pnDwkyu6OVseuTVBjmOXJSHNN?=
 =?iso-8859-1?Q?F54Lhnrf7IhA/qKFowQgl8XUjOCjgnnMu1j+hzkCNGd87g8CkrGyL817JS?=
 =?iso-8859-1?Q?U9y9eoa6SXfvLCnIHwUQrBu1NAnvDDzpJ5mDu0tLPGg9g4juMPKwDNAyFw?=
 =?iso-8859-1?Q?ldeUH0q/70Kd1F0YTl759Ejz76QrHdxs3I6sxIyjRwxJYl2DZBXdXoZR16?=
 =?iso-8859-1?Q?EpYt8AFHdusvEX3dQceT+EoKEEMh1TGanyPBkNBeZKBEE5vRBcv4w+uVlP?=
 =?iso-8859-1?Q?MhWTvLf+FN44O8M+vna3dMnO/TKHC92vbKvoGhZbLUPfHospohX9Dqm/2X?=
 =?iso-8859-1?Q?J0efXb+kaptK81cFacpucsHmz8DykY4e3037p6XSZulhqkFU0ZChv23/3G?=
 =?iso-8859-1?Q?WCzaxotjdKRpkgx1T6Vvue0c6Yxm1BROm+1TQ4kAEOJ374up//JjEgxPra?=
 =?iso-8859-1?Q?wYreKLHtkxy9mfC+d5yf0knZOteUHFxM3Oy0ooQj0bQXna3Z03YkLwEs5u?=
 =?iso-8859-1?Q?t0LpoYDwOm46uYYqqz3caKHwQiQxzcDBFpY4mhB2UNY0yzklV5unVA2KRH?=
 =?iso-8859-1?Q?cOfu57AtzzKiQm8jpNpTjZ1Vs3UdqBbHM0JmrMBwt72rL4ZVfkuxMiV4XF?=
 =?iso-8859-1?Q?uJyManyfQJO/mcp3tQlcb1bof1A3+7VV+hPF/HjMpYQOgTK19fvTbYKMKF?=
 =?iso-8859-1?Q?wbofHZuXL6S8ypuixWtggUF5Rus+kdvhdTMzMUmkAdJcl17FyIXu4nAWmy?=
 =?iso-8859-1?Q?qETmHB28Y5mLTtkNSqIBA4V6l5luJ+b1EEJbiKWFP1KMjRFuPluVvD9HBm?=
 =?iso-8859-1?Q?rD3RVb4OjnWm7aVHDc3MLbXYfPepncitvQJxG04+QCg+XgQxRJk9Vm0Rfx?=
 =?iso-8859-1?Q?foKTy4ME9HafUtNCo1AF2vRFTPg4ebwujYnzMv3hsKnYbJxjrH5eUIU2qU?=
 =?iso-8859-1?Q?Is2RwhPGelDJmKUw+cabieYhd72+QDstuVfvQFBu51W2WIg6HNAabGft9a?=
 =?iso-8859-1?Q?9Ad6OpZLEwKYm2AZqg4KQnN+Qz5yMP9BRFs=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?4b68qcw4F/KPtXiXD/A4174CLl+GQ1h9QUsd/z/D+zj2qsVH/rscq4ZzWG?=
 =?iso-8859-1?Q?/yQC53q0cfQHlAdMAHy945k8J+A5Kfw1Xs9lfAX3leJ0c/L/Mxx5NoHkoZ?=
 =?iso-8859-1?Q?RMgEdvUfbwcOWZn8iT0z+5DihoM+KnJKLz6Ss7qpz86CiR+ZaZ3XtruBl2?=
 =?iso-8859-1?Q?wJBR9XdYWyg8jcTXNw5EgOhLbktNPVOQU+LZAmPO5OKKVGR7RW8hUvtsts?=
 =?iso-8859-1?Q?B/HLyTeq/CQrBl35GB6HcMBp8PTwl2mWG2XLyrHEVe68wIJRlN05b+3bkp?=
 =?iso-8859-1?Q?OwGdLzmcPcCHsyTj9SOClsZnld69zXK6G/dHXPCKO9KWk2cNN7fed69fE5?=
 =?iso-8859-1?Q?Kp0WEMP5h19idM4PRdZudZourHBEZADcPNebFYSqweTHveaWr2hIzRf4xm?=
 =?iso-8859-1?Q?+ALEiybK1bsqV9En21Ou+1VF90CMBlpfzJeAW4LtOLnEY1jDP0/mWnDA1r?=
 =?iso-8859-1?Q?BcygripcpmbigNPxmPFcnPJhRvBtCKtn36JJiumA6lG661xJZ+Eam8C+QL?=
 =?iso-8859-1?Q?onGaTVHX7MdmqzQpyWbAU4Xo0LWAj+mqlxsmhN9iNanO3r3g6x/U4k0v0w?=
 =?iso-8859-1?Q?35KGGbRQQMlD/tvbAt7o9zaVVQpEzBHjn/yMnOF1BYrhmDqjruxzAGUtHa?=
 =?iso-8859-1?Q?xdMIfz+VO7v26E9dGEOFZ/e1erF/JQ3P0ataXdUDBUDgoJ290Ba5xFssnH?=
 =?iso-8859-1?Q?y0J6IiviqRd1amrXjh5YMko4MLJDBV2uX4Kg3nXeT1dNLEwLp0bFD2P8F3?=
 =?iso-8859-1?Q?6IJ2MnmLYuV++AffhlrxLvLX1vHwmUsMe2KGljpaFfE8/GOEF9l+sRyhMw?=
 =?iso-8859-1?Q?4ZRaWfgaJm2SvFtsnst0C2y8325Pe7eBBOlXu8ZhEiGMTyXAGpm3hZpX84?=
 =?iso-8859-1?Q?pn9BtnU6TYrcacyzdhUfnY6rctq6NRXOjbW1jx2A7ekiH1ic0i3PJJQ4Xt?=
 =?iso-8859-1?Q?00br+Qe/2BouuO3k3cLXTJneX5U7425YcJUVtt6NEG6vVb1fesyqDziBrj?=
 =?iso-8859-1?Q?ETncy5oj9kWVm/wNjATB0NdSLF8ErDrAa4IkIwJJacVP3OSEuh2QvJ3hWU?=
 =?iso-8859-1?Q?/seDZWhxGb+kNSA+NxKOU+DG8fN4PMUgqpzLeTW+m75KZ3d+LeeuQWfLCI?=
 =?iso-8859-1?Q?kO1zrGW6EGjFdpQXpgfIvl3nvjshJWFr12NwbZYna74p77IE3bdOsZ6Yv5?=
 =?iso-8859-1?Q?d14PF68ZNLoGVZ8KCMYxiTcGFhNOBuxQJ+fUa752pkYPD9WTg0XdTNMeVE?=
 =?iso-8859-1?Q?anCpp6LzIdtQamI7PjliRgJGZU7/gUpnqmiDUIitTXuTupepE0FGJkRDba?=
 =?iso-8859-1?Q?FwGeFpalEBAt+kgdhxFix6G8/Azaw5UwoxDlURzoKPzqe0alBmv7GHO2rH?=
 =?iso-8859-1?Q?XdTXmtcqoT?=
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
X-MS-Exchange-CrossTenant-AuthSource: BYAPR20MB2247.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 8509f06d-7647-4f7a-e795-08dd6ec67d24
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2025 13:34:53.7900
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR20MB5826

Hi ,
=A0
Are you acquiring the ICS West 2025 list?
=A0
Expo Name: =A0International Security Conference & Exposition West 2025
Total Number of records: 23,000 records=20
List includes: Company Name, Contact Name, Job Title, Mailing Address, Phon=
e, Emails, etc.
=A0
Thinking of purchasing these leads? Let me know, and I'll share the cost.
=A0
Hope to hear from you shortly
=A0
Regards
Ben Graham
Demand Generation Manager
US Marketing Data Inc.,
=A0
Please reply with REMOVE if you don't wish to receive further emails
