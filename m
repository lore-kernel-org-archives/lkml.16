Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF5D1E87B;
	Mon, 23 Jun 2025 22:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750718642; cv=fail; b=XrYhq/jGyyxL70teb9snpdRQN/J9jm8xpatN3QKsI7cHhtiKRCm0Xa8QKFwS3fEFUzzxXEyxo4WWpssvnbNOKeVQ+jY6iCfQlgvOFUwhzIgqfDJZZb2HTwd6nGmGIaDHpFJG+uRWfx8wgBbebGRt2F2vJVVVFdUbw5vu+L6CQxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750718642; c=relaxed/simple;
	bh=LpErHE0E4kBPZME5NOHlR6+s48XEIYApD4JT3CeHfZU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SlIjfF/CgYSpgpI/2+fNhbX0DexfHcDxILsrNitDXOoPOf2cwyuFv+hXh2OC1/vp9AlpzfUSe9tGH9XXmxGL3lQ3eiFdpTpbvcOpiP5/E/+KQvE2NDGEc2t04VJIym3KpO+U4PnSLUdR6BS/86GbVNZeNuyZvV0obMmPrIdstjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=HINJzpra; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=km66edFd; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Xox05AL7 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HINJzpra";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="km66edFd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Xox05AL7"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NGWBMY024203;
	Mon, 23 Jun 2025 15:43:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=LpErHE0E4kBPZME5NOHlR6+s48XEIYApD4JT3CeHfZU=; b=
	HINJzpraUUqLnJXO8HU1/OEzHKAOiVGtIhgZYnEmO9r5w4naG1GIqBT6nxsWrn+a
	3+OEFc4m9w2kmdmbD43Nj0X1beaZDIK0XGuZdeeNSR/jmRP8KJBeAGgr6FDkCE1V
	/wtno6EWHBLJgzmmMXhu44g4Re6SjzrksGGKZBGcaebtrT6aoG6fGBQMQRIvRaYQ
	NjbELEG4E018Ftw65tkogt8S4sgj91gg0Cv22Wsy2RhCZYK4wnfn0iT9MxqnLyWL
	SgC9lFIFIUgeCxmBuLrUthlsRx89oThyFN5qtSs5baNEZtNfCQV94Gdsri37P/eR
	7Ud9C7fZqjhZeqA6ON9BGA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 47ducgfv1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 15:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1750718631; bh=LpErHE0E4kBPZME5NOHlR6+s48XEIYApD4JT3CeHfZU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=km66edFdULIgpNqTB6hFxHZ7FfHogv+DLKpVc3eu6zVYT0bQDsowtayozFGkdjspi
	 w5V4Ux0YX862xzLcFNli+5z0RRe8dLd2+J6trexoTSNuQL7Zw9DZrACTDvgWbYRIzr
	 KCPBCcpL/7VrkUJqYfDoedu3AR3FTSJ6yN7diiDtEPXKqiTJg6b6Jz0LPlsfN3kULC
	 /UGCvgQj6j5ofNg+LL5xeIXbWMsLbjP/oEkxVVJyL5BS4ZOGY/9hlJ7mMCC8Udu+TD
	 tujEMW65xiAXt9kYRWP991Y25hRcGK4Q5mLv3WUOhltvt7g3NZSvR5/efBGiYVIWt1
	 1Yy0QsUf1l0Ww==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4D639401D3;
	Mon, 23 Jun 2025 22:43:50 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id ACF3DA0060;
	Mon, 23 Jun 2025 22:43:49 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Xox05AL7;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2041.outbound.protection.outlook.com [104.47.58.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 602AD401D9;
	Mon, 23 Jun 2025 22:43:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u9XUQRCsyVCPqfU/jrIONNEqcbPmfFV9eA+75WkxhHrtncYgd8iHi8ZlR/BCQfsEccz1Az9WtjkM1QZo5ZGVVE+dI/74HgifYupoJUEvREa9Lgrtd9mqyaKy5Vocuj8bKe7IRIh5m71JsCiVZHjsyx9VFP9/7ff9zoqsW8EvtrBZXA+qOhnoPrib2lghwg2wHuiA0zZtbzmJomXjkAxwrVxIQ794i22WFVNkrHG0LkrtETzq0clYOpTOwwi/+MFnU3Cb3a/VkDRDvvQ3lNfw81EMwyLeMM5GaDjw5VhcbPnaHeCFq8uzYBOzvdPhhjfApY1oVpYc66LonwReZ2V0bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LpErHE0E4kBPZME5NOHlR6+s48XEIYApD4JT3CeHfZU=;
 b=MV+yL/45d97n4v7b8f6RkoIJNnWTVgzw1uzLWuYes68ZZNLJmDLHqYnrToTLScNeIOPoxFwGERcqiqURMsezyUiXZ+wapOjHHKe9cf4KSG0GdLtG7XIbXQVxb1GQrc3blRYvS+jaaWwe2lqJM8zukWHn7eejWwT+k05wWYe/j1yoWkOJ8o6cnN/9JJa8uLlJF+FPYMlb4ita30NoCPU1KafpxpDX6cW6vB87WTduurYBHuuslH1BXmVZUwyjvQTDeiXtUWxbtIb//Z8uBsbOsmmLjo1QxCyRJGge+oTW5qFjSYg1wcIYhukqjpQp/T0rulpchoA4z/VN9BKhVHW6Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LpErHE0E4kBPZME5NOHlR6+s48XEIYApD4JT3CeHfZU=;
 b=Xox05AL7B9CVqN53GBGlzIb8PA7w9MrjEriOKkoamh/yTDDHeIZcoUQ47HyGF0caRBTjox8kzUf2YbTEALmCzOkEb7xb4elrbShzkSsWluW9pzRfEzQHSFcctAmzr9eN9o+hdR/Levfasc+Ka3LCYghQbi3bIR5I6vvLaGzhGAc=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH7PR12MB5595.namprd12.prod.outlook.com (2603:10b6:510:135::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Mon, 23 Jun
 2025 22:43:45 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 22:43:45 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Johannes Schneider <johannes.schneider@leica-geosystems.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "bsp-development.geo@leica-geosystems.com" <bsp-development.geo@leica-geosystems.com>
Subject: Re: [PATCH 2/3] usb: dwc3: gadget: Simplify TRB reclaim logic by
 removing redundant 'chain' argument
Thread-Topic: [PATCH 2/3] usb: dwc3: gadget: Simplify TRB reclaim logic by
 removing redundant 'chain' argument
Thread-Index: AQHb4t/BYbdP1nMlEkqUvM7tIFLKl7QRWscA
Date: Mon, 23 Jun 2025 22:43:45 +0000
Message-ID: <20250623224340.oszkgwnhcjhnibaz@synopsys.com>
References:
 <20250621-dwc3-fix-gadget-mtp-v1-0-a45e6def71bb@leica-geosystems.com>
 <20250621-dwc3-fix-gadget-mtp-v1-2-a45e6def71bb@leica-geosystems.com>
In-Reply-To:
 <20250621-dwc3-fix-gadget-mtp-v1-2-a45e6def71bb@leica-geosystems.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH7PR12MB5595:EE_
x-ms-office365-filtering-correlation-id: 9bcc9eb0-0040-4579-cc8c-08ddb2a7693a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZEVVcllLUGxOVDBBRWZIYnU5cGZCVk5JZ2tRQTAxZUJ0L0swVXdOb2UxK2J2?=
 =?utf-8?B?Vkoyajk5dTl3YWZOTmlvRTAzRXlYSTN4VDc5bk9FZDY4QXUzNW9MMzNjQ0Nt?=
 =?utf-8?B?OExnaTRvT0wrL0xXaFV2TlkxLzBwUU9JMVJQZFU1SGFFcDZmaXVoUXE5c2pm?=
 =?utf-8?B?ejljMC9xZVNNcDJsajU4RFRNNVBQb0xNREpSSTIyRHA1Y2Fvc1BvQlBvTHJB?=
 =?utf-8?B?UWlaMzVjK2VzQU1sdWJCSk5rV1I1OGRXblVWNU1PSGRxSk5KZk50WVRHOXBL?=
 =?utf-8?B?NE9sREZ2Zzg1L2Jjd2ZMYnBPY0JkNWRkUFNMZjFMNkIrQ2ZhU0lpaFlRZkxX?=
 =?utf-8?B?cjFLWFVZSXJidjFLNDIzc2tCWTlhbmVJMExTSklZeGZhK0RET2p5ci9reFhj?=
 =?utf-8?B?Tzh5NzlRRWtDMTVZWHcyNGF0UFNHVnQ2YmJGWGpWeHRnc1RaMVRGZVM0VjRJ?=
 =?utf-8?B?QVNNUG4zZFhLcXFqOGhCVE5vNStZeXdqckUwb1YvcTltL0FTcFJiNStTMWZM?=
 =?utf-8?B?ZEcvLy9NSUx5ZXk3a2FBWjVUMGIzU0Q2eXVNRjVudjd4ZStKUVAzd3hGVytF?=
 =?utf-8?B?V0xSaGt0VzVCbTVzd1NSVEVrS0tmNEVtbmszdzdGd1Y5YmpYQ3BpcXhxaWNO?=
 =?utf-8?B?M2tDQk1tNHpiM09GbjJZNXVjSDRlOStKd0lUTUo3TTJISHUwZXlFTWY4aUNR?=
 =?utf-8?B?Y3hzS3lqS1hqdWtHekwxODE0a1RHVmFaY0hwNTYwSFZsYy9DZE5DTWFFcDcz?=
 =?utf-8?B?ZEJXd0cwZ1lBNkh1R0hBQzZTaFN5UVEyUkNqOWM0S1YwemZURU16elBmOEUw?=
 =?utf-8?B?K0FmbkpYMmRsQWxTL2V4dmNGSEE3MTRZSUxUSVp4NnpDdm5hNktOc1R5dVhP?=
 =?utf-8?B?czFlUG9VV0NIbHkxTFRVTVZSZDc1VndPSTNKOGY1OUhTK2pUOXhpbkdxLzE5?=
 =?utf-8?B?ZHhhUTZVZ1JqZEorcG1Ec2huSDV0MFpiOHNYZmMxa20rS3EyN2VuTndDSVRx?=
 =?utf-8?B?VWtvYStEMzYvVU9sR3REQldCYXpmS1RwV0xES28rMlBCK0w2dDYzMVJhMjZI?=
 =?utf-8?B?WDE2NExuM2NpNmVWRDJMbkpGMDZOTE9QTEQxWWE3QlJSMHJpdXFhWGVxL2JK?=
 =?utf-8?B?MzdzSVFFS0ttUHpIT3ZlOFVtVmlHekhHVE10THBwUTN6MjhnMEFDMFFQUjhQ?=
 =?utf-8?B?YlNyUGdsNjFHbUhlRWJrRmpySldKS083WTVsNTNMdGVOa1lMWmNkdW1oaEFL?=
 =?utf-8?B?b1VLb1RJMXl6VnZaMkdIZlFYWlRqRHpzMmkwWTJ5alEreEV0SFRqeGhEY3A4?=
 =?utf-8?B?YlRjZ0VqdlFqT0VHcFlwTDNOSUkwRnNDdjVpb3lyWkY3OG5IUFpvV1liN05U?=
 =?utf-8?B?TmZncEtZSkc0cHVIQVdlWXUydUdoLytoNTV2TkZHZ1EwVzQwWFVwZ1IwWFAy?=
 =?utf-8?B?UEk0a0lwM3lweGtINUZQVEFYbEpBdmR4YjVHeWZjdEVYd3l0RW45RndGNmY5?=
 =?utf-8?B?bWpRaUljSTVkdXdTS241elQ5VTQ3U3JnMmJMdUk5a3YvWUtCKzVwWWxRNkxl?=
 =?utf-8?B?QXVVdHVIM3VYR0ZKM0JWcEtCeUVKRWVVeWF4am9iNFZlR3o0VVpMK1ZKQXQ1?=
 =?utf-8?B?cFhPWHhTWEU5MXZOQUk0RWxKQ2JuRHJkY2RhYytFd0YrN2lnUCtyckpMNVFM?=
 =?utf-8?B?WkhxaU45c3l0QUMzWmltbXFtQ1lsQnVnaFhlMzQ3L0N5SHlHQTExUUlUZ3ZB?=
 =?utf-8?B?c1VUMHppYnpnVjYwOGczK0VHVEQ4c2hzRG40eFd0NDJUY1A2ZUhLZ09haHJC?=
 =?utf-8?B?b3p6R1dNSU9tSkdJbHh5b1Y3T1RFbzJUR1FWTFdiTTlKU25FOVcrOGlpaUZv?=
 =?utf-8?B?dSt2MmdOUFdLSDB2dFZ2RFVTbFcyN3BudWFhdUJCaFhrb3F0WURzcFF0SE9p?=
 =?utf-8?B?aENhSUpnK0FTT1QvYVZwQ2E0K1NWdDFVMG5VeUpvMExXMFdOY3hVNzgxWFg2?=
 =?utf-8?B?NXlyMWVFRE5BPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NENpczFJN25VMUhmS0xFR3o3SWErRGloVE5tQWZSNDRpcllBZXVTV09zTjdw?=
 =?utf-8?B?NE1sYW9RR2dTaXJUQVovMWErem9iQk5zcmFDVGhvaEorbDFLMVVBbTF0c2hF?=
 =?utf-8?B?RUFMTC8rTUNJaU14cDdOVk9IU3kyK1U0TEREaFREemk2TWhyZ1BpQkRLVWt1?=
 =?utf-8?B?TCtSWWYxNk1hTGlTZFN6SGtrLzNMMStCYm1oWk02S21BMWY3Qms4Qk9KdStR?=
 =?utf-8?B?SGs4d2VlOWNzWmh0a0REd3kyckUxaElEcmtRTHRBZDdwaEQwUGR4eS9mWU9h?=
 =?utf-8?B?ZlJ0VUE5MElDcTRTYnJOa2szbEVvRE1Vb05iZTBZcEFOL3htUzVpc2FMaWUr?=
 =?utf-8?B?TW1xb0VFNjVpbWc4c1hsYzhraitnTWF1TllYd3N5aG96bGYwUGc1dUFQTTA2?=
 =?utf-8?B?aVlVV2JrcHlEdXE5MGxUMXoxZE4xckhUZWduMXV3em1YZ1I0ZmNwRkNhNXVI?=
 =?utf-8?B?ZEVMMDc5WjZBd2hTWU0zbGtib29pdG4wREp4MmhMaTJIZklOT2NXSm4vQTlk?=
 =?utf-8?B?Q2V6bXMwbTFGcmE1WG1LNXhOanZHbzQ3YkZ5ekZzV3Iyb2wzMDB4aWlkbjRz?=
 =?utf-8?B?QXhobS9ZbkVQd1g3ckJUeVVHVUE2ZE5rUkU0L29vcEJYOFNIOWVvaDMyN1oy?=
 =?utf-8?B?c3ZIQmpMTnpqNWRzcmY2LzMxeGZIc2hBTWF3WjdQNTB5UkZpR0poMytUSEMv?=
 =?utf-8?B?QThWWmNzN2xpK0RzaUhVS1drTlZpR0tRYnNndHRHM0R3R2xJbFA5WFdSblNt?=
 =?utf-8?B?Wkw2WnFvMklaQXQwTlZBUDlkQU9paFZEZFhWejJwVVdpaExueWwwRjNjUHIv?=
 =?utf-8?B?RWpPbGtOditabTNpWklNa2s5azZNVVZSb2Q5enFEV2JUeEJlNXozMzN4czQ0?=
 =?utf-8?B?QzBBeXBaWWJRVDZKUDEra2JSMElOUkZsRmlMY1JoakU5UFdnaDZQVDVSclNl?=
 =?utf-8?B?YWRuSjBlampseGw3MWU3VmM1dCtDbTIwMzA1RElzTnpVZ2ZZQWVNWGNGbU5l?=
 =?utf-8?B?djhHOGdhS0NkVDllc2xPSTU0WWVUV0tZc2NZSUo4a016VHFibmptMklIcHJN?=
 =?utf-8?B?SDFyVGo4MStFVkRjekFmaUxETU5pbUNsVXVkMHd6UGh4Sk1pYUJtcGl2Vm9L?=
 =?utf-8?B?K0hkUmR2NlNjaTZENmxzUml4aTJDNmg4Z0VwMmJUY21JZXI3VGxUSmdhVXhp?=
 =?utf-8?B?OEdyaW5MUk9qbDdVU1Y2N0ozNzlzYXR0T2pwMlFReTluYmpoQk1qeDFLcjRX?=
 =?utf-8?B?MGtEbUlBQ2h5bnF6cUJuR2V2ZCtoT0drYzhQenBiTDZha3N6NVlla1o5ZGtG?=
 =?utf-8?B?a016L05CVmM4MU5JTThWa0RDdHpWM3JpblorVTZZNUpiUkFsZ292ZnkrVTJC?=
 =?utf-8?B?Q1I2SndWbTBTVUxTTGZOZVJ6Qkw2endrak1SWml6UllIQXN4aGpId3R1Z2xR?=
 =?utf-8?B?dHh5dnpNK3RvMitQT3A5N1krRmtSaVJhVFd2OEZhL2pBTEdjT0VRcnBHTE9V?=
 =?utf-8?B?b3B6Tys5RzBiTDRDcG1zWnZabDR6ZmtYa2JmUTlnT0w5R1gya2M0V2pwU0VR?=
 =?utf-8?B?bEQrSmduNkp4bGhvQWVuZ3VmKzI0ZnhUUW4vSXpScm1KTkQ0bWZacklLWTNs?=
 =?utf-8?B?NElkZFBKcklQU2pyRVJnK0xQbnpkZE9NV3ZxdHhPUEw5VzNKMWErTEk3RG1z?=
 =?utf-8?B?RWJXZ2NObExTNGo5Z1QrT29vQUY0NzVHOWZzOXJyZ0pVbUQyc0VRZ3psazZk?=
 =?utf-8?B?ai9vVjlVMGJZVHRpaFlacGRPRGZNSVFCZ3E4aUdnYXNXS2NyVkI2NDVYQUM5?=
 =?utf-8?B?aXAyU25HTmxPZUZsTHNsZzgwZ2tkSkUwL0hoSytQcHhURTVrNHJVbFVDMUVP?=
 =?utf-8?B?c1EyMlR6RGF3cDhIaUJRVTgyamM5M2NnUFEvcEJZSEJCK0I1Q05Sc0d6TW1I?=
 =?utf-8?B?bXNacUloV2lERGcyS25pb3IvYzI5SmcvNmp4cVc3NzFUSVVhOWlNYlBLU2Q5?=
 =?utf-8?B?M2psY09hdXg5eGRnd0VhMUo4UVRaSEwyMzRQSXM5RmwrV0wyZEdFVEU5Ni9V?=
 =?utf-8?B?ZTVIc2NOVnp1RitaUWtQOVI3RUxldUMxTkE0SG9wcXRCZkRJbjRqRlU4RFhn?=
 =?utf-8?Q?k9pEHjehqut9xVVWYUeQH+SmQ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <96AF22DF2D000743A7904093191E52D7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2iASDHJivMj4mId7S/nps+b62JHkPYnrIokrPNQukkAzjQVGaRtahxRN6jmTjUviVPkXFNOTlkEFGlWnP4zceJujO86S8rmLfnT8XjM2Da7lMbhMeLvn+h54je+H4hbER8pMGXD27S2X4j3dpSbzs+zPzSaW+V09wTziqxfDhr+jDt8z8UQlaLo64snljinhrMw3i03y0fCZC7Q9N92rsj/h/ChnRHBMMt5RsLUMSExlymZF81HiEiM7B88qJ1guwmZ9Z6DOvoIWPoHw8RxP20k0q6Jb2Tnt/mzGSOqr3HzuO2ttCw0n0EsJ6ha6wCvjSsL8M8MdUY+zzWPa6OGH5TD5vH7ElRuZNwUgnLGSe7Q8I8mqc5YGbL/Y/QB183Fj6Zs4h2bKyyBirL9TPlQEIrlt+xrO0zXmeKOWjqUAp3EdKSFQkcXCevfI70nch/ZM7x6Nm/eBYCe/oyaYqpF9ZhrId2f00gwa8rZnSu4rbMYvBxtR34lQDL6gnlH7afPIkKtwayEBrCBmX4FWSPHLo6UQBBWycZWv9ZhucorxmBJndi86i2kN0kpPFc/cfrGMQNWq+vlwv7sK3XeKne84mV3iwlVH6TecWOMACDbIpeWCdsx4Yz6jmDMfaFGAEM560F4OjuA+c3/V0P/227sIkQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bcc9eb0-0040-4579-cc8c-08ddb2a7693a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2025 22:43:45.0985
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aQhnBMcRcEhTe4ahOvXDlo6QE6YxZTqW1lF8j/8Ium8ZviOtG03EhtTvF4nSA2wR1RpSEbY74XOZT6ESiskrTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5595
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDE1NiBTYWx0ZWRfX1czq5clfuK5U
 RffQpWnubeE4CfR5SZWrPRJeZPz4KlyQ4FdDTq7D4BNOmkjNTKdklLU8uxrbdHqemrJlg9FLocT
 WKfHtFEgEH+oR3ZHc01ChLtVZpq1QD70PdOqzbMW9aObn2Tixc0Y2cWq5g972SP1fYJFgViaLQd
 7U5eU/4wbVT1e4zcWmN0hC97M1LwOwSfmDkD+bcc301MkwWoZjrUa4xSerxen1XNwgUUMHXBmWM
 xBEKPuU4xJfSpgPtemPcPEWw74G5vhXUfvUkUg1I3vhaoT2F6Of/wtADvm9Li+ogHOnymylFFeE
 Sdb5kOIfdd1tNweb6BR1lHlUylELMgPm2kaIXSSmHxCL8w9qcv87aYXLjbvMoPU4ES77kZF/ja6
 UWoUBVBpZXnnXsl+jQp37m8iY0cRRj+AAgXmUYoU3G8xggvxSoha1hQC4LcWWhKRWnDoX/f7
X-Proofpoint-ORIG-GUID: whE4Wy1dqrwTLXI0lYQ7yobIUZEgq5SH
X-Proofpoint-GUID: whE4Wy1dqrwTLXI0lYQ7yobIUZEgq5SH
X-Authority-Analysis: v=2.4 cv=KMdaDEFo c=1 sm=1 tr=0 ts=6859d8a8 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=qPHU084jO2kA:10 a=N3aGF_hyAAAA:8 a=jIQo8A4GAAAA:8
 a=r90hgMZrH_OsE3fdz88A:9 a=QEXdDO2ut3YA:10 a=or5rwjIMHQalKGFFZql7:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_07,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000 definitions=main-2506230156

T24gU2F0LCBKdW4gMjEsIDIwMjUsIEpvaGFubmVzIFNjaG5laWRlciB3cm90ZToNCj4gTm93IHRo
YXQgdGhlIFRSQiByZWNsYWltIGxvZ2ljIGFsd2F5cyBpbnNwZWN0cyB0aGUgVFJCJ3MgQ0hOIChD
aGFpbikgYml0DQo+IGRpcmVjdGx5IHRvIGRldGVybWluZSB3aGV0aGVyIGEgVFJCIGlzIHBhcnQg
b2YgYSBjaGFpbiwgdGhlIGV4cGxpY2l0DQo+ICdjaGFpbicgcGFyYW1ldGVyIHBhc3NlZCBpbnRv
IGR3YzNfZ2FkZ2V0X2VwX3JlY2xhaW1fY29tcGxldGVkX3RyYigpDQo+IGlzIG5vIGxvbmdlciBu
ZWNlc3NhcnkuDQo+IA0KPiBUaGlzIGNsZWFudXAgc2ltcGxpZmllcyB0aGUgcmVjbGFpbSBjb2Rl
IGJ5IGF2b2lkaW5nIGR1cGxpY2F0aW9uIG9mDQo+IGNoYWluIHN0YXRlIHRyYWNraW5nLCBhbmQg
bWFrZXMgdGhlIHJlY2xhaW0gbG9naWMgcmVseSBlbnRpcmVseSBvbiB0aGUNCj4gaGFyZHdhcmUg
ZGVzY3JpcHRvciBmbGFncyDigJQgd2hpY2ggYXJlIGFscmVhZHkgcHJlc2VudCBhbmQgYWNjdXJh
dGUgYXQNCj4gdGhpcyBzdGFnZS4NCj4gDQo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlcyBpbnRlbmRl
ZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEpvaGFubmVzIFNjaG5laWRlciA8am9oYW5uZXMuc2No
bmVpZGVyQGxlaWNhLWdlb3N5c3RlbXMuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMv
Z2FkZ2V0LmMgfCA4ICsrKystLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZ2Fk
Z2V0LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+IGluZGV4IDk5ZmJkMjlkOGY0NmQz
MGRmNTU4Y2ViMjNkMmFmZTcxODdiNDI0NGMuLmE0YTJiZjI3M2Y5NDNmYTExMmY0OTk3OTI5NzAy
M2E3MzJlMGFmMmUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4g
KysrIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPiBAQCAtMzQ5Nyw3ICszNDk3LDcgQEAg
c3RhdGljIHZvaWQgZHdjM19nYWRnZXRfZnJlZV9lbmRwb2ludHMoc3RydWN0IGR3YzMgKmR3YykN
Cj4gIA0KPiAgc3RhdGljIGludCBkd2MzX2dhZGdldF9lcF9yZWNsYWltX2NvbXBsZXRlZF90cmIo
c3RydWN0IGR3YzNfZXAgKmRlcCwNCj4gIAkJc3RydWN0IGR3YzNfcmVxdWVzdCAqcmVxLCBzdHJ1
Y3QgZHdjM190cmIgKnRyYiwNCj4gLQkJY29uc3Qgc3RydWN0IGR3YzNfZXZlbnRfZGVwZXZ0ICpl
dmVudCwgaW50IHN0YXR1cywgaW50IGNoYWluKQ0KPiArCQljb25zdCBzdHJ1Y3QgZHdjM19ldmVu
dF9kZXBldnQgKmV2ZW50LCBpbnQgc3RhdHVzKQ0KPiAgew0KPiAgCXVuc2lnbmVkIGludAkJY291
bnQ7DQo+ICANCj4gQEAgLTM1NDksNyArMzU0OSw4IEBAIHN0YXRpYyBpbnQgZHdjM19nYWRnZXRf
ZXBfcmVjbGFpbV9jb21wbGV0ZWRfdHJiKHN0cnVjdCBkd2MzX2VwICpkZXAsDQo+ICAJaWYgKCh0
cmItPmN0cmwgJiBEV0MzX1RSQl9DVFJMX0hXTykgJiYgc3RhdHVzICE9IC1FU0hVVERPV04pDQo+
ICAJCXJldHVybiAxOw0KPiAgDQo+IC0JaWYgKGV2ZW50LT5zdGF0dXMgJiBERVBFVlRfU1RBVFVT
X1NIT1JUICYmICFjaGFpbikNCj4gKwlpZiAoZXZlbnQtPnN0YXR1cyAmIERFUEVWVF9TVEFUVVNf
U0hPUlQgJiYNCj4gKwkgICAgISh0cmItPmN0cmwgJiBEV0MzX1RSQl9DVFJMX0NITikpDQo+ICAJ
CXJldHVybiAxOw0KPiAgDQo+ICAJaWYgKCh0cmItPmN0cmwgJiBEV0MzX1RSQl9DVFJMX0lTUF9J
TUkpICYmDQo+IEBAIC0zNTc2LDggKzM1NzcsNyBAQCBzdGF0aWMgaW50IGR3YzNfZ2FkZ2V0X2Vw
X3JlY2xhaW1fdHJiX3NnKHN0cnVjdCBkd2MzX2VwICpkZXAsDQo+ICAJCXRyYiA9ICZkZXAtPnRy
Yl9wb29sW2RlcC0+dHJiX2RlcXVldWVdOw0KPiAgDQo+ICAJCXJldCA9IGR3YzNfZ2FkZ2V0X2Vw
X3JlY2xhaW1fY29tcGxldGVkX3RyYihkZXAsIHJlcSwNCj4gLQkJCQl0cmIsIGV2ZW50LCBzdGF0
dXMsDQo+IC0JCQkJISEodHJiLT5jdHJsICYgRFdDM19UUkJfQ1RSTF9DSE4pKTsNCj4gKwkJCQl0
cmIsIGV2ZW50LCBzdGF0dXMpOw0KPiAgCQlpZiAocmV0KQ0KPiAgCQkJYnJlYWs7DQo+ICAJfQ0K
PiANCj4gLS0gDQo+IDIuMzQuMQ0KPiANCg0KQWNrZWQtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmgu
Tmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KTm90ZTogaWYgeW91IHdhbnQgdGhlIGZpeCBbUGF0Y2gg
MS8zXSB0byBiZSBwaWNrZWQgdXAgZWFybHksIHRoZW4gaXQgbmVlZHMgdG8NCmJlIHNlcGFyYXRl
ZCBmcm9tIHRoaXMgc2VyaWVzLiBPdGhlcndpc2UgdGhpcyBzZXJpZXMgd29uJ3QgYmUgcGlja2Vk
IHVwDQp1bnRpbCB0aGUgbmV4dCByYzEgcmVsZWFzZS4NCg0KVGhhbmtzLA0KVGhpbmg=
