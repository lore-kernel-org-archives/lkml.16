Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB801DED40;
	Fri, 11 Apr 2025 00:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744329602; cv=fail; b=Xmznvwruy2o8Z0juaJQOphEwTmdsgbIUfQ5xpA7YLaoGqo5+A0O1KsZSZCGF1NYT6vcqGuyD5BEk8tf0bp+3UPD1advsY3qc+1qEPGi324tO0EKrivvdwVCKu2ewHcHQqrcbZP8CGSSplivj3L3TJz7fNlnJFetjwrEFzNlExWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744329602; c=relaxed/simple;
	bh=k+KsCpeJSYomyImQX6GP7ZaMCoEgACMzeWBFjwr4FrY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I0zmYnz36aIAvgcsYTXfh8E0uUd0/9WsT/ieWllxJHg2PhjTlOfgdG/1DWi5GhvT1YhYDlzXktrelN63xzca9JnfTyt+9b/I2mTWEmcVtkFpdaCs4ut/9NGn1SCozGnZsNplYE1cFSBPKw/1ICnsd7KNhgMgJDq4NGfwaPz1+Is=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=x2OFsS4D; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="x2OFsS4D"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AKEY4X015234;
	Thu, 10 Apr 2025 19:59:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=EOx8L
	QHnptedV2jxbv0LQqbB3P6dMHh/mhXkIpX8uGc=; b=x2OFsS4Dlkb4eurBdvJjQ
	fe4k4O5a+NEfs5neMdHesCvF2d5rShjHl9NQkWip32+Q8umEoD4Wx+MvoYOJFTzI
	8rwIHSmQDb5bFC527J3c6AgBbccLDjpZshKgKwv9nc9gsqcbfekCxf7o0L5WX1ol
	eg0KnvzvFTRFSzCG2go8/j4NabaFLIR1qjIxY3iRqBmo93998aCVlC2Fo5iGuY72
	CRulWoPgRwPtZ91JsCl5FJFOk8SM44ywdcgJdZTMurCSPcz4talqm6FYnQei3OFh
	GEw1h1buLGuMDhBzAxkkj3XbaobL0f5gZaLrDWUwKTQkrXor713ui01vVw28clLx
	Q==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazlp17012038.outbound.protection.outlook.com [40.93.1.38])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 45u1e6qmfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 19:59:39 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sk4FE0sqUVpaoOxGdt6UNx+uPjolBtI+Eg40zvWDM2zSaMFcVIGLoOapTF+iS/TeXoEd8uTtmWrKafsxBu4NBB4T1x7/IRUNgfpl/Ub+Ud8XI9FfUOycPnIkxoiD07+RVQM46tXe3IrVifXi8wr33l6z4jLib/oe4iLlEtvoOch4XHi4ZUlQQ66iVB6jsSONaffU4EWhDflSjs+dXY6//JWqTro+emED3s5Gxre0Xr+R4ANc3pW3ObZvC+/FSnNyWko2HaNv5qfAOje4C9tDsw38l/t5ObHo7WJhChqqdmLM8TJ2XqEYTyRdh4U2NZl3v+sQ0GgCYIIwGZ3OmkEXVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOx8LQHnptedV2jxbv0LQqbB3P6dMHh/mhXkIpX8uGc=;
 b=mJxe4eQU0UM3T2MU1wtbD9S6zy7psKK1pKMh2HiWtT/RCmmolOwjBdP/4QWzjNq76wfZg3HDxjLZVb6d4m5+I/8C8aWmOYS0g6x7N8IL6FWVPoB06a6twMa8pNBXQ7eBZkjhhoMcbtIhGJE4iiyojwJwzFMXOt8hTiqupocjqAQENHzFTq9a01DuCZAIIO0uJ0r+Py3BzTKOSFsKSt4lsOApQ5C84bofc2KBFIUcj1m84S1nD3qhPQIkepSixosQC7+nABkiBiq1pJ6uUzmMNq7w5FSt1Wz51D9WQeg5cgmSNSkfYIf14SH+6+n2iJumz51q3ajZF5U+Dqv69FLJEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6351.namprd03.prod.outlook.com (2603:10b6:510:ab::18)
 by PH0PR03MB5687.namprd03.prod.outlook.com (2603:10b6:510:39::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.40; Thu, 10 Apr
 2025 23:59:38 +0000
Received: from PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::71f7:8e63:e91:a354]) by PH0PR03MB6351.namprd03.prod.outlook.com
 ([fe80::71f7:8e63:e91:a354%5]) with mapi id 15.20.8583.043; Thu, 10 Apr 2025
 23:59:38 +0000
