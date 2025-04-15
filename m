Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDFB284680;
	Tue, 15 Apr 2025 11:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744716449; cv=fail; b=X1M3bLGwgjE5kWgGLOW2sllArFs6UHQyyrbhJ9xEjC3mfE/TLb/s4KPsy0VBonUJq0dC5JuHOOo+twoKLVw84ZyJu3M6SDB9a5uORiNK72ox6TGwL/iaFoA01R2nxHjFyhpOHbrm61Kx2iFSLkRXhD6QW/oq8sQw3vt/rJv9Yu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744716449; c=relaxed/simple;
	bh=aqHgvX+2T+6eF9zHyrsHD5AZAZWTkuqCS86AUMn15MM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TFnc8br1RVuBzA7AXycnG4z/8UesLQaAwP2xsdO61iXNU5Uj/14M4yrCrs7q0+Fy0Ir1JXFvaAnzwFxUBokyd3r9Zy5eJgGK2+Ayg5iaA7sHY4RUBz94DbSb8nzyxteXCFbcYqr0Y+tqRuX6YZI39od5UTAXJTB8+mCAeapJ2T8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Mo4Coqik; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=GyWCXxb0; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=cGJ4we6Z reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Mo4Coqik";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GyWCXxb0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cGJ4we6Z"
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F97BRN019750;
	Tue, 15 Apr 2025 04:27:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=aqHgvX+2T+6eF9zHyrsHD5AZAZWTkuqCS86AUMn15MM=; b=
	Mo4CoqikzFscEAEQJq70Fsp3BiMvc6dLB1ziAIWDCu5YdVChvtvFFCv58iejoXao
	tuwSRMTpvBGYuwi3BtR/tWkbl4C9zGA7atZukSqz0IVe8V5e5jhD6ICZOXc6IvAj
	YLoxfm3YpXXjMqqyVLwS1nGmEp8gHE/Ead8D+U7hF8CoCnYoyDzg+X5R7y60O1Ok
	MVUCuWMzy09g7qDNAp8ReZSC7h8a52DND+K6vrryF6ICdPe+dHLE6Woy44JYBJ26
	l8eMIulKAVYwVXvtl7oMfapPc013MvvsSXPPshy+KlrTNOcjiB58j/9/FrDWMRkJ
	/tqJV6KO/vCsKsbE7MDEVA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 45yqe76uau-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 04:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1744716423; bh=aqHgvX+2T+6eF9zHyrsHD5AZAZWTkuqCS86AUMn15MM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=GyWCXxb0vfnb5EtE5USuna5LQzYyrblk1p/a0TkdoNlWxUrIa9XXFrQoDw3GgcfUN
	 s4oLrsYmWPpmDtFyxHPSJspzIoPKxNr8OFpKADy2raFpLOh7bH4c13qmpPWpN6ESaD
	 lyP5YJAqog0Fe+0fyGlCy39SRaNIr30JW5Vc/ECq0AeWZZNGHgyOQPz+g+H/5648Qe
	 Q+ya5VZCRazcPIw+xcd/tTFqjMKTIDR4eq5Sv21qWc9LN8ZjyrGdeBdiKuw9hx9TKD
	 pHO5Vhp1FfBltb9N5cpffMZ/VWjKNmptMcs/M4l2IlADvSxJWeULXA+LTiYrx8rTNh
	 Ae96og/Mem/Sw==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 12C00401F9;
	Tue, 15 Apr 2025 11:27:01 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id B1793A005D;
	Tue, 15 Apr 2025 11:27:00 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=cGJ4we6Z;
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2042.outbound.protection.outlook.com [104.47.51.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id B5763401E3;
	Tue, 15 Apr 2025 11:26:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MrrL+/rOa0ByOO29MuRe9+SXLGvvNM6Aat/5He7qbII9T2Oohz+xiFluPV38yc8tJZNGznH8maEO6erWO1s5Qnr6aiF5zycnYqwo2VngiUwoYtCnBH156W1CYCV97I/RX2MhDMVQpg0Pu1fFu9u07nFsKMDGvpxlt4uTvAFt/GyGItLV7Qppx9bmtsoVOXuD6lT/JO6TKgjstoeVziYTUN3Er4Ga84MlmCAwC9tlzb7aLPBHjCrgXdnUdceMtmIyAPpjnOGwf8ItBTvuh2Rj40Y4xKjBgcQtEl82/tH+6njA2f8lY2ay/AHgd8hbpawqoyEiUzgi6V0voicatIo7kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqHgvX+2T+6eF9zHyrsHD5AZAZWTkuqCS86AUMn15MM=;
 b=siVFCv+LzPAOCssG907oszncoLkI8Y/9vb61OQAkSFaPtbq4m8juCpJYhhkmWmA/1OPMi8EM0he/KAwgTi1Ni96odAd0FncAH5KP4TnsuRv9zqE1oEdv19a0BI2q3SjMGKU4bJ6puTieFhJL9LLOPwQxobr66/hvvkBV3P6KkmbEv7u0PZe0xfCAQoyqJP2VVAoxCm+URJO5yM8oVwcNx9k9EDnNnN0LGJwcgDLI1NUkIeQRPbatPuGcBfb9jK6S2p39T6x2/Vy7l3FSydm5bxAJxon5b5BTLbchN51Pv/ZfVCCsDfOY6BLWtgGCyW7YrDggx0/0J1UUcWnL8iOzbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqHgvX+2T+6eF9zHyrsHD5AZAZWTkuqCS86AUMn15MM=;
 b=cGJ4we6ZIezJjpc5XiBR32V+8thkeB7xN29PfCCrNS8A0gP3v+BEVmMbzMq7ZY5N8nFKAqD10nO7E/zl1LI6VT5jMuX+lV9gmgtC6tjRwE8EiXNPyeRDDtEuBFyk2nyiI6u1J6OKx62tXHgECFtCDcKYwToODemY1S24ruhJrqQ=
Received: from PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 by DM4PR12MB7645.namprd12.prod.outlook.com (2603:10b6:8:107::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 11:26:55 +0000
Received: from PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::910f:c354:ea0d:1fd]) by PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::910f:c354:ea0d:1fd%5]) with mapi id 15.20.8632.025; Tue, 15 Apr 2025
 11:26:55 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Alan Stern <stern@rowland.harvard.edu>,
        Luca Ceresoli
	<luca.ceresoli@bootlin.com>
