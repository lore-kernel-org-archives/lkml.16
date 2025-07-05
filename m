Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com [148.163.149.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0D278C9C
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 00:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.149.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751677200; cv=fail; b=hfwnlSX4MAC8RTRo4BZmmNpONRdkxGO74dTRv1wDOr6a9xXRmwKLpcaSqNSDe5ThlCMMgkjRfDKLiyjl3wj5Td8Y/uU9st6BadY9NDVuJhhIGMERNc2zO/tdqtCG4RyH+M0Ityyz29XDnxOeIfrFrZLHdCsqtJ6oEmRLC+tOb44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751677200; c=relaxed/simple;
	bh=0CkmpszOBMds6kdrUUkDHM4Lzl6W2gdrfI30DM/Om4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=njvwZrFDmlciVRXBpEJt8jTIHnzRc2ocCUHecxZfiSQ0N522aV4h1prkO0FC0FK//kxAvzKdhD9PXn8tbyi6MbRCay1+Dh0vQagFEEQvNl0M3/xSWj+VbIq3gQIpK+OAN7VSte80Z85h6voneRuSDuStanLD7eVbefWAXIoAkng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=silabs.com; spf=pass smtp.mailfrom=silabs.com; dkim=pass (2048-bit key) header.d=silabs.com header.i=@silabs.com header.b=Q1e9F6FK; dkim=pass (1024-bit key) header.d=silabs.com header.i=@silabs.com header.b=ZYAsY7MA; arc=fail smtp.client-ip=148.163.149.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=silabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=silabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=silabs.com header.i=@silabs.com header.b="Q1e9F6FK";
	dkim=pass (1024-bit key) header.d=silabs.com header.i=@silabs.com header.b="ZYAsY7MA"
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
	by mx0a-0024c301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564No2mG017370;
	Fri, 4 Jul 2025 19:40:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps12202023;
	 bh=DPVDcnaYDPf1dnPAmX8COJCxinBXAlcp5ymcU+3yntw=; b=Q1e9F6FKMWVk
	YIqeYGJHXf5URk5r8vixAJ97V2bR1AJOq1L5w3etx0ZRJOwNk+CsxMpkfcpbnzty
	pUOu65Ac7gu9agvNhV2Nz3o+jnfinJrhIHTFpXLvCLACgsQN+/9+lGZ/2YX3cIO6
	MDzZkkXr3vzzXMBP4qqhKc6kwpFxHDzNsRkrV25bHT9sEnL+P1L0ySrBoBqV+0Bi
	/fPTQlqIbIeOqRS4pAcLfZfsM77uYLlqfKtKRqDKnWZ+IsAJV0XX3ar9dU7TfPcc
	AUcr6mpQNHEp9St9z6IjJHTRwwJ6vAUC0NkbfAJ356JmjD5NcEKnB5GVFq9Lfp7B
	5UcmePjRlg==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2109.outbound.protection.outlook.com [40.107.244.109])
	by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 47p8pvhb7y-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 19:40:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Elg+Yh7m5gFHJBV/IbYcaN+/Ldq7996mYgVh7MyT+4Zn1VbT30pJ/4VnYUdC+QPC1zIVwyQCaarIkz6uRywclbw+G/brKteitwOs14RapTMRppujZwrEM1ZkFkVwEz2NGoRMQSk/CXcBJfr5RBP/5TdIzN/cGxtbHq1FKU24ZVTQyTITYsNzAoHX074DklWg08JoqUvGgNPpFcjeHHJfd5nJoJpNTK+5vKro8FVCTqcya4fHrIuV0rYiFTCYplYhokCZiz7soJxow8+Zz8PbbiWZ4yRj8D/SXc8eq9/MlOgAOTXZDHSpVQBWG6MkkmsfBzPCaUadQTVphHoJ5IR3+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPVDcnaYDPf1dnPAmX8COJCxinBXAlcp5ymcU+3yntw=;
 b=gXbZAK5MzLsYbOIjflEYlQh6DO8PyD7ETf5AfeVrgfeOsr5Jnx0XXkXm+A3mFCCsNMCkndWgar1P809jlt7NMIoqiAJ211Ce+CB9Uevg9reTmUhBY7danK1PsM1XPvEUFcgjgeSiBN66h0ZrDvSFipmHBh9hM/W9KNc1EEtfGHCE/SACJhs/dFC+u7DO5XHnGG5gd2jrR3whkZAP2wl7oKfosDxQwhHaP8HoQB4IWpfw/u53IK9TM8eCoDk12KtIpTvCjvhNuHVB2gHLMz1MNqn5gXm5HN4BO9tyhYMZVMkjFgRV4HzIRUCzrKHgDh5gdhAUpFlg5qng0KUQifxVlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=silabs.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPVDcnaYDPf1dnPAmX8COJCxinBXAlcp5ymcU+3yntw=;
 b=ZYAsY7MAw2n6pGp19uhl64GBVzjpU7FbrO9kSy5Q6hII8CK40qyx0nn6bYwsg653jUlIm7OUMe5oqQsV2zE7kXxfwWOqPaccp1faHTiiJYm8nT1PaAWYNe7N8ifYMGFff9cflV75tZNdr4la8CradQrLKRucehZrinKZOMEerto=