From: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
To: Guenter Roeck <linux@roeck-us.net>,
        "William A. Kennington III"
	<william@wkennington.com>
CC: Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] hwmon: max34451: Work around lost page
Thread-Topic: [PATCH v2] hwmon: max34451: Work around lost page
Thread-Index: AQHbqCrLvrx0jOj/y0ud/TRsSfihjbOaiWjAgAMOyVA=
Date: Thu, 10 Apr 2025 23:59:38 +0000
Message-ID:
 <PH0PR03MB63516D1BCA80A50B0C3E029EF1B72@PH0PR03MB6351.namprd03.prod.outlook.com>
References: <20250401220850.3189582-1-william@wkennington.com>
 <20250408011006.1314622-1-william@wkennington.com>
 <7cc91dea-c24c-4948-9916-8cad865d023e@roeck-us.net>
 <PH0PR03MB6351903275DC93C9C543B096F1B42@PH0PR03MB6351.namprd03.prod.outlook.com>
In-Reply-To:
 <PH0PR03MB6351903275DC93C9C543B096F1B42@PH0PR03MB6351.namprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6351:EE_|PH0PR03MB5687:EE_
x-ms-office365-filtering-correlation-id: 1ce2a411-6852-44b3-99df-08dd788bc073
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?4ApsjinbHa+1M7aF/Q5s6GwW9qN8DI1omiXbuzsFxtKpybNQ5kQmCAwvWm3b?=
 =?us-ascii?Q?PwMiP5dbtDMaMq/xwxNggjnz02SOQKfLzNU/UEId+je5vXBxVTMTmzK/Kc2C?=
 =?us-ascii?Q?YkuNVkzPb9b64n8m3ALL2D1hgecjMQvw6yCZ0qZHhTfvRCUtQjwM8YpzVTBJ?=
 =?us-ascii?Q?r2XACh8ece0PyOyxLkkBouNOtKEQlrLlyD5HMRzH+ve4dCpZpbdUJHfz/vKh?=
 =?us-ascii?Q?haOIebsdS1DtaAPFXQaSA0gR0ni9V413vByo+GXOBEcQic62tdhVvST6StcX?=
 =?us-ascii?Q?B4PpDf85w55MpwqyOWBLTtQqP+vFY+lP7HbB+EYOM6A4h/4eC5fmjtHdL4f9?=
 =?us-ascii?Q?nvxVkMpV5ARlKBCOBoQqAGCpHVr3yTHst5vP4QS1CB0NfAfjCAIzHOEL+lqj?=
 =?us-ascii?Q?HcH6trsZ1Ts35FMWCz4/oZ4u6vAoOoJfm5Px1KnQz6w5byc0oV9tf6TfTfqp?=
 =?us-ascii?Q?waJdU7dOISCjGy4Yca4dsFeLmvVEyt8bjkLZ5nqUDGsMrF1ws2BgZ4n3EdGz?=
 =?us-ascii?Q?JMkcfG36jfIJldbKE+UeVnng++b+GPffYuNy/vdcpAcf689+Lyjh90k3U6fP?=
 =?us-ascii?Q?5mIrG3dfGNub93Vly2HUzR7p2bHE4DmHk46+Zu7mo5BaQFTGdRhvSIPE54PR?=
 =?us-ascii?Q?+Iot6ywCEZgUsH7sZ2y3DLNNehX8tKLRfwAG1bsyzh2NWV6SBCl+t318LiJg?=
 =?us-ascii?Q?KH9RiY2iTiKC7Jg6eWoa7VbEKAI5l+e36Wn7Po1P9VT5FRBv9WTbNWDinGok?=
 =?us-ascii?Q?XxBHsOCRgvrEjzkf/RtpxiqsBG28QzU+9sJg9qxxz3HzknTadD1WUp/gS2/a?=
 =?us-ascii?Q?n05LGdVGP0HbqHM4glMU6Pfj0rn+HHWyEGBWrAq53wIrQj8htJ9XlEZ2XB6X?=
 =?us-ascii?Q?w0JSA9JOymRqKVI7EtqNJ7bhbWUDFYurwbVHGUJ+tOH8Bth9m20q4dp3ODrX?=
 =?us-ascii?Q?PwSc3yUlxyTrVt0rAdi7tYiFqwtop2iEeJ+3JEqBSnOCRbgJ1QzO/peGtNVo?=
 =?us-ascii?Q?6lFBfiAs8b2Mf/ieg03/NWzBC0Yv958bFga04sfNVqpyQ28PgRz5HMc9vcPF?=
 =?us-ascii?Q?gFkpxFRv9KL43olupQRHkxyFDJi4CawWGSXixRwVM2/OM3a+h/yKqXsopBPY?=
 =?us-ascii?Q?kLXGezJRrwE81mYHEXEHFNZU7ePdjX0UNtG4lcf0P4PtUlA6+g9HCa1c3zRc?=
 =?us-ascii?Q?2ZwV4y3mfegpfk1+53KAIonoGa+cQf++me5Q0yKtWoVZIxhHPhBXHM1W1cLY?=
 =?us-ascii?Q?M/9RXEw++xk3aN86Br0sTJbgcP0jxCD09M+D+O/2/1lqA5h9eFuCPj8Fdf9e?=
 =?us-ascii?Q?NLqDQcV2+oP+kSFxLhqY8AatkwyYst76aHoimMe3mIDrUtgFkIdcOvoAvs/F?=
 =?us-ascii?Q?93ImmlQNpbx+qDbt9FZySX4yrP/pIZX9VbpLIAwgQyGh66hJVCASmJeR3DKL?=
 =?us-ascii?Q?KsWOBuzfN2YObRoBfNWORDgLr6g6NBp3tAuYb/7DZ+N8xWSObgu/ekgMZfyt?=
 =?us-ascii?Q?jxpfgrxzi0YuB48=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6351.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?g3EjyEwsA4F2jXBjlfsB/7js6WlQS424qqZku4nXhh+BFiYro9eWnIO4Z3XW?=
 =?us-ascii?Q?fVwmRPx9D7KJC4ZhE/5N8CGF9/wcYKZuuplQF8k+kSAAgsawESxnfZWO5iMz?=
 =?us-ascii?Q?lFFr9/6p7fdNXN0yw0hwhMhObLPgqKfgsAUuCLmmm7HYMrkQ7aGfPwjXDK5d?=
 =?us-ascii?Q?QPTushdE1JAH8pJAWrIR+3VrPhabtFvhoyfgGMH0ckGdYiz7beh6wyf/mXP4?=
 =?us-ascii?Q?DbG1xZIi9gAuUz+s9uY1UWMErIJ/jVimb495uhAyvKJo6YnxaU+ZHVoMUHFZ?=
 =?us-ascii?Q?uHoGSn88WYyIwgDXdjDfM6sQioRurqUv4O34VZl6vP0KirmCROGZ+jEK9f6h?=
 =?us-ascii?Q?aHpKkOL66TyV85/XCALSw2XMCoYZOivK4+87FCdPCB0BLP64J1BFEXEWYqur?=
 =?us-ascii?Q?ZAkVqriU1uveLIW6bosIxqdcbisznAnS/mvHJXmHne6zGa0l0LyZHY28LWg9?=
 =?us-ascii?Q?6kzTw2cjlDWQuGPJmu3V1vSc1DKPbe4xwLeWBDhvF7V0PQguX659nkRkCBzs?=
 =?us-ascii?Q?eIoZi0eGvUuvYtmVjxJfA3pVH8b1sLT0DkuqVZ+LStoxFI9Hxn1jjxEQwpj3?=
 =?us-ascii?Q?fgBgOR0D6SOvsJNBYRbbtcZvD3T5A7HE4ad+avmgdZOM2gNpURdU/vqZeFu5?=
 =?us-ascii?Q?xLX95uwhtdxBLi+L+nXe9j6KseiyTd95g8wuAMpCMFXrLosVfLphvsgjZLqX?=
 =?us-ascii?Q?QxTNp3d9Ex8WAw5fWoKPobcuwh5VlRttEn0H1JNT6LssQGsq1TIYSnUesBe1?=
 =?us-ascii?Q?86p9iyvOIpMNAD/qFTrtK4heKdKHTkOJjd/SiXBYusEZmwgXQ83wH9IH5Vli?=
 =?us-ascii?Q?cp9ZQVmxsit1jmvnh7S4QADqHobHGS4RFYIulvYE0rGGBYAGRNAs7GPGPruo?=
 =?us-ascii?Q?Hm2DuTX8YydOP22E0yRVSNbtbTXfhFa/d6/KYzhYRrE0AHl0+3F6rTKyT+qK?=
 =?us-ascii?Q?TXwR0E9ssKIrydQwgBcbSUWHXE0uDVbKFZFWS31L5wERDr5+oTYi7p6WzTjs?=
 =?us-ascii?Q?6+2U+qm95SuIdaUwUX3lNbmHxtZNaAWH3vJ3dMsyGcpROR9VwKVjx2CppwdF?=
 =?us-ascii?Q?wK1+lJvHlf+7s5J33QDVXCl3/uC3Eth8mSKpPH9fS4cRoawxH+U9N6PLeUn0?=
 =?us-ascii?Q?Qm8cZUx/t+g63Yuq4lSBZaJEn8LptFZHmGz3zgivESzEnG+8d/5vAEzpIOFq?=
 =?us-ascii?Q?jEAJjSZ8X2jPQ4w/itXSRg42rqC/VjCwKZ7X8EiqRT1FbRCTKAkBvPPoc8gM?=
 =?us-ascii?Q?MXErJHp8OjUrMk3h87vbZewx0bnfN3gElQtCQ//WmZI3tWPW3wlNwCMGtQ9h?=
 =?us-ascii?Q?2Mhx1Q00wN5JIcuksH6CTNdukliipPeROHD1ipinLPrhssUXaZTmNBE41XrP?=
 =?us-ascii?Q?yS9VEgVvV7UyV6ql2wC9DTtkrp9R1ervtZ6cHzn9LVdBP2t+Q8Q0chB+N7WF?=
 =?us-ascii?Q?UupcNIEvAkqTC6EdoY1qFbAuLRpLljk1s9RwHYJDZLcLjTf5onqjMtpH83Sm?=
 =?us-ascii?Q?Ea2aL1OZ98dLoHCMMD0iLibqW6F7KiuT5ATEBqQWMcYso/7hwG9iZSvFbCpY?=
 =?us-ascii?Q?jFjwWuaI6hjwnNHNvvwwSgJzUDy72epsV46vzoKhHaVgn8smxuB3gorfCpMe?=
 =?us-ascii?Q?8A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6351.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ce2a411-6852-44b3-99df-08dd788bc073
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2025 23:59:38.0792
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +xih/Oa0tJF9/Z5QKOwpjowr6c/tgWyyoS2/0SpKSs3yH+Gx8Q47aOO1ZoZXYNB/GBJS8vsm542iTMWBJG47Fnptn9laYEj/iy0oEhHvLnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5687
X-Proofpoint-ORIG-GUID: FCoHFh2qzzZ2tJ8XcZqMbOxvEkaDZbCo
X-Authority-Analysis: v=2.4 cv=cdjSrmDM c=1 sm=1 tr=0 ts=67f85b6c cx=c_pps a=a0mreH8AhMfks3Nq6fhO9Q==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=L-xz6NSyAAAA:8 a=jq869hbI787a-oeI10sA:9 a=CjuIK1q_8ugA:10 a=H7nlQ9NbTXmbZqfEVjPa:22
X-Proofpoint-GUID: FCoHFh2qzzZ2tJ8XcZqMbOxvEkaDZbCo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100174