CC: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Kever Yang <kever.yang@rock-chips.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?utf-8?B?SGVydsOpIENvZGluYQ==?= <herve.codina@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Stefan Wahren <wahrenst@gmx.net>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: Re: DWC2 gadget: unexpected device reenumeration on Rockchip RK3308
Thread-Topic: DWC2 gadget: unexpected device reenumeration on Rockchip RK3308
Thread-Index: AQHbrV36Yt40yDyRo02Ih1W6li2lBrOjaf4AgAEt2YA=
Date: Tue, 15 Apr 2025 11:26:55 +0000
Message-ID: <cf84f5ca-8c7a-b6c6-492c-c9cf6f73130d@synopsys.com>
References: <20250414185458.7767aabc@booty>
 <a96409af-4f82-4b65-b822-dd8c71508212@rowland.harvard.edu>
In-Reply-To: <a96409af-4f82-4b65-b822-dd8c71508212@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8796:EE_|DM4PR12MB7645:EE_
x-ms-office365-filtering-correlation-id: 34ca2bac-ced3-4bef-3441-08dd7c106d86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YzVQK1BZeHNTMDJaQ3F1RUN4MFhtWHdKajNGaFdwYXV2UGprUzM1OFVzLzJJ?=
 =?utf-8?B?ZEY4Mmd0M2taOTNOSWxZeHB0cjdoanZWaHpzZ011WmMxYlVuTlBXMFhxdUFk?=
 =?utf-8?B?b3JSbmNFL2hGMEE4NElMT1h6eitJL203ZmpVcUNWalQwVmdDVWt1NVRnWXQ0?=
 =?utf-8?B?K1dMWVlWby81aEt1NDY2NXhnVTZJNU9ORVJrVVhFNTdYci9uQWxTUUtZL1Bi?=
 =?utf-8?B?T21BZCtYMXYzSWJSTWF0MDJUNlRTR2tyLzBKWTVldzZ3WEFkZ2diNEhtZlJG?=
 =?utf-8?B?a29Ma0lDQXhkMGFLc1RYWTJldUFpMGpBNldCbVErMVVQTVFTN2YweWNMYTh2?=
 =?utf-8?B?aGdNeVppSGxoL2habmFENEVvaHJ2cWQ1L3NIYmExcGFkT2RPVTdMcFBNNmhx?=
 =?utf-8?B?ekllMWxMOTZMUEtRd2FQRDJlYldKYlJad3gwejhubU5JbmhmUkdaZmk4Sy80?=
 =?utf-8?B?Ymd4N1NuZEJBY3B3TXV0ZXEyek5zd2pqc1VQWGJnb0ZyTnlXQlByOUgwVGt0?=
 =?utf-8?B?UzBJTGtjYnY1UkxqYml3N3JwQzR4ckFOTkNSZ25LWDNRN0xlbnVDM0JHb2gv?=
 =?utf-8?B?WExjOEQ2UXVCV2ppTUV1QzhvNzNISTJPUHVZM3BVczJESUlHN291dVVtSG8r?=
 =?utf-8?B?NmdGeEtpeFd4SjErdkhmV0IzZ2R0UGJ3M05pOUdtYVVYUlpLdHFGejVkbExi?=
 =?utf-8?B?cXUyaGIreHk4WmllU2VQZ1g2Z3AzUnA3UGdrT0FnT0JpS0NlNmo3WjlCc21r?=
 =?utf-8?B?b3kzSUFQQWVuT2c3aGg5c3ExaitCamN2anZOVUUzc3JFMC9WbGFUVDhJWlFF?=
 =?utf-8?B?S2ZRTWwwdUF1U0drSEpzRmJsQXVRNVpxZ3FpVjJ4aGJoOE1BSnBVQ0xxN2E4?=
 =?utf-8?B?L3lNWWkwTFRFcDZjSUszK21xM2N4U3VrM2J5S0dJTUUzL3E0Q2lab1JFeWtV?=
 =?utf-8?B?RmphUkR1QmV0Y2wzL01jQ1RTU012QlJPTnZtVjMzNi81VTg4eisyWGpOZU83?=
 =?utf-8?B?RnBNUnNQbE42QXB1MkZTS0pKNkhsS1RMYkdORThSbG9RUWxkZnIza1p3Ri9E?=
 =?utf-8?B?M004YU1WK0hJcW9zdy9Xc05wZ21XNTdkSHdjL3V0bEV0dTV4Tzl0RDJPZTVI?=
 =?utf-8?B?RE9tV0lGTUx1MWk1R3ZLRGlCUXRBSC9lNTlyMUh6SkhOdjNpRmh0KzhKWlRo?=
 =?utf-8?B?ZDFsQXVGQ2lJYjNnU3AzbUt3cHZJKzRYbTFtai9zYm5xRC9tcUpJQU15c3VQ?=
 =?utf-8?B?TTErTHltM3RoY2JWR3RMWEtaS1REK213Qnp4UHVJcjRmM3BuRjUyR0NKR2hO?=
 =?utf-8?B?OVpsTU1hR3pTRHZ1L1ZqWS9SeThVZHowK2xlV0xIa3pUVkVzbjNuUkNMWWpF?=
 =?utf-8?B?c00vSVY3WkNXbUVhNXZ4TUhockxwQjFVUlVqZFNpRFdYT0JmZmlZK3dRMCs1?=
 =?utf-8?B?blZacHRCbTRVNDc0UjVWUnJ3aTFFcFFONDh1Z1dwaHkycTF5Ty9sZEVhd2Nv?=
 =?utf-8?B?aitESEt0eXRLZmZ1Tm1GaWZqamJ2UUY3S0U4dFlIWWpiY0NsZW1EWCttRUNr?=
 =?utf-8?B?Z1prMVl6Y1NzMEU3L3lXVTlma3cwU3Q3bEN2Z2t0THNFN09jSythOHJYQndR?=
 =?utf-8?B?ZEZDekJzNlc5bUFhcFNvbHZJRjFSbEk2b2RvTkI1UU9RakJua3pmUEc5SVZp?=
 =?utf-8?B?MzdsckI2Z29ha1h1eXdQT3ZGK1pYNGt3ZENzZ2F0OU1GTnlrM01uK2JqKzlL?=
 =?utf-8?B?NmlmSDRwZWZiZy9xV21PRFZBbFFtTFRrWnc4Z0pBcktoRm5keUxhWXpiemxH?=
 =?utf-8?B?TVV4V2lTVmt0WVY1dk5SR1RZU0NOWmJCa2x1aEFMZmhDNWdpU3pIcVN3bnp0?=
 =?utf-8?B?QTl5eUpzbGRLRlA5djhVKzd2a3QwWGxoVkZkMVpLRDRCaWROVlZTUUtVY1Rz?=
 =?utf-8?B?dkg1akdzcnEvVXZHYUxUSXZzbXB6S0hrTWFDT1NFLy9ib3ByQVlhUmUxMGU4?=
 =?utf-8?B?d2h0VFQxRTBBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8796.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WVFIaTZ0SW5KN1ZxamFJTHJOby9taDFha0tDTmtXckE4Wnp0Z2RySkluNDN3?=
 =?utf-8?B?QmxjZ1F5cXV2bzd4ektxOUpwSGVmSEVEWk5kanYwUjRxZHZzNFBnY3BRWHZ1?=
 =?utf-8?B?UzlJNzlzRWdhaDBleDhCcFp2MG8wSFZWOGpodnlwSjlGVWZmTUY0OWVQUHlV?=
 =?utf-8?B?cUoxVHY5SXJIc0swT3JYVVd0YzJ4endwREJvRnlkRkJ6dk0wTzVtVnU2K0w1?=
 =?utf-8?B?ZTFPMU94S3NvVHdudmNPU3lKYzRXMURzS3RDb0JtNzZQUHZCL096VDZSRlBi?=
 =?utf-8?B?OTQ0amFjTm5RYXpkRDZJSTBoSDlCR0JUQlVwem5mcUg3Ylo1THBKV1BSTTBm?=
 =?utf-8?B?RURhT0dNNDFhV25iUldPUDB0cFpMVUN2TmJjZ2JtUkNJVHpVcGRZeCtpM1FQ?=
 =?utf-8?B?Q1BHa0poUlJUc3EraUtpakx3ZlFLbjdkcVVISkx1clZGTFl3cmVIMDNvM2tI?=
 =?utf-8?B?bXRLVlBwcUJpcEJ4a1pnZ1JWZEpqbGdJS3UzU1FwWm1Vb29rZVp4Tk1xQzMw?=
 =?utf-8?B?Wk1jZE1FKzNyTlE1ZUZpN1VSbHRYc2JLM1VnbzY2dE43eWR2M29lK0hKT1RZ?=
 =?utf-8?B?MXdIaXErZS9VNVNPSWdVcU53aDZSaXJ4QlZZckhZSXNvWFRZeHdaaE5yMjh2?=
 =?utf-8?B?THVtZHFqUUlmN0JXVnhRZkZSbndjV2gvUWEyRmh2YnVtK083a3F4R1dEUWxx?=
 =?utf-8?B?MEovWkhjOHFkcThQQ1RqaG5VSDFKdlV4OEpYUXBtMVl6SWpYOW5lSGZPUlh0?=
 =?utf-8?B?b1ZWSkhUai9aZWU1VWY0bGdNeXNCaUZFdC9vVmVJRFNLM0FwSnpXUTd4dmZV?=
 =?utf-8?B?S3NBQzZ4WWJvTUlLMHlwWS9uOHNDdC8wZnNmSmlrTUNGM05SV1U0VWFqNWwx?=
 =?utf-8?B?U3RGdWhibGQ1TUFGa2ljYzZzemxJZXRKOWZOU08ybVRNYXlUWVlLUS9CTG5w?=
 =?utf-8?B?UFg3aERRTW4vUDFKa1VUWDkrSWFlS01NUWlwaVRiZjJMRUdhZlFkSjNZbER4?=
 =?utf-8?B?dlYwQlE5UitDeUxUUEV1UEs5Rk4zL3dibXQwdE5RTVVlNFdmSXhvT1FsSEs2?=
 =?utf-8?B?SkRXbFlzL0NDUnpLRXl1cVlCVUwrSURxcnM2Z285NElFakNpV3lSWktIdmd6?=
 =?utf-8?B?ZzNha3U0dTgrRTdWWWtrWEF4a2dvN3NKWnQ1Y055Zy8zYlRnNEl5bWh0N3NN?=
 =?utf-8?B?ZDBKWDA4a0dTLzN0MmdXVG1icmx2UHI5VThNdGtBVzAyTjRTUm9ZZWNid2hQ?=
 =?utf-8?B?aVNWK0UyczltSmlMMGJ5Z1o2Wm41elpzRzNFZzdyTm41R3ZKbmhFSlVHRStG?=
 =?utf-8?B?ZHBVQXdxK0NDVStNd3JiOXhIZlY2WnBHRC9EdkhTd05qczZEVEtMT2VBV0dC?=
 =?utf-8?B?NjkzSzc5N3VuUEF1T05zenhuRVhWSkVjaU9HOW0vdzJkbElRN3Q0Q1krWksr?=
 =?utf-8?B?aHcybCtNdEtCak5sVGRuRW4xdjB6TllaUnk2VExxWEswditIZklBcm9VSG5v?=
 =?utf-8?B?M2ZZRVVRMVBMRlJEZE5pOGxaaGNSajRSS3IwdHZ2b0IvMXlXRksvY1ZXTVJl?=
 =?utf-8?B?NGVtQTBuZjk2YkJPdmxYREZUa0d1TVBnNVdzRlh2K1FyaEd1b2UwYXcrZE5R?=
 =?utf-8?B?L1Vjb2NibkI4UXpjdlhKSGtKUVg0V3lLYkxhUTJwNnJET1laNzk1alptRGJ2?=
 =?utf-8?B?ZjlsY0tkVk44c0poREpId1dxaDY2MGpnZmJ0VmZ3NWMzcG1KV0ZQNFdlN1ZX?=
 =?utf-8?B?QWt2MEVjQWpVRjcwZm1GS1ZOU1NVb05zcmpqemVQaTg3djhZWEJCVm9CSnc5?=
 =?utf-8?B?R3Yyclg0U0x5MnRZWVhLMUdPVm5Yd0MwalRMTDJJcE40cmk5ejNmeW9wQ0tl?=
 =?utf-8?B?NDF2RFFKa2NwdnpxZXJmTDN3dU9sZjdxdWR1OW9mMEV0QkRNdlpaaUdmR1BF?=
 =?utf-8?B?WjZ6SU16aVhVVG5MTytTbmp3VWV4M011Mi9FbDgwSUp4VDh5V0NGZXEvMUts?=
 =?utf-8?B?c2REU1RVamU1RmR1aWtrUmdqZXVqdVZHb2RVeDF2K3NmbWdzVWVpOFpKSWpk?=
 =?utf-8?B?aExjNVhiTEN0YXZJSGRkV3dYSjJBWHpYMHRqMlpQN0Z1MXY2bnlVWTFvcmlm?=
 =?utf-8?Q?lE4rTDTEOudoMyLVCsYP9jKwN?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C981EF6D752EF4408A545293540B9367@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zyZE4e9a2eZ5/dMNJeIp8JtFavowHf9f8riSIWhpTydvRzuy4o3eZoN7ktfHyYWEv2a8aN+zel9sA0LA3Nh5PWpJTGnpowREgNNMAGce0vMmyqFSTy5QeKf4meiGnoHX76ui1oK937aS5cq672Rzhef0Rs0RwhmZ/p2f3gME5TBWH27QkaaoIF0vsgAwoL9DiYm9iJAiVDcWg3RF3qvgMCc6XE6ce09NXOebDmHjkTJ1IlItq/GJe1uP+vBTVj1AW5asySvFBnjYSdLnsPm9HMAoNIOAp/nO8nYvDj417ZsXsHJwphoRI6GF5aFk1/xHOeZBS/iZ9hk3i4urop23ens22vFHJ8QAeVJRh12hPaOy5EfFLKE6M0qyNW8BWI0LMoHAvJH5FyOXmQWu5jMEY+2jXOQntst7nZ6KTmuVKuEhXBeSrmi0Vh9OKXJzZHNuJ6m9zhj5YbfkmeLMgteZ5mXZhjYohxvTmPAOTNy46cxybX7S5tAzXEQRn0cTMSN13bVbgbtjbTavMMeOpR07MlZCsUU2YtWzqoRf9wYblp1/qS3S4Fi2RePPXWntunwXD+8tnJoqL/MCD/tItDoATXSuNod3DXbqstmCqTbI4eC6q9/+RLqwPRqW+Ydej6C0zWyMLRxjcjiIeKxROkWtVw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8796.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ca2bac-ced3-4bef-3441-08dd7c106d86
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 11:26:55.5129
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ivovl9K0v8yBp21cxvdA9dBkUezzdBKg3avPvvimpCeMcwvfCZjMM7Fp5Ej7hZ3eLSD3yYLpiwEj/L/KgnAecQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7645
X-Proofpoint-GUID: CAMRmeF8vAJi1NdCRVHLqDkWORjWz2gr
X-Proofpoint-ORIG-GUID: CAMRmeF8vAJi1NdCRVHLqDkWORjWz2gr
X-Authority-Analysis: v=2.4 cv=JOA7s9Kb c=1 sm=1 tr=0 ts=67fe4287 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qPHU084jO2kA:10 a=VsKqIvWj5fYAMKhi63UA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1011 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504150081