Received: from DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17)
 by SA2PR11MB5068.namprd11.prod.outlook.com (2603:10b6:806:116::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Sat, 5 Jul
 2025 00:40:52 +0000
Received: from DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a]) by DS0PR11MB8205.namprd11.prod.outlook.com
 ([fe80::c508:9b04:3351:524a%4]) with mapi id 15.20.8880.034; Sat, 5 Jul 2025
 00:40:52 +0000
From: =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
To: greybus-dev@lists.linaro.org
Cc: linux-kernel@vger.kernel.org, linux-devel@silabs.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
        =?UTF-8?q?Damien=20Ri=C3=A9gel?= <damien.riegel@silabs.com>
Subject: [RFC 3/6] greybus: cpc: add SPI driver
Date: Fri,  4 Jul 2025 20:40:33 -0400
Message-ID: <20250705004036.3828-4-damien.riegel@silabs.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250705004036.3828-1-damien.riegel@silabs.com>
References: <20250705004036.3828-1-damien.riegel@silabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::26) To DS0PR11MB8205.namprd11.prod.outlook.com
 (2603:10b6:8:162::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8205:EE_|SA2PR11MB5068:EE_
X-MS-Office365-Filtering-Correlation-Id: 612c39c3-839b-40ec-6d8f-08ddbb5c9839
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QjE5SmhybTlvUVNQZm9DUFdrSExnNjZsR2RNTjdJOCtQZVc5a25mUU1zU0VT?=
 =?utf-8?B?Z3FCUzZOOXJqY2lITkcxMFhtWXBvaE1RY3RiVTgxOXZiNytsZ1Y0UVgwNWVo?=
 =?utf-8?B?YVhkdjl3QklxOEtkRmI2VWwxeFBReGVHS1FvSFRsTmgvaTFlVHhGRW9NYzhG?=
 =?utf-8?B?cHAyZFVJeE9vN0V4Y0d2alVYOFRIM3I5VDVIYjdvQWlRWk94OGZZL1h4bGVE?=
 =?utf-8?B?WjJtSmR2OHRXQlRTak1kSDJFUGN0eXJzVmFuZVZxS0FLbFVmQWNqK2MvZCtF?=
 =?utf-8?B?dlUwWWk2YkNvWUZ5TmtJL3FjbzZLVzlsMlBPNXRscnYxTlNzc0JYekZjdUVk?=
 =?utf-8?B?RDB1cHQxRGRxeG1TNW1iYXFmRU13MUo0cnM5b1pIcFZSUVUwTG11WUlHeFRM?=
 =?utf-8?B?U1oyWGxiS0QvRWduam04OFRFYlJmSm5UbjR3WUFZYllsRmlXVzMwcitkS2Ir?=
 =?utf-8?B?azJXV0dncEdzbDViUytlTFFNNmw0b1ZoNGxIeXJrVTVJdTZCWlBLYm1yOTBh?=
 =?utf-8?B?c2YvOERFU2RxZlRnLzRJcldTMUdwV2w5WGxUWXFldnpLeWhWaWdCblJSbTFi?=
 =?utf-8?B?UWZScEwyeGZMNWh3N3pUbWdSVlBMcmRnVVFaRXhYdlNUQk9WMGpzRGU3bkJJ?=
 =?utf-8?B?RUs4c1JzMnZSdFZBT3lMaWNTVUFKNTBpRVF5bnJicTF4NTY2cGI3WUtZeTNS?=
 =?utf-8?B?ZjEvK05nMkhIb0RxSmM5VDlUbUJNL1kwelNpdG1TU0hsMUlSazBLV3c5bUVl?=
 =?utf-8?B?d2lEeVFZMjhXSlJWZGZncmMzaFdrU3NkenBZQks5M3JEOG5BdkNvODR1M0lD?=
 =?utf-8?B?R2xHZHltZlE4RzNhQlVaSWt3Ri9vTnZOWFhDVHVTQ0dkUVdzUTBOZEhlUjVT?=
 =?utf-8?B?TGkvalUxUFN1T0ZLK3BVUk9DTFBGOTJGTnR6aXZ2dlp5Tm44NWMwUUwyd0th?=
 =?utf-8?B?OU9ka3M1R1htU1hKN01TQkpSSTMzRUVSZnFDTWhneXEvS3g2NHdUeUZ2WmxW?=
 =?utf-8?B?dHEweXBMbnpBV1V1R0hHa1cxRnNrT1oyTlY4Qk9aTDU0RDhDWkJMZWV5dXEz?=
 =?utf-8?B?WFpEejhQb1AxQmt3cW9maE1kUVVvTk0zaXNlN0ZheWVQOE9NZzUraThWRjZr?=
 =?utf-8?B?bU9EbnJNL2ZNRSt4dnMwQlJuVUhNWkZmd05pYjdEV2Q3MnJUTEl1aStNSHFS?=
 =?utf-8?B?aGwvVlJ4bmVDTWcxRExLbHBDRnlxTDRKR0RMS1p5eUVSQnF4ZVNaazNNVnY4?=
 =?utf-8?B?Y0loQ0tidi9OZFJ2dkwrM1ZUTXl6cEkrWjE1dDZLUGRXVUtQejBiUUZUVmI1?=
 =?utf-8?B?WjFTc01US0xFdHdzamZlaHFmK1JWYW1NNzJLS2V1bEEvemx4K1cySXlkRXI4?=
 =?utf-8?B?OHMvYkE5WWxyaUxueUdUUlplclFONk4wVHlUWEdOSEozTDdxRngzbWtkZVRj?=
 =?utf-8?B?cEExTU5iL1ZRcjZ6SjZvYVZHekVTQ3BvQzNlZ0ZPeHl6UUx6Q3gvN1JFTXgy?=
 =?utf-8?B?RnFVYmpqMGZxc0d1dVZ5TXpudlZ2VHlPREM1VEZ1YXVXWExwWHpjYTFtZWRr?=
 =?utf-8?B?VDRyMEt0c0ZCSkhPRFJ0YWF5Um1vakVXNklIb3ZtQlNaTGZ0cE5wMG0zRDZh?=
 =?utf-8?B?Z1YrTkYyNVlBN2c5R2VGK1ZiQkNib3Jsd21hV1hUQ0FvbDJUNWtVOXdwYldW?=
 =?utf-8?B?eUxRS2tuOWI5aCtmaDRtU0VOcnVnZVNzY1oyc09oNUtzV1BzWGNsUmNROVIr?=
 =?utf-8?B?bVArVi9QaE4yc2c1WEVCNUUzZDEva256SFd0SnRBMWtDS25MYVN3WHl2YjNw?=
 =?utf-8?B?eEM1a3cweE1SM1ZWQVVTZVJEYWVaQ3cxbWFEcGpaQ2lQQjk0cWpTVmpmdkRX?=
 =?utf-8?B?Q3NhQ3cwN2F3TlB3cXZ6WWc4TlNjUjZTdG1JZWxMQTNmN2t4b2VaQ2d0ek1I?=
 =?utf-8?B?QUJPbGdvTGdwNXM1dmpZek9GSzlSL3poWmdaZFlYbHhzL3UzOUhlVVVCT24w?=
 =?utf-8?B?WEdGdGo5dHFBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnR0Y1BNRDFCeUo5L3BIR3ZlL0N0VFZJMVFkMWFKTzBYUXBZRFNMYzlKNGtI?=
 =?utf-8?B?YmJENHozc0ZTRHRVb0JCM095bXJadS9qbWliZ0dWaWZGTzNKRDJCL21RRXFP?=
 =?utf-8?B?bWQ4Z2FWZllFbTNsc1ZVaDlOeXRMcFlCYWgxcWVGcldtb2FLbVhuMVhBZ1NL?=
 =?utf-8?B?NUxWeWI0bkUxTy9XS3IxVWJBTGwzMWN3WGpBQzJtQnU5a1N3eDZqeDhHN09W?=
 =?utf-8?B?Nmp4aDM4Ry82ZTAyZEszMXFBZnFmbzVKdEQvdkZkUEZNbnViamx1Y3RzYlI0?=
 =?utf-8?B?UzM4ZVEwdHJ3QzhJSFFSRGJzOGlZUU8wcVViYzdXcUppQXp3ZW9PWFBUTysz?=
 =?utf-8?B?ZXdKaU1SL3VKaHljMFdabmtia1ZoaURCUksxbmpDc1lNSm1uWVhUZmFUTWFZ?=
 =?utf-8?B?VDh1b2NRQ3gxbk5ibDNOMHFCMjMzS0JNRHNBV1BWTGpRYmpmNG9mZ1BaYWp1?=
 =?utf-8?B?R1YxN2x1Y2R2Q1pCS3hSTUxVL1N2dXM5UzI4UWlvN2VLT1RTeU0yN3V4cG1n?=
 =?utf-8?B?UUxGUXlPbUZUMk1NTnd3eUNXZzRRTW8xU3hYNVZNdUNxN0p5a0lmdW1MRktp?=
 =?utf-8?B?eDR6QjRnUm16SVc5QndFSzJIM01RVVdQNWhyVEpRTVVDUllhYWo4ekJtRUw4?=
 =?utf-8?B?Sk5VZi9hUEVpQ0pEYW12UXV4RXBhWHBZWGlmZXQ4N0ZBNkJMeDl0aUdtNGRY?=
 =?utf-8?B?bW5FVmdkK3BZOEt5K0phN0tWSVV1dEJrTnJ2WjIxWUlZMlpXRTBiY3ByMXJY?=
 =?utf-8?B?cWNUM3VvRUtaeWNaZ3BYdWd3YVBPZW1tekVwS0VEL3VaWkcwd3R2TlprUFVm?=
 =?utf-8?B?UTlTS2dsemZyZitUanpVeFRaU3B2Tlc1SkZaa000RW90MFRSSy93N2xHdkhK?=
 =?utf-8?B?OHhsMEZtRDNEbFZjZVdUOE0wWW93K1NMZ3YrczY2bktjeW9RcHM5VEJxdWUx?=
 =?utf-8?B?NHBmc1hQOHIvY2FXTEkxV1JQNXQvL1pQYTNoaTdVUUFJM3hKaFQ1RG9MeS9r?=
 =?utf-8?B?QUFqSFNUY2FWc2xjaU9EbHJBcFVPcXBXb2FaK1BzMlgzUTg0cWhoZHRSWHJ3?=
 =?utf-8?B?SHhnS2NoMitwNk1qTVk1MnlHTjQwYWxCUDlXTGU2dU83aGhNelA1UU91N1M5?=
 =?utf-8?B?VHoyWWtWWGFQYWk3QzJPckcyamxjN3pNT1ZUK1pFbHVyRkZVYkRTUVFJeWlE?=
 =?utf-8?B?eXdKeDNmSnVnT0RBUG9CUlR1d0JYYW0yd2FYWS91T2xpeUgvTzR6VnRtbnhj?=
 =?utf-8?B?ZVduZndiaDJHQ3pGM0xLNElWclN3M0x2VWZsa2ZQeEhUN3pucW5pNUNzVEhi?=
 =?utf-8?B?cFR0MnArU1htSk1UR0FPb2l4RFlFWE83SWVsYjljYWZJNFZEdE5oQTBLdTdm?=
 =?utf-8?B?ZVprUUNFdkNSeWh4ZHZtbW1wQmJtcFhsdm42ZlFTS1ByOU8vZ2Q1WDQzL3ls?=
 =?utf-8?B?bnpLQ2RlN3lWK2JtYUJIcHJHZUJYekpaWWJ3cnY4QmptUHBwTWNTdWIyQklQ?=
 =?utf-8?B?ZTJ6ZzdNc3NtNnZwbEc3b0Rxd0d2OHhEYkVzRjFjSDMrVDdTMW1qeHZkZGpS?=
 =?utf-8?B?RDdkSFhTVUl6NEVRWEpxS1JrT2dRNzViWXhmWkxEc3I0YzlFNXlBQW9sbHM3?=
 =?utf-8?B?N2xZWUVPakFJNkxZVG13OXJJWXlEQmthZjNSUWxkdzlwSGkyVFNkOFVWb1Fa?=
 =?utf-8?B?bmFzS01abU9rUm1xcGRFdDhET09DdHFqbFZ4TjBCdllBcHZTOUJQdVdDeFRw?=
 =?utf-8?B?ZnRudUEvMXBBcG9JOGQvZEJGeFJYN0N4WkJHcnlQMTliaFNHTHRzeWtvTFJv?=
 =?utf-8?B?dmZSY2hMeTlCcWRVcGJBN2lqUU9WcGdHRXo5emtsODR6T1JPQTRRVktxVzFs?=
 =?utf-8?B?V3JFa0lqMVlZMjlRQ1pxQW93NTJoTkdnY3hOYVV6Mk41b0NGQW5vTUVwU09r?=
 =?utf-8?B?ZFFDWWdrVzhwRXBNS3BrVVhHQzd5T1ZTY2ZoNzk4UHF1L2EveklvWm0xbTk3?=
 =?utf-8?B?TzEvZG5lcUJuY3BQTGlweUM3Y29IS3FvdTdRN2w0WGVtdzY4NVArRm9IYXZP?=
 =?utf-8?B?dWh3MGxiY3d5OEVtUldzVk5UQnN1SlhORERpaXpVOS82MnJZWUdDalBoU3Vt?=
 =?utf-8?Q?7EJh7DIirzzZX7JHTfwYAiNU6?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 612c39c3-839b-40ec-6d8f-08ddbb5c9839
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2025 00:40:52.3781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bP2FzxCdamjKDUGoWZTZsMBvzx7XlMQnN6QjpFv9GaZKQqMh8j31vYbu90DP5tJ4KZ1cqxefsU6gGIg8GYfTng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5068
X-Authority-Analysis: v=2.4 cv=L4EdQ/T8 c=1 sm=1 tr=0 ts=68687497 cx=c_pps a=U259+el5m5zn0mdk/7qTUw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=M51BFTxLslgA:10 a=i1IsUcr2s-wA:10 a=2AEO0YjSAAAA:8 a=qtlJ5sXZiQzIo2tJRN0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 9SCFJ6vtS2b6x7-vbN4jlJ-qnUXO_GeI
X-Proofpoint-ORIG-GUID: 9SCFJ6vtS2b6x7-vbN4jlJ-qnUXO_GeI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAwMSBTYWx0ZWRfX7xoVnHUCYcB7 eloO8bbQvyWfYufKy0mCyf0SJ8/SdczyRz6e/s9bIy6WGOFiyJrX8M3YPj0CEbJL/3faiDGJ4PU S+Y7GcSqYXldrirCwl3Cf2Mc95dqTymyjS2j6qFPjtU6t2dEiO9Cl57KtQzPkoxR2UHpfmpk/Mw
 F+JrobCP0MOJktpy54kf38l/qwkVO841cfzrsa61rIYj9MrgoePQeBQoR+u4vJEX91/PsZH8zSF vwBVYHqaRm+fq6ACOrkR/uP51VAvQHuIYR2oQFhVZj2hx7LV2Ys5MMIHYCzYxwPY9MYiW3qq/A9 d4pxSfI7X04bBzYCkxO7brk3acVSyhj3MdajQkuYHUQmuxjbaSihrSEUYJXUaVHoOVZjio8nh7X
 1gdkT4ad8qAiOk6FTpIwBbvatYQsImErMSSTL1fetpsNfU8GUL61J+AoyDkYvdWJBBfR+WQH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 mlxscore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507050001

Header frames are always 10 bytes (8 bytes of header and 2 bytes of
checksum). The header contains the size of the payload to receive (size
to transmit is already known). As the SPI device also has some
processing to do when it receives a header, the SPI driver must wait for
the interrupt line to be asserted before clocking the payload.

The SPI device always expects the chip select to be asserted and
deasserted after a header, even if there are no payloads to transmit.
This is used to keep headers transmission synchronized between host and
device. As some controllers don't support doing that if there is nothing
to transmit, a null byte is transmitted in that case and it will be
ignored by the device.

If there are payloads, the driver will clock the maximum length of the
two payloads. The payloads are always Greybus messages, so they should
be at least 8 bytes (Greybus header), plus a variable greybus payload.

Signed-off-by: Damien Riégel <damien.riegel@silabs.com>
---
 drivers/greybus/cpc/Makefile |   2 +-
 drivers/greybus/cpc/spi.c    | 585 +++++++++++++++++++++++++++++++++++
 2 files changed, 586 insertions(+), 1 deletion(-)
 create mode 100644 drivers/greybus/cpc/spi.c

diff --git a/drivers/greybus/cpc/Makefile b/drivers/greybus/cpc/Makefile
index 08ef7c6d24b..4ee37ea5f52 100644
--- a/drivers/greybus/cpc/Makefile
+++ b/drivers/greybus/cpc/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-gb-cpc-y := endpoint.o header.o host.o main.o protocol.o
+gb-cpc-y := endpoint.o header.o host.o main.o protocol.o spi.o
 
 # CPC core
 obj-$(CONFIG_GREYBUS_CPC)	+= gb-cpc.o
diff --git a/drivers/greybus/cpc/spi.c b/drivers/greybus/cpc/spi.c
new file mode 100644
index 00000000000..b8f3877bde1
--- /dev/null
+++ b/drivers/greybus/cpc/spi.c
@@ -0,0 +1,585 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025, Silicon Laboratories, Inc.
+ */
+
+#include <linux/atomic.h>
+#include <linux/crc-itu-t.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/greybus.h>
+#include <linux/interrupt.h>
+#include <linux/kthread.h>
+#include <linux/minmax.h>
+#include <linux/of.h>
+#include <linux/skbuff.h>
+#include <linux/slab.h>
+#include <linux/spi/spi.h>
+#include <linux/unaligned.h>
+#include <linux/wait.h>
+
+#include "cpc.h"
+#include "header.h"
+
+#define CPC_SPI_CSUM_SIZE			2
+#define GB_CPC_SPI_MSG_SIZE_MAX			2048
+#define CPC_SPI_INTERRUPT_MAX_WAIT_MS		500
+
+struct cpc_spi {
+	struct cpc_host_device	cpc_hd;
+
+	struct spi_device	*spi;
+
+	struct task_struct *task;
+	wait_queue_head_t event_queue;
+
+	struct cpc_frame *tx_frame;
+	u8 tx_csum[CPC_SPI_CSUM_SIZE];
+
+	atomic_t event_cond;
+
+	unsigned int rx_len;
+	struct cpc_header rx_header;
+	u8 rx_frame[GB_CPC_SPI_MSG_SIZE_MAX + CPC_SPI_CSUM_SIZE];
+	u8 rx_csum[CPC_SPI_CSUM_SIZE];
+};
+
+struct cpc_xfer {
+	u8		*data;
+	unsigned int	total_len;
+	unsigned int	remaining_len;
+};
+
+static inline struct cpc_spi *gb_hd_to_cpc_spi(struct gb_host_device *hd)
+{
+	return (struct cpc_spi *)&hd->hd_priv;
+}
+
+static inline struct cpc_spi *cpc_hd_to_cpc_spi(struct cpc_host_device *cpc_hd)
+{
+	return container_of(cpc_hd, struct cpc_spi, cpc_hd);
+}
+
+static int gb_cpc_spi_wake_tx(struct cpc_host_device *cpc_hd)
+{
+	struct cpc_spi *ctx = cpc_hd_to_cpc_spi(cpc_hd);
+
+	wake_up_interruptible(&ctx->event_queue);
+
+	return 0;
+}
+
+static bool buffer_is_zeroes(const u8 *buffer, size_t length)
+{
+	for (size_t i = 0; i < length; i++) {
+		if (buffer[i] != 0)
+			return false;
+	}
+
+	return true;
+}
+
+static u16 gb_cpc_spi_csum(u16 start, const u8 *buffer, size_t length)
+{
+	return crc_itu_t(start, buffer, length);
+}
+
+static int gb_cpc_spi_do_xfer_header(struct cpc_spi *ctx)
+{
+	struct spi_transfer xfer_header = {
+		.rx_buf = (u8 *)&ctx->rx_header,
+		.len = CPC_HEADER_SIZE,
+		.speed_hz = ctx->spi->max_speed_hz,
+	};
+	struct spi_transfer xfer_csum = {
+		.rx_buf = &ctx->rx_csum,
+		.len = sizeof(ctx->tx_csum),
+		.speed_hz = ctx->spi->max_speed_hz,
+	};
+	enum cpc_frame_type type;
+	struct spi_message msg;
+	size_t payload_len = 0;
+	u16 rx_csum;
+	u16 csum;
+	int ret;
+
+	if (ctx->tx_frame) {
+		u16 tx_hdr_csum = gb_cpc_spi_csum(0, (u8 *)&ctx->tx_frame->header, CPC_HEADER_SIZE);
+
+		put_unaligned_le16(tx_hdr_csum, ctx->tx_csum);
+
+		xfer_header.tx_buf = &ctx->tx_frame->header;
+		xfer_csum.tx_buf = ctx->tx_csum;
+	}
+
+	spi_message_init(&msg);
+	spi_message_add_tail(&xfer_header, &msg);
+	spi_message_add_tail(&xfer_csum, &msg);
+
+	ret = spi_sync(ctx->spi, &msg);
+	if (ret)
+		return ret;
+
+	if (ctx->tx_frame) {
+		if (!ctx->tx_frame->message) {
+			cpc_frame_sent(ctx->tx_frame, ret);
+			ctx->tx_frame = NULL;
+		}
+	}
+
+	if (buffer_is_zeroes((u8 *)&ctx->rx_header, CPC_HEADER_SIZE))
+		return 0;
+
+	rx_csum = get_unaligned_le16(&ctx->rx_csum);
+	csum = gb_cpc_spi_csum(0, (u8 *)&ctx->rx_header, CPC_HEADER_SIZE);
+
+	if (rx_csum != csum || !cpc_header_get_type(&ctx->rx_header, &type)) {
+		/*
+		 * If the header checksum is invalid, its length can't be trusted, receive
+		 * the maximum payload length to recover from that situation. If the frame
+		 * type cannot be extracted from the header, use same recovery mechanism.
+		 */
+		ctx->rx_len = GB_CPC_SPI_MSG_SIZE_MAX;
+
+		return 0;
+	}
+
+	if (type == CPC_FRAME_TYPE_DATA)
+		payload_len = cpc_header_get_payload_len(&ctx->rx_header) +
+			      sizeof(ctx->tx_csum);
+
+	if (payload_len)
+		ctx->rx_len = payload_len;
+	else
+		cpc_hd_rcvd(&ctx->cpc_hd, &ctx->rx_header, NULL, 0);
+
+	return 0;
+}
+
+static int gb_cpc_spi_do_xfer_notch(struct cpc_spi *ctx)
+{
+	struct spi_transfer xfer = {
+		.tx_buf = ctx->tx_csum,
+		.len = 1,
+		.speed_hz = ctx->spi->max_speed_hz,
+	};
+	struct spi_message msg;
+
+	ctx->tx_csum[0] = 0;
+
+	spi_message_init(&msg);
+	spi_message_add_tail(&xfer, &msg);
+
+	return spi_sync(ctx->spi, &msg);
+}
+
+static unsigned int fill_xfer(struct spi_transfer *xfer,
+			      u8 **tx, unsigned int *tx_len,
+			      u8 **rx, unsigned int *rx_len)
+{
+	unsigned int xfer_len = 0;
+
+	if (*tx_len && *rx_len)
+		xfer_len = (*tx_len < *rx_len) ? *tx_len : *rx_len;
+	else if (*tx_len)
+		xfer_len = *tx_len;
+	else if (*rx_len)
+		xfer_len = *rx_len;
+	else
+		return 0;
+
+	xfer->tx_buf = *tx;
+	xfer->rx_buf = *rx;
+	xfer->len = xfer_len;
+
+	if (*tx) {
+		*tx += xfer_len;
+		*tx_len -= xfer_len;
+	}
+
+	if (*rx) {
+		*rx += xfer_len;
+		*rx_len -= xfer_len;
+	}
+
+	return xfer_len;
+}
+
+static int gb_cpc_spi_do_xfer_payload(struct cpc_spi *ctx)
+{
+	unsigned int rx_len = ctx->rx_len ? ctx->rx_len + CPC_SPI_CSUM_SIZE : 0;
+	struct spi_transfer xfers[4];
+	struct spi_message msg;
+	int ret;
+
+	unsigned int tx_lens[3] = { 0 };
+	u8 *tx_ptrs[3] = { NULL };
+
+	spi_message_init(&msg);
+
+	if (ctx->tx_frame && ctx->tx_frame->message) {
+		struct gb_message *m = ctx->tx_frame->message;
+		unsigned int idx = 0;
+		u16 csum = 0;
+
+		tx_ptrs[idx]   = (u8 *)m->header;
+		tx_lens[idx++] = sizeof(struct gb_operation_msg_hdr);
+		csum = gb_cpc_spi_csum(csum, (u8 *)m->header, sizeof(struct gb_operation_msg_hdr));
+
+		if (m->payload_size) {
+			tx_ptrs[idx]   = m->payload;
+			tx_lens[idx++] = m->payload_size;
+			csum = gb_cpc_spi_csum(csum, m->payload, m->payload_size);
+		}
+
+		put_unaligned_le16(csum, ctx->tx_csum);
+
+		tx_ptrs[idx]   = ctx->tx_csum;
+		tx_lens[idx++] = CPC_SPI_CSUM_SIZE;
+	}
+
+	unsigned int tx_idx = 0;
+	unsigned int tx_len = tx_lens[tx_idx];
+	u8 *tx_ptr = tx_ptrs[tx_idx];
+	u8 *rx_ptr = rx_len ? ctx->rx_frame : NULL;
+
+	/*
+	 * This loop goes over a list of TX elements to send. There can be 0, 2 or 3 (nothing,
+	 * greybus header + csum, and optionally greybus payload).
+	 * RX, if present, consists of only one element.
+	 *	[ tx_ptr1; tx_len1 ] --> [ tx_ptr2; tx_len2 ] --> [ tx_ptr3; tx_len3 ]
+	 *	[ rx_ptr1; rx_len1 ]
+	 *
+	 * The RX buffer can span over several TX buffers, the loop takes care of chunking into
+	 * spi_transfer.
+	 *
+	 */
+	for (unsigned int i = 0; i < ARRAY_SIZE(xfers); i++) {
+		struct spi_transfer *xfer = &xfers[i];
+
+		fill_xfer(xfer, &tx_ptr, &tx_len, &rx_ptr, &rx_len);
+
+		spi_message_add_tail(xfer, &msg);
+
+		/*
+		 * If the rx pointer is not NULL, but the rx length is 0, it means that the rx
+		 * buffer was fully transferred in this iteration.
+		 */
+		if (rx_ptr && !rx_len) {
+			rx_ptr = NULL;
+
+			/*
+			 * And if tx_ptr is NULL, it means there was no TX data to send, so the
+			 * transfer is done.
+			 */
+			if (!tx_ptr)
+				break;
+		}
+
+		/*
+		 * If tx_len is zero, it means we can go the next TX element to transfer.
+		 */
+		if (!tx_len) {
+			tx_idx++;
+			if (tx_idx < ARRAY_SIZE(tx_ptrs)) {
+				tx_len = tx_lens[tx_idx];
+				tx_ptr = tx_ptrs[tx_idx];
+			} else {
+				tx_len = 0;
+				tx_ptr = NULL;
+			}
+
+			/*
+			 * If there's nothing else to transfer and the rx_len was also NULL,
+			 * that means the transfer is fully prepared.
+			 */
+			if (!tx_len && !rx_len)
+				break;
+		}
+	}
+
+	ret = spi_sync(ctx->spi, &msg);
+	if (ret)
+		goto exit;
+
+	if (ctx->rx_len) {
+		unsigned char *csum_ptr;
+		u16 expected_csum;
+		u16 csum;
+
+		if (ret)
+			goto exit;
+
+		csum_ptr = ctx->rx_frame + ctx->rx_len;
+		csum = get_unaligned_le16(csum_ptr);
+
+		expected_csum = gb_cpc_spi_csum(0, ctx->rx_frame, ctx->rx_len);
+
+		if (csum == expected_csum)
+			cpc_hd_rcvd(&ctx->cpc_hd, &ctx->rx_header, ctx->rx_frame, ctx->rx_len);
+	}
+
+exit:
+	ctx->rx_len = 0;
+
+	return ret;
+}
+
+static int gb_cpc_spi_do_xfer_thread(void *data)
+{
+	struct cpc_spi *ctx = data;
+	bool xfer_idle = true;
+	int ret;
+
+	while (!kthread_should_stop()) {
+		if (xfer_idle) {
+			ret = wait_event_interruptible(ctx->event_queue,
+						       (!cpc_hd_tx_queue_empty(&ctx->cpc_hd) ||
+							atomic_read(&ctx->event_cond) == 1 ||
+							kthread_should_stop()));
+
+			if (ret)
+				continue;
+
+			if (kthread_should_stop())
+				return 0;
+
+			if (!ctx->tx_frame)
+				ctx->tx_frame = cpc_hd_dequeue(&ctx->cpc_hd);
+
+			/*
+			 * Reset thread event right before transmission to prevent interrupts that
+			 * happened while the thread was already awake to wake up the thread again,
+			 * as the event is going to be handled by this iteration.
+			 */
+			atomic_set(&ctx->event_cond, 0);
+
+			ret = gb_cpc_spi_do_xfer_header(ctx);
+			if (!ret)
+				xfer_idle = false;
+		} else {
+			ret = wait_event_timeout(ctx->event_queue,
+						 (atomic_read(&ctx->event_cond) == 1 ||
+						  kthread_should_stop()),
+						 msecs_to_jiffies(CPC_SPI_INTERRUPT_MAX_WAIT_MS));
+			if (ret == 0) {
+				dev_err_once(&ctx->spi->dev, "device didn't assert interrupt in a timely manner\n");
+				continue;
+			}
+
+			atomic_set(&ctx->event_cond, 0);
+
+			if (!ctx->tx_frame && !ctx->rx_len)
+				ret = gb_cpc_spi_do_xfer_notch(ctx);
+			else
+				ret = gb_cpc_spi_do_xfer_payload(ctx);
+
+			if (!ret)
+				xfer_idle = true;
+		}
+	}
+
+	return 0;
+}
+
+static irqreturn_t gb_cpc_spi_irq_handler(int irq, void *data)
+{
+	struct cpc_spi *ctx = data;
+
+	atomic_set(&ctx->event_cond, 1);
+	wake_up(&ctx->event_queue);
+
+	return IRQ_HANDLED;
+}
+
+static int gb_cpc_spi_cport_allocate(struct gb_host_device *hd, int cport_id, unsigned long flags)
+{
+	struct cpc_spi *ctx = gb_hd_to_cpc_spi(hd);
+	struct cpc_endpoint *ep;
+
+	for (int i = 0; i < ARRAY_SIZE(ctx->cpc_hd.endpoints); i++) {
+		if (ctx->cpc_hd.endpoints[i] != NULL)
+			continue;
+
+		if (cport_id < 0)
+			cport_id = i;
+
+		ep = cpc_endpoint_alloc(cport_id, GFP_KERNEL);
+		if (!ep)
+			return -ENOMEM;
+
+		ep->cpc_hd = &ctx->cpc_hd;
+
+		ctx->cpc_hd.endpoints[i] = ep;
+		return cport_id;
+	}
+
+	return -ENOSPC;
+}
+
+static void gb_cpc_spi_cport_release(struct gb_host_device *hd, u16 cport_id)
+{
+	struct cpc_spi *ctx = gb_hd_to_cpc_spi(hd);
+	struct cpc_endpoint *ep;
+
+	for (int i = 0; i < ARRAY_SIZE(ctx->cpc_hd.endpoints); i++) {
+		ep = ctx->cpc_hd.endpoints[i];
+		if (ep && ep->id == cport_id) {
+			cpc_endpoint_release(ep);
+			ctx->cpc_hd.endpoints[i] = NULL;
+			break;
+		}
+	}
+}
+
+static int gb_cpc_spi_cport_enable(struct gb_host_device *hd, u16 cport_id,
+				   unsigned long flags)
+{
+	struct cpc_spi *ctx = gb_hd_to_cpc_spi(hd);
+	struct cpc_endpoint *ep;
+
+	ep = cpc_hd_get_endpoint(&ctx->cpc_hd, cport_id);
+	if (!ep)
+		return -ENODEV;
+
+	return cpc_endpoint_connect(ep);
+}
+
+static int gb_cpc_spi_cport_disable(struct gb_host_device *hd, u16 cport_id)
+{
+	struct cpc_spi *ctx = gb_hd_to_cpc_spi(hd);
+	struct cpc_endpoint *ep;
+
+	ep = cpc_hd_get_endpoint(&ctx->cpc_hd, cport_id);
+	if (!ep)
+		return -ENODEV;
+
+	return cpc_endpoint_disconnect(ep);
+}
+
+static int gb_cpc_spi_message_send(struct gb_host_device *hd, u16 cport_id,
+				   struct gb_message *message, gfp_t gfp_mask)
+{
+	struct cpc_spi *ctx = gb_hd_to_cpc_spi(hd);
+	struct cpc_endpoint *ep;
+	struct cpc_frame *frame;
+
+	frame = cpc_frame_alloc(message, gfp_mask);
+	if (!frame)
+		return -ENOMEM;
+
+	ep = cpc_hd_get_endpoint(&ctx->cpc_hd, cport_id);
+	if (!ep) {
+		cpc_frame_free(frame);
+		return -ENODEV;
+	}
+
+	message->hcpriv = frame;
+
+	return cpc_endpoint_frame_send(ep, frame);
+}
+
+static void gb_cpc_spi_message_cancel(struct gb_message *message)
+{
+	struct cpc_frame *frame = message->hcpriv;
+
+	frame->cancelled = true;
+}
+
+static struct gb_hd_driver gb_cpc_driver = {
+	.hd_priv_size			= sizeof(struct cpc_spi),
+	.message_send			= gb_cpc_spi_message_send,
+	.message_cancel			= gb_cpc_spi_message_cancel,
+	.cport_allocate			= gb_cpc_spi_cport_allocate,
+	.cport_release			= gb_cpc_spi_cport_release,
+	.cport_enable			= gb_cpc_spi_cport_enable,
+	.cport_disable			= gb_cpc_spi_cport_disable,
+};
+
+
+static int cpc_spi_probe(struct spi_device *spi)
+{
+	struct gb_host_device *hd;
+	struct cpc_spi *ctx;
+	int ret;
+
+	if (!spi->irq) {
+		dev_err(&spi->dev, "cannot function without IRQ, please provide one\n");
+		return -EINVAL;
+	}
+
+	hd = gb_hd_create(&gb_cpc_driver, &spi->dev,
+			  GB_CPC_SPI_MSG_SIZE_MAX, GB_CPC_SPI_NUM_CPORTS);
+	if (IS_ERR(hd))
+		return PTR_ERR(hd);
+
+	ctx = gb_hd_to_cpc_spi(hd);
+	ctx->cpc_hd.gb_hd = hd;
+	ctx->cpc_hd.wake_tx = gb_cpc_spi_wake_tx;
+
+	spi_set_drvdata(spi, ctx);
+
+	ret = gb_hd_add(hd);
+	if (ret)
+		goto err_hd_del;
+
+	ret = request_irq(spi->irq, gb_cpc_spi_irq_handler, IRQF_TRIGGER_FALLING,
+			  dev_name(&spi->dev), ctx);
+	if (ret)
+		goto err_hd_remove;
+
+	ctx->task = kthread_run(gb_cpc_spi_do_xfer_thread, ctx, "%s",
+				    dev_name(&spi->dev));
+	if (IS_ERR(ctx->task)) {
+		ret = PTR_ERR(ctx->task);
+		goto free_irq;
+	}
+
+	return 0;
+
+free_irq:
+	free_irq(spi->irq, ctx);
+err_hd_remove:
+	gb_hd_del(hd);
+err_hd_del:
+	gb_hd_put(hd);
+
+	return ret;
+}
+
+static void cpc_spi_remove(struct spi_device *spi)
+{
+	struct cpc_spi *ctx = spi_get_drvdata(spi);
+
+	kthread_stop(ctx->task);
+	free_irq(spi->irq, ctx);
+	gb_hd_del(ctx->cpc_hd.gb_hd);
+	gb_hd_put(ctx->cpc_hd.gb_hd);
+}
+
+static const struct of_device_id cpc_dt_ids[] = {
+	{ .compatible = "silabs,cpc-spi" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, cpc_dt_ids);
+
+static const struct spi_device_id cpc_spi_ids[] = {
+	{ .name = "cpc-spi" },
+	{},
+};
+MODULE_DEVICE_TABLE(spi, cpc_spi_ids);
+
+static struct spi_driver gb_cpc_spi_driver = {
+	.driver = {
+		.name = "cpc-spi",
+		.of_match_table = cpc_dt_ids,
+	},
+	.probe = cpc_spi_probe,
+	.remove = cpc_spi_remove,
+};
+
+module_spi_driver(gb_cpc_spi_driver);
+
+MODULE_DESCRIPTION("Greybus Host Driver for Silicon Labs devices using SPI");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Damien Riégel <damien.riegel@silabs.com>");
-- 
2.49.0