> > [External]
> >
> > On Mon, Apr 07, 2025 at 06:10:06PM -0700, William A. Kennington III wro=
te:
> > > When requesting new pages from the max34451 we sometimes see that
> > > the firmware responds with stale or bad data to reads that happen
> > > immediately after a page change. This is due to a lack of clock
> > > stretching after page changing on the device side when it needs more
> > > time to complete the operation.
> > >
> > > To remedy this, the manufacturer recommends we wait 50us until the
> > > firmware should be ready with the new page.
> > >
> > > Signed-off-by: William A. Kennington III <william@wkennington.com>
> >
> > Applied to hwmon-next.
> >
> > Alexis: Do you happen to know if the new revision of MAX34451 still
> > has this problem ? Also, it would be nice to get some feedback if the
> > patch covers all affected devices.
> >
>=20
> I unfortunately am not aware of this. Let me see if can get an answer fro=
m the
> engr of the part.

To follow up, here's the exact response I got.

- This is not an issue with the part. As the fix mentions, "the manufacture=
r
recommends we wait 50us until the firmware should be ready with the new pag=
e".
Compliant with I2C/SMBus spec, some parts require a longer idle time for th=
e
bus to be free before receiving the next command, in this situation it is n=
ormal to
recommend a longer idle time in between commands. It's more related to the
part's inner timing and architecture.