SGkgTHVjYSwNCg0KT24gNC8xNC8yNSAyMToyNiwgQWxhbiBTdGVybiB3cm90ZToNCj4gT24gTW9u
LCBBcHIgMTQsIDIwMjUgYXQgMDY6NTQ6NThQTSArMDIwMCwgTHVjYSBDZXJlc29saSB3cm90ZToN
Cj4+IEhlbGxvIE1pbmFzLCBLZXZlciwgbGludXgtdXNiLCByZWNlbnQgZHdjMiBkcml2ZXIgY29u
dHJpYnV0b3JzLA0KPj4NCj4+IEkgYW0gZmFjaW5nIGFuIHVuZXhwZWN0ZWQgYmVoYXZpb3IgKGFw
cGFyZW50bHkgYSBidWcpIHdpdGggYSBkd2MyDQo+PiBjb250cm9sbGVyIGluIGdhZGdldCBtb2Rl
LCB1c2luZyBhIG1haW5saW5lIGtlcm5lbDogdGhlIGdhZGdldCBkZXZpY2UgaXMNCj4+IGVudW1l
cmF0ZWQgbm9ybWFsbHkgYnV0IHRoZW4gZGlzYXBwZWFycyBhbmQgZ2V0cyByZS1lbnVtZXJhdGVk
IGFib3V0IDYNCj4+IHNlY29uZHMgYWZ0ZXIgdGhlIGluaXRpYWwgZW51bWVyYXRpb24sIGZvciBu
byBhcHBhcmVudCByZWFzb24uIEhlcmUgYXJlDQo+PiB0aGUgZGV0YWlscy4NCj4+DQo+PiBUZXN0
aW5nIHNldHVwOg0KPj4NCj4+IFNvQzogICAgICAgICAgICAgUm9ja2NoaXAgUkszMzA4DQo+PiBC
b2FyZDogICAgICAgICAgIFJvY2sgUGkgUyBbMV0NCj4+IFVTQiBjb250cm9sbGVyOiAgcm9ja2No
aXAscmszMzA4LXVzYiwgc25wcyxkd2MyIFsyXQ0KPj4gQ29udHJvbGxlciBtb2RlOiBkZXZpY2Ug
b25seSAoZHJfbW9kZSA9ICJwZXJpcGhlcmFsIikgWzNdDQo+PiBUZXN0ZWQga2VybmVsczoNCj4+
ICAgLSB2Ni4xNS1yYzINCj4+ICAgLSB2Ni4xNC4xDQo+PiAgIC0gdjYuMTIuMjANCj4+ICAgLSB2
Ni42Ljg3DQo+PiAgIC0gdjYuMS4xMzQNCj4+ICAgLSB2NS4xNS4xODANCj4+IERldmljZSB0cmVl
OiAgICAgdXBzdHJlYW0gUm9jayBQaSBTIGR0cyBbNF0NCj4+IEtlcm5lbCBjb25maWc6ICAgQVJN
NjQgZGVmY29uZmlnDQo+Pg0KPj4gSGFyZHdhcmUgc2V0dXA6IFVTQiBBLUMgY2FibGUgY29ubmVj
dGVkIGZyb20gUEMgQSBwb3J0IHRvIHRoZSBDDQo+PiBjb25uZWN0b3Igb24gdGhlIFJvY2sgUGkg
UyBib2FyZC4gVGhpcyBjYWJsZSBwcm92aWRlcyBib2FyZCBwb3dlciBhcw0KPj4gd2VsbCBhcyB0
aGUgY29ubmVjdGlvbiBiZXR3ZWVuIHRoZSBob3N0IGFuZCB0aGUgZ2FkZ2V0Lg0KPj4NCj4+IEJl
aGF2aW9yOg0KPj4gICAxLiBib290IGJvYXJkIG5vcm1hbGx5DQo+PiAgIDIuIG9wdGlvbmFsbHkg
d2FpdCBzb21lIHRpbWUNCj4+ICAgMy4gcnVuIHNjcmlwdCB0byBzdGFydCBhIENEQyBzZXJpYWwg
Z2FkZ2V0IFs1XQ0KPj4gICA0LiBhZnRlciBhYm91dCAwLjYgc2Vjb25kcyB0aGUgdHR5R1MwIHNl
cmlhbCBkZXZpY2UgaXMgcHJlc2VudCBhbmQNCj4+ICAgICAgd29ya2luZywgYW5kIHNvIGlzIHR0
eUFDTTAgb24gdGhlIGhvc3Q6IHNvIGZhciBhbGwgZ29vZA0KPj4gICA1LiBhZnRlciBhYm91dCA2
IHNlY29uZHMgdGhlIGR3YzIgY29udHJvbGxlciByZWNlaXZlcyBzb21lDQo+PiAgICAgIGludGVy
cnVwdHMgYW5kIHN0YXJ0cyBhIG5ldyBlbnVtZXJhdGlvbiBzZXF1ZW5jZQ0KPj4NCj4+IFRoaXMg
aXMgd2hhdCB0aGUga2VybmVsIGxvZ3M6DQo+Pg0KPj4gWyAgIDIwLjEwNTY4OF0gZHdjMiBmZjQw
MDAwMC51c2I6IGJvdW5kIGRyaXZlciBjb25maWdmcy1nYWRnZXQuZzENCj4+IFsgICAyMC4yODU0
MzFdIGR3YzIgZmY0MDAwMDAudXNiOiBuZXcgZGV2aWNlIGlzIGhpZ2gtc3BlZWQNCj4+IFsgICAy
MC4zNzM0NTVdIGR3YzIgZmY0MDAwMDAudXNiOiBuZXcgZGV2aWNlIGlzIGhpZ2gtc3BlZWQNCj4+
IFsgICAyMC40MjY0OTZdIGR3YzIgZmY0MDAwMDAudXNiOiBuZXcgYWRkcmVzcyAyOA0KPj4gWyAg
IDI2LjY4ODM4OF0gZHdjMiBmZjQwMDAwMC51c2I6IG5ldyBkZXZpY2UgaXMgaGlnaC1zcGVlZA0K
Pj4gWyAgIDI2Ljc3NTM2M10gZHdjMiBmZjQwMDAwMC51c2I6IG5ldyBkZXZpY2UgaXMgaGlnaC1z
cGVlZA0KPj4gWyAgIDI2LjgzNjg4MF0gZHdjMiBmZjQwMDAwMC51c2I6IG5ldyBhZGRyZXNzIDI5
DQo+Pg0KPj4gSGVyZSBpcyBhIHNpZGUtYnktc2lkZSBsb2cgb2YgaG9zdCBhbmQgZGV2aWNlLCBz
eW5jZWQgbWFudWFsbHkgdXNpbmcNCj4+IGEgdmlkZW8gY2FwdHVyZSAoc29ycnkgYWJvdXQgdGhl
IGxvbmcgbGluZXMsIGNhbid0IGRvIHdpdGhvdXQpOg0KPj4NCj4+ICAgICAgKioqIEhPU1QgKioq
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqKiogREVWSUNFICoqKg0KPj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8PDwgTGFzdCBsaW5lIG9mIHRoZSBzY3Jp
cHQ6ICdlY2hvIGZmNDAwMDAwLnVzYiA+IFVEQycgPj4+DQo+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFsgICAxNC4yODEzNTBdIGR3YzIgZmY0MDAwMDAudXNiOiBi
b3VuZCBkcml2ZXIgY29uZmlnZnMtZ2FkZ2V0LmcxDQo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFsgICAxNC40ODIzMzJdIGR3YzIgZmY0MDAwMDAudXNiOiBuZXcg
ZGV2aWNlIGlzIGhpZ2gtc3BlZWQNCj4+IFsxMDgyMDQuMDg0MDQ5XSB1c2IgMy0yOiBuZXcgaGln
aC1zcGVlZCBVU0IgZGV2aWNlIG51bWJlciAzOSB1c2luZyB4aGNpX2hjZA0KPj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbICAgMTQuNjc1NjkyXSBkd2MyIGZmNDAw
MDAwLnVzYjogbmV3IGRldmljZSBpcyBoaWdoLXNwZWVkDQo+PiBbMTA4MjA0LjI3NDYzOV0gdXNi
IDMtMjogTmV3IFVTQiBkZXZpY2UgZm91bmQsIGlkVmVuZG9yPTEyMDksIGlkUHJvZHVjdD0wMDAx
LCBiY2REZXZpY2U9IDEuMDAgICAgWyAgIDE0LjczNzM5NV0gZHdjMiBmZjQwMDAwMC51c2I6IG5l
dyBhZGRyZXNzIDQ0DQo+PiBbMTA4MjA0LjI3NDY1Ml0gdXNiIDMtMjogTmV3IFVTQiBkZXZpY2Ug
c3RyaW5nczogTWZyPTEsIFByb2R1Y3Q9MiwgU2VyaWFsTnVtYmVyPTMNCj4+IFsxMDgyMDQuMjc0
NjU2XSB1c2IgMy0yOiBQcm9kdWN0OiAuLi4NCj4+IFsxMDgyMDQuMjc0NjU5XSB1c2IgMy0yOiBN
YW51ZmFjdHVyZXI6IC4uLg0KPj4gWzEwODIwNC4yNzQ2NjJdIHVzYiAzLTI6IFNlcmlhbE51bWJl
cjogMTIzNDU2NzgNCj4+IFsxMDgyMDQuMjgyNTU1XSBjZGNfYWNtIDMtMjoxLjA6IHR0eUFDTTA6
IFVTQiBBQ00gZGV2aWNlDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgKC4uLm5vdGhpbmcgaGFwcGVucyBmb3IgYWJvdXQgNiBz
ZWNvbmRzLi4uKQ0KPj4gWzEwODIwOS45NzIxODBdIHVzYiAzLTI6IFVTQiBkaXNjb25uZWN0LCBk
ZXZpY2UgbnVtYmVyIDM5DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFsgICAyMC43NjY5NTBdIGR3YzIgZmY0MDAwMDAudXNiOiBuZXcgZGV2aWNlIGlzIGhpZ2gt
c3BlZWQNCj4+IFsxMDgyMTAuMzM5Mjk3XSB1c2IgMy0yOiBuZXcgaGlnaC1zcGVlZCBVU0IgZGV2
aWNlIG51bWJlciA0MCB1c2luZyB4aGNpX2hjZA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBbICAgMjAuOTYwMzc1XSBkd2MyIGZmNDAwMDAwLnVzYjogbmV3IGRl
dmljZSBpcyBoaWdoLXNwZWVkDQo+PiBbMTA4MjEwLjczOTczOF0gdXNiIDMtMjogTmV3IFVTQiBk
ZXZpY2UgZm91bmQsIGlkVmVuZG9yPTEyMDksIGlkUHJvZHVjdD0wMDAxLCBiY2REZXZpY2U9IDEu
MDAgICAgWyAgIDIxLjIwMDY3MF0gZHdjMiBmZjQwMDAwMC51c2I6IG5ldyBhZGRyZXNzIDQ1DQo+
PiBbMTA4MjEwLjczOTc1MF0gdXNiIDMtMjogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczogTWZyPTEs
IFByb2R1Y3Q9MiwgU2VyaWFsTnVtYmVyPTMNCj4+IFsxMDgyMTAuNzM5NzUzXSB1c2IgMy0yOiBQ
cm9kdWN0OiAuLi4NCj4+IFsxMDgyMTAuNzM5NzU2XSB1c2IgMy0yOiBNYW51ZmFjdHVyZXI6IC4u
Lg0KPj4gWzEwODIxMC43Mzk3NThdIHVzYiAzLTI6IFNlcmlhbE51bWJlcjogMTIzNDU2NzgNCj4+
IFsxMDgyMTAuNzQ3MDg0XSBjZGNfYWNtIDMtMjoxLjA6IHR0eUFDTTA6IFVTQiBBQ00gZGV2aWNl
DQo+Pg0KPj4gTm90ZTogdGhlIGRldmljZSBhZGRyZXNzIGlzIGRpZmZlcmVudCBvbiB0aGUgaG9z
dCBhbmQgdGhlIHRhcmdldC4gSXMNCj4+IHRoaXMgZXhwZWN0ZWQ/DQo+IA0KPiBUaGUgdmFsdWUg
b24gdGhlIGhvc3Qgc2lkZSBpcyBhIGRldmljZSBudW1iZXIsIG5vdCBhIGRldmljZSBhZGRyZXNz
Lg0KPiBEZXZpY2UgbnVtYmVycyBhcmUgYXNzaWduZWQgc2VxdWVudGlhbGx5IGJ5IHRoZSBrZXJu
ZWwsIHdoZXJlYXMNCj4gYWRkcmVzc2VzIGFyZSBhc3NpZ25lZCBhdXRvbWF0aWNhbGx5IGJ5IHRo
ZSB4SENJIGhhcmR3YXJlIHdpdGhvdXQNCj4gc29mdHdhcmUgaW50ZXJ2ZW50aW9uLg0KPiANCj4g
Rm9yIG5vbi14SENJIGNvbnRyb2xsZXJzIHRoZSB0d28gYXJlIHRoZSBzYW1lLCBidXQgbm90IHdp
dGggeEhDSS4NCj4gDQo+PiBJbiB0aGUgZHJpdmVyIHRoZXJlIGFyZSAyIGludGVycnVwdCBoYW5k
bGVycyBpbnZvbHZlZDoNCj4+ICAgLSBkd2MyX2hhbmRsZV9jb21tb25faW50ciBpbiBjb3JlX2lu
dHIuYyBmb3IgdGhlIGNvbW1vbiBldmVudHMNCj4+ICAgLSBkd2MyX2hzb3RnX2lycSBpbiBnYWRn
ZXQuYyBmb3IgZ2FkZ2V0IGV2ZW50cw0KPj4NCj4+IFRoZXkgc2hhcmUgdGhlIHNhbWUgaW50ZXJy
dXB0IG51bWJlciwgd2hpY2ggQUZBSUNVIGlzIGJlY2F1c2UgdGhleQ0KPj4gYWN0dWFsbHkgcmVh
ZCBkaWZmZXJlbnQgYml0cyBmcm9tIHRoZSBzYW1lIEdJTlRTVFMgcmVnaXN0ZXIuDQo+Pg0KPj4g
SSBlbmFibGVkIERFQlVHIGluIHRoZSBkd2MyIGRyaXZlciBhbmQgY2FwdHVyZWQgdGhlIGluaXRp
YWwgZXZlbnRzDQo+PiBsb2dnZWQgYWZ0ZXIgdGhlIH42IHNlY29uZHMgcGF1c2UsIGkuZS4gd2hl
cmUgdGhlIDJuZCBlbnVtZXJhdGlvbg0KPj4gc3RhcnRzLiBIZXJlIHRoZXkgYXJlIHdpdGggc29t
ZSBhbm5vdGF0aW9uczoNCj4+DQo+PiAgIDEuIGZpcnN0IGludGVycnVwdCBhZnRlciB0aGUgfjYg
cyBicmVhazoNCj4+ICAgICAgLSBkd2MyX2hhbmRsZV9jb21tb25faW50ciBmaW5kcyBubyBiaXRz
IGhpZ2gNCj4+ICAgICAgLSBkd2MyX2hzb3RnX2lycSBmaW5kcyBvbmUgKGVhcmx5IHN1c3BlbmQg
Yml0KToNCj4+ICAgICAgICAgWyAgIDQ2LjIwMzA5NF0gZHdjMiBmZjQwMDAwMC51c2I6IGR3YzJf
aHNvdGdfaXJxOiAwNDAwODQyOCAwMDAwMDQwMCAoZDg4YzNjYzQpIHJldHJ5IDgNCj4+ICAgICAg
ICAgWyAgIDQ2LjIwNDA2MF0gZHdjMiBmZjQwMDAwMC51c2I6IEdJTlRTVFNfRXJseVN1c3ANCj4+
DQo+PiAgIDIuIHNlY29uZCBpbnRlcnJ1cHQNCj4+ICAgICAgLSBkd2MyX2hhbmRsZV9jb21tb25f
aW50ciBmaW5kcyBvbmUgYml0cyBoaWdoIChzdXNwZW5kKToNCj4+ICAgICAgICAgWyAgIDQ2LjIw
NjgwN10gZHdjMiBmZjQwMDAwMC51c2I6IFVTQiBTVVNQRU5EDQo+PiAgICAgICAgIFsgICA0Ni4y
MDY4MjRdIGR3YzIgZmY0MDAwMDAudXNiOiBkd2MyX2hhbmRsZV91c2Jfc3VzcGVuZF9pbnRyOiBE
U1RTPTB4NTAyYTAxDQo+PiAgICAgICAgIFsgICA0Ni4yMDY4NDJdIGR3YzIgZmY0MDAwMDAudXNi
OiBEU1RTLlN1c3BlbmQgU3RhdHVzPTEgSFdDRkc0LlBvd2VyIE9wdGltaXplPTEgSFdDRkc0Lkhp
YmVybmF0aW9uPTANCj4+ICAgICAgICAgWyAgIDQ2LjIwNjg3Ml0gZHdjMiBmZjQwMDAwMC51c2I6
IGR3YzJfaHNvdGdfaXJxOiAwNDAwODAyOCAwMDAwMDAwMCAoZDg4YzNjYzQpIHJldHJ5IDgNCj4+
ICAgICAgLSBkd2MyX2hzb3RnX2lycSBmaW5kcyBubyBiaXRzIGhpZ2gNCj4+DQo+PiAgIDMuIHRo
aXJkIGludGVycnVwdA0KPj4gICAgICAtIGR3YzJfaGFuZGxlX2NvbW1vbl9pbnRyIGZpbmRzIG5v
IGJpdHMgaGlnaA0KPj4gICAgICAtIGR3YzJfaHNvdGdfaXJxIGZpbmRzIHR3byAocmVzZXQgZGV0
ZWN0ZWQgKyBVU0IgcmVzZXQpOg0KPj4gICAgICAgICBbICAgNDYuNDM3MTA5XSBkd2MyIGZmNDAw
MDAwLnVzYjogZHdjMl9oc290Z19pcnE6IDA0ODA5MDI4IDAwODAxMDAwIChkODhjM2NjNCkgcmV0
cnkgOA0KPj4gICAgICAgICBbICAgNDYuNDM3NjA3XSBkd2MyIGZmNDAwMDAwLnVzYjogZHdjMl9o
c290Z19pcnE6IFVTQlJzdERldA0KPj4gICAgICAgICBbICAgNDYuNDM3NjMwXSBkd2MyIGZmNDAw
MDAwLnVzYjogZHdjMl9oc290Z19pcnE6IFVTQlJzdA0KPj4gICAgICAgICBbICAgNDYuNDM3NjQ5
XSBkd2MyIGZmNDAwMDAwLnVzYjogR05QVFhTVFM9MDAwODAwMTANCj4+ICAgICAgICAgWyAgIDQ2
LjQzNzY3M10gZHdjMiBmZjQwMDAwMC51c2I6IGNvbXBsZXRlOiBlcCAwMDAwMDAwMGRhYjg1OWM4
IGVwMCwgcmVxIDAwMDAwMDAwOWNiOTcyNTUsIC0xMDggPT4gMDAwMDAwMDBhY2RiMmVlOQ0KPj4g
ICAgICAgICBbICAgNDYuNDM3NzE5XSBkd2MyIGZmNDAwMDAwLnVzYjogZHdjMl9oc290Z19jb21w
bGV0ZV9zZXR1cDogZmFpbGVkIC0xMDgNCj4+ICAgICAgICAgWyAgIDQ2LjQzNzc2NV0gZHdjMiBm
ZjQwMDAwMC51c2I6IGR3YzJfaHNvdGdfZXBfZGlzYWJsZShlcCAwMDAwMDAwMGNmOGNmMDZmKQ0K
Pj4gICAgICAgICBbICAgNDYuNDM3NzkwXSBkd2MyIGZmNDAwMDAwLnVzYjogZHdjMl9oc290Z19l
cF9kaXNhYmxlOiBEeEVQQ1RMPTB4MDgwODAyMDANCj4+ICAgICAgICAgLi4uDQo+Pg0KPj4gIEZy
b20gbm93IG9uIHRoZSBsb2cgYXBwZWFycyBhcyBhIG5vcm1hbCBlbnVtZXJhdGlvbiBwcm9jZXNz
Lg0KPj4NCj4+IEknbSBzdHVjayBhdCBhIGRlYWQgZW5kLCB0cnlpbmcgdG8gdW5kZXJzdGFuZCB3
aGF0IG1heSBiZSB0cmlnZ2VyaW5nIHRoZQ0KPj4gc2Vjb25kIGVudW1lcmF0aW9uLg0KPiANCj4g
WW91IHNob3VsZCBlbmFibGUgaG9zdC1zaWRlIGRlYnVnZ2luZyBiZWZvcmUgY29ubmVjdGluZyB0
aGUgY2FibGU6DQo+IA0KPiAJZWNobyAnbW9kdWxlIHVzYmNvcmUgPXAnID4vc3lzL2tlcm5lbC9k
ZWJ1Zy9keW5hbWljX2RlYnVnL2NvbnRyb2wNCj4gDQo+IEl0J3MgcXVpdGUgcG9zc2libGUgdGhh
dCB5b3UncmUgZ2V0dGluZyBtZXNzZWQgdXAgYnkgbGluayBwb3dlcg0KPiBtYW5hZ2VtZW50IChM
UE0pLiAgQnV0IHRoYXQncyBqdXN0IGEgZ3Vlc3MuDQo+IA0KPiBBbGFuIFN0ZXJuDQpJIGRvbid0
IHNlZSwgZnJvbSBsb2dzLCBhbnkgd3JvbmcgYmVoYXZpb3IgZnJvbSBkd2MyIGRldmljZSBzaWRl
LiBkd2MyIA0KZHJpdmVyIGNvcnJlY3RseSBoYW5kbGUgRWFybHkgU3VzcGVuZCwgU3VzcGVuZCwg
VVNCIFJlc2V0IGRldGVjdCBhbmQgDQpmaW5hbGx5IFVTQiBSZXNldCB3aGljaCBhbGwgaW5pdGlh
dGluZyBmcm9tIEhvc3Qgc2lkZS4gWW91IG5lZWQgdG8gDQppbnZlc3RpZ2F0ZSB3aHkgSG9zdCBh
ZnRlciA2IHNlY29uZCBpbml0aWF0ZWQgYWJvdmUgc2lnbmFsaW5nIHNlcXVlbmNlLg0KTWF5YmUg
YWZ0ZXIgNS02IHNlYyBob3N0IGluaXRpYXRlIGF1dG9zdXNwZW5kPyBCdXQgaW4gdGhpcyBjYXNl
IG5vdCANCmNsZWFyIHdoeSB0aGVuIGl0IHBlcmZvcm0gVVNCIHJlc2V0Pw0KRGlkIHlvdSB0ZXN0
IHdpdGggZGlmZmVyZW50IFBDJ3Mgd2l0aCBkaWZmZXJlbnQgRUhDSS9YSENJIGhvc3RzPw0KVGhh
bmtzLA0KTWluYXM=