So I guess no specific changes related to this was made for later versions =
so the=20
patch here should cover all.

Thanks,

>=20
> >
> > > ---
> > > V1 -> V2: Make all page changes delay the required 50us
> > >
> > >  drivers/hwmon/pmbus/max34440.c | 16 ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> > >
> > > diff --git a/drivers/hwmon/pmbus/max34440.c
> > > b/drivers/hwmon/pmbus/max34440.c index c9dda33831ff..0d9cb39a9cc6
> > > 100644
> > > --- a/drivers/hwmon/pmbus/max34440.c
> > > +++ b/drivers/hwmon/pmbus/max34440.c
> > > @@ -12,10 +12,19 @@
> > >  #include <linux/init.h>
> > >  #include <linux/err.h>
> > >  #include <linux/i2c.h>
> > > +#include <linux/delay.h>
> > >  #include "pmbus.h"
> > >
> > >  enum chips { max34440, max34441, max34446, max34451, max34460,
> > > max34461 };
> > >
> > > +/*
> > > + * Firmware is sometimes not ready if we try and read the
> > > + * data from the page immediately after setting. Maxim
> > > + * recommends 50us delay due to the chip failing to clock
> > > + * stretch long enough here.
> > > + */
> > > +#define MAX34440_PAGE_CHANGE_DELAY 50
> > > +
> > >  #define MAX34440_MFR_VOUT_PEAK		0xd4
> > >  #define MAX34440_MFR_IOUT_PEAK		0xd5
> > >  #define MAX34440_MFR_TEMPERATURE_PEAK	0xd6
> > > @@ -238,6 +247,7 @@ static int max34451_set_supported_funcs(struct
> > > i2c_client *client,
> > >
> > >  	for (page =3D 0; page < 16; page++) {
> > >  		rv =3D i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
> > > +		fsleep(MAX34440_PAGE_CHANGE_DELAY);
> > >  		if (rv < 0)
> > >  			return rv;
> > >
> > > @@ -312,6 +322,7 @@ static struct pmbus_driver_info max34440_info[] =
=3D
> {
> > >  		.read_byte_data =3D max34440_read_byte_data,
> > >  		.read_word_data =3D max34440_read_word_data,
> > >  		.write_word_data =3D max34440_write_word_data,
> > > +		.page_change_delay =3D MAX34440_PAGE_CHANGE_DELAY,
> > >  	},
> > >  	[max34441] =3D {
> > >  		.pages =3D 12,
> > > @@ -355,6 +366,7 @@ static struct pmbus_driver_info max34440_info[] =
=3D
> {
> > >  		.read_byte_data =3D max34440_read_byte_data,
> > >  		.read_word_data =3D max34440_read_word_data,
> > >  		.write_word_data =3D max34440_write_word_data,
> > > +		.page_change_delay =3D MAX34440_PAGE_CHANGE_DELAY,
> > >  	},
> > >  	[max34446] =3D {
> > >  		.pages =3D 7,
> > > @@ -392,6 +404,7 @@ static struct pmbus_driver_info max34440_info[] =
=3D
> {
> > >  		.read_byte_data =3D max34440_read_byte_data,
> > >  		.read_word_data =3D max34440_read_word_data,
> > >  		.write_word_data =3D max34440_write_word_data,
> > > +		.page_change_delay =3D MAX34440_PAGE_CHANGE_DELAY,
> > >  	},
> > >  	[max34451] =3D {
> > >  		.pages =3D 21,
> > > @@ -415,6 +428,7 @@ static struct pmbus_driver_info max34440_info[] =
=3D
> {
> > >  		.func[20] =3D PMBUS_HAVE_TEMP |
> > PMBUS_HAVE_STATUS_TEMP,
> > >  		.read_word_data =3D max34440_read_word_data,
> > >  		.write_word_data =3D max34440_write_word_data,
> > > +		.page_change_delay =3D MAX34440_PAGE_CHANGE_DELAY,
> > >  	},
> > >  	[max34460] =3D {
> > >  		.pages =3D 18,
> > > @@ -445,6 +459,7 @@ static struct pmbus_driver_info max34440_info[] =
=3D
> {
> > >  		.func[17] =3D PMBUS_HAVE_TEMP |
> > PMBUS_HAVE_STATUS_TEMP,
> > >  		.read_word_data =3D max34440_read_word_data,
> > >  		.write_word_data =3D max34440_write_word_data,
> > > +		.page_change_delay =3D MAX34440_PAGE_CHANGE_DELAY,
> > >  	},
> > >  	[max34461] =3D {
> > >  		.pages =3D 23,
> > > @@ -480,6 +495,7 @@ static struct pmbus_driver_info max34440_info[] =
=3D
> {
> > >  		.func[21] =3D PMBUS_HAVE_TEMP |
> > PMBUS_HAVE_STATUS_TEMP,
> > >  		.read_word_data =3D max34440_read_word_data,
> > >  		.write_word_data =3D max34440_write_word_data,
> > > +		.page_change_delay =3D MAX34440_PAGE_CHANGE_DELAY,
> > >  	},
> > >  };
> > >
