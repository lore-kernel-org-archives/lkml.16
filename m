Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BE023A9BB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751452567; cv=fail; b=OQgp4bI4cfzVR0xgkCOQuGygUn2i/p+qBA5SNzNRRW7cGf0feaBgHXv9WJT0A9V1ulawxqKe1B5OdtkVMMWlHT9UwuWmsmPHo3otfYmCne2ZyFqwSMBYty21pGV7e4MFGhregE984CcuRaK05X2XDs4RiLgyMLvCcJZ8QZ8z7dI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751452567; c=relaxed/simple;
	bh=ZAOOt7ZOEyeQHz2g8gqHtb4Sx5hwQWG5ArIqFNiASXk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bYBlE8z5MuEOjNbgz4GCtaSYDxpivz9/J10DDIlq0Kqt9Wws0uU1CBy6/WleI5gf6KRffJMyBP16V5ef6bZkj+5qHEWqLDGyGP11RDfIJX2phMbhk7OXS5S+IlK8xC/LWDbEuKG6VFTPPzI9bVxeoyhWpKT4nVw80G9rp6O+ZIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=dEKMbS3p; arc=fail smtp.client-ip=40.107.92.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="dEKMbS3p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vkphTTPB9OZF5a2fQQD9amC84dVc75laH4lT8BJ6zb+9v+bYjEb8yyhNwTjlMOxcNM4HfayC+tHeGbQfMt6Tbkh7QmgY/PmvphVIXLKVmWYcXtaoxqkeFw4EFCuDxATkzItj+rNMDxz9HeeHr7HlWjNaOUhmvqmqzKMQnGfymp3bkDH4Uutf86o/4fYrROxu8F8bMl0Fv9No4ErTIdzumq5UiZcOXAz+obMSRvc/IXjt4iMZHS1Wk8zVQQmpnIr5ytPpGL8riHOe68W/wlxoT/GY/bbTq9+YlIbYkn6rsZaoRU7VXLkjIV+/C/4zz1EG2UxOWrwjE+gq9p59GCriLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAOOt7ZOEyeQHz2g8gqHtb4Sx5hwQWG5ArIqFNiASXk=;
 b=C0Pww+Blt9FcXOFjCCdLtjDP6CdqitW4lXY9IRpnf1FFWrKs31Ad8qC6t84S7u2cch6xWuKic2EZo4pQ/luHfJaSEqqZgq55rIVz24w6/oY35vjnNJqohdsKVMIBcOAQa30e8U1mmbKgiyxBWt0lZey54NgRvBrFv+b9ZOV8IglcVBScPGYoI9fNuuC4sRu7Ae8iVgC1K8FfWF2LgIpQJur/vpxML8vn9NqK6pu5z/m1nD8tr3m4wPhZnnPRotbaNdKqSR4MVzItgAAEJBFwnRgPaIFtvW6lXAN1Aw35ega0esVShEUXqFwUYlTvR8s9308bbQap0p3VqgRKtJrldg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAOOt7ZOEyeQHz2g8gqHtb4Sx5hwQWG5ArIqFNiASXk=;
 b=dEKMbS3pg/8WhiJaSqE2APCTzICbIg5xRRQ+sJnc9y+cjgKzCd8+Uhmk7ybbx6MH3RyQBf2Xbz+UB2yW0kBuDDlxM0MKDIwcBBgUvIyYLaDNq6MvyKQkd5v7VTB6kfnxj7khUmcmvk+wLGDX0+EzF6jzxFgw/LG4lfyKkjoIUw5D0rzp5VxGoUvHgMxn9Yrcs5CFIO/1SXF1DrVeuj+46p9aZe53Y+xAEAaTk/Rn59vs+dbuseSRrSc3+2ad+UE7dQiBykcU9H9r3KcjDdR/CWzNB9EJtDYnS+KDyRTDmsrBTTvYAcpG1vYXVLEnmcFBkm7lkLOeLjHR8UoZGhhUaw==
Received: from MN0PR11MB6231.namprd11.prod.outlook.com (2603:10b6:208:3c4::15)
 by PH0PR11MB4968.namprd11.prod.outlook.com (2603:10b6:510:39::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Wed, 2 Jul
 2025 10:36:00 +0000
Received: from MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4]) by MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4%6]) with mapi id 15.20.8880.029; Wed, 2 Jul 2025
 10:36:00 +0000
From: <Balamanikandan.Gunasundar@microchip.com>
To: <ada.coupriediaz@arm.com>, <admin@hifiphile.com>
CC: <claudiu.beznea@tuxon.dev>, <alexandre.belloni@bootlin.com>,
	<vigneshr@ti.com>, <richard@nod.at>, <Nicolas.Ferre@microchip.com>,
	<linux-kernel@vger.kernel.org>, <tudor.ambarus@linaro.org>,
	<linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>,
	<Balamanikandan.Gunasundar@microchip.com>
Subject: Re: mtd: rawnand: atmel: ECC error after update to kernel 6.6
Thread-Topic: mtd: rawnand: atmel: ECC error after update to kernel 6.6
Thread-Index: AQHb6dGgufFQiluSPUeN3O6j01iavLQda6UAgAE66wA=
Date: Wed, 2 Jul 2025 10:36:00 +0000
Message-ID: <c015bb20-6a57-4f63-8102-34b3d83e0f5b@microchip.com>
References:
 <CA+GyqebQnWQ3fj4Lrb4-hvzRpphuqw+jh4B9En1j2NDTNFumvQ@mail.gmail.com>
 <599c677a-ace0-41fe-b264-51de0fa7badf@arm.com>
In-Reply-To: <599c677a-ace0-41fe-b264-51de0fa7badf@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6231:EE_|PH0PR11MB4968:EE_
x-ms-office365-filtering-correlation-id: 9362b32a-76a0-4242-a8b5-08ddb9543c8f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MVp6ZkJzSUExS0R0N2dGR1JlRkYyVEhkTDdWN3pXYVI1Tk1IZWIyWmpvYWVZ?=
 =?utf-8?B?WHllSTRPWFFicllBZWJOUnBIUC9CYXc0eFFuMDd0LzNDWmZZbTQ2WUpvVFFK?=
 =?utf-8?B?KzZpNXhqREVNSkJXWHBlTmlLOGlTMlpVbVlXTHVEWU1jNUprUEdEQ2tnakNE?=
 =?utf-8?B?VEtZbGJzaGtYVEI1NktXakVFbTI2alg4NmlBMzBXTncwVUJQN21uS1ZSelhM?=
 =?utf-8?B?ODl3V3JFdDdKWStaYkFobVFqMFpxbUlpZmJEM2hIckYwdE5EYUtDb1oxZkxw?=
 =?utf-8?B?dzBZQXZ0V2lQME5PeHl6OUszRWhJQjdkR0VzQ3hPc3F1VU01TVRhbjYxOXcx?=
 =?utf-8?B?bk5DMldUTStOVGhuNDR4ZmZNSEdVZ3FoTllra1JaamR4VlY4WUFTajZ4RXE4?=
 =?utf-8?B?elVDOFArVlhxMWJ3RjZOc2c5REdCR3lPdmIvZStVR1NoOGdFT3EyM2dqYUZV?=
 =?utf-8?B?WnVZWkRNbEVNdmdiZ1FRRVQ3dnJmUHJDRVFieGNSbHpYUytYTzFscWgyWFh1?=
 =?utf-8?B?RXd3Q1Fpak5rd1BQaDZzZlBhOUNPbzlsWHp3UUdyUDZjcjlJZzllRTJ1WE9o?=
 =?utf-8?B?MzhSOWpzRmJ1YlRzMGdaYVNGbm41UTlIeUUzVGFISjUvY2hiS052YWh0M0pC?=
 =?utf-8?B?RUljWU82R2thNXpVQll4bGVuSVBRa3cyYVFTSmpQNUhVSUVYNU9xTE9HNE9T?=
 =?utf-8?B?MXhjY3AzaWNpN0YxaGZOMENzWU84OXZoUWtSQmJBWkxvSmIvTTlMZEFOdHVJ?=
 =?utf-8?B?YmhTRlczNHRzNUNlVmU5TnpEdmNVcUZjSURQOGRtYjh5NlZsdG5tOUZZNENa?=
 =?utf-8?B?LzlKcmxYNzROeGlYOG5iUnEySmowWGtPemR3VlpBc08vQVQ1ZGlqK0JoSDVP?=
 =?utf-8?B?dTZTTUtJUUJvVDZjbEJNQ0VZdzNNaldKU05ZTFg1cHJYZEQ5cUpIRTdrRjhE?=
 =?utf-8?B?RS9GaGViWmRMZHR4Um9hTEJ4UDA4U2ROL2xRM2ZxWFBYSzc3anI2ZUR6RW5C?=
 =?utf-8?B?emJ0aDA5bmdIckFXWXY2WmxOV21mOFYxdWRVTUI0SVNSeXVPeFVCb0lubkpK?=
 =?utf-8?B?T2pNU3Brb2RqL29qbUNnL2pwMkU2bS9NMXRaODcyTXdWenNnZnJaNFhXc3RU?=
 =?utf-8?B?WG40OEJuMnEvVFFiejhDbnJVQ2h5N29zQUkxOFEyWS9saW9EUjE3aGQzYVc2?=
 =?utf-8?B?aXFoUXAxTlFnTDZQWCtqTjQydzNWRkJwTDAwZ3h5c015aXFIdldDNEczOGVQ?=
 =?utf-8?B?QmlMendkSlJPMC9mWjg2NTBNMW9zUkEyZGVTaUZRYm05Zjd6cTNMUWhBdlNU?=
 =?utf-8?B?ZUtRWnZCMHQ5aCtBdUU1MGJEZDlObWhkanY3alR1cWcyVG5MSS9nc050RDVD?=
 =?utf-8?B?cElpUWhtKzdKR3VWdFV1d0ZkYlZXV1Iza3ZFOVJKQjRLVnFjZVhJVDhmUng5?=
 =?utf-8?B?REdBanlTYzV2cWhxRnl5NGNNS0ZBMlFINlduMjBkamZNSFhGR2toNEFaaVVL?=
 =?utf-8?B?aklqaURkVDZOTENLQ3JUSjhhM2V3aDBscVoxQ1p6YkgxQXZ1WnhFT0hkclpr?=
 =?utf-8?B?ejB0U1RqbHY2YjZVcG5NNnNXeHg3OGczdlNzM0hKMHVMY0ZXRHJNSzNzT1gz?=
 =?utf-8?B?T0RxZHZGLzlWTXFWZWxTZGQ1RGEzeEgreWtlcWVIY1FReHdOY1JRbThiQ0lx?=
 =?utf-8?B?cFR6L2RmRFFvd3crYUdkVTdNRHNMSEVRMlpLeThYQ3VZdnlHSW4zYUhNdmgx?=
 =?utf-8?B?SktmcDQ1eHRXNnYyZUh2SUxDd0pVUnlnRXlGMjVMYTI1R01RKysrcnlITEdS?=
 =?utf-8?B?cnd3THRKS1RKNDIzeHROcExwcC9hYjNLKy9ZRFN6TFlSZjU0U0RQa2FPK0ZE?=
 =?utf-8?B?ZGtIMU1va1RUWVZ5dXllVjllSitnK2tEYjNERmNDbW85Y3YzMUdOeFFWRjlO?=
 =?utf-8?Q?oEGNlrduS1uSF1jZt6Ns4FC10ZzujASH?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6231.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QkxHclZqYitFVjlwekpCR1BnRDRSaW42YnUydDZVUTQ1eWtCdnNHeTlic2x4?=
 =?utf-8?B?MFNLZjZoVTNpZnV6SGErcFZwb0ZIUlR3a1NabGVQRzQ5UUozbU9YdUQ1V3R1?=
 =?utf-8?B?WDB3SGVvbjdIWFpSVUVGMmduWHh1dTVTN0h0OXhKOVFBVmlKUlBPdVd0cnZm?=
 =?utf-8?B?ZnA1VVpnd2dmQkR2NzM5aHMybUw0dzFxUWxVS0pZTE1ZTGhsYS85NWtmYVNB?=
 =?utf-8?B?TnZrRUFVWW1vMlJXSk0xZEloSEhUZmlYK3BFZ3FQR3lmbjlIcTZwUG93N1A4?=
 =?utf-8?B?eW1TVTNIK0JyWkE5ZXlvdldRUlNUdVhadUZtMzl3c0RxbXBZT1VpeVFJVUFr?=
 =?utf-8?B?RzFJckR4Wk1xVEl1dk9RY2pyOUxXdHpxMmZ2cTY3SXREZjBEa2pBMWJxWVAw?=
 =?utf-8?B?ekxuRFVEODArU3RxdWMrRWNBOGFMdE8vUXlrK2NJU2piSjc2d2dHZjlHQ3JP?=
 =?utf-8?B?OUxmOGNSQnhDdDZBSDhUK0xKdktEZHF4NjBtWHE2b0dhNEZRVnM1b0lDMjNP?=
 =?utf-8?B?MDBLVTQyeGc0b3BNNEorbndRSkFIRXRjMTN3VVNtUlh6L28vSWdaQ1NqS2ls?=
 =?utf-8?B?b3BDVUQvWDVNdTZRdXVDSW1HVVVkZXBMZXRFZm1RRy9hOWd0SkJnU3FERWNY?=
 =?utf-8?B?dmljQko1VVZKbm9hL29tbG5CVjlwL3I2TUFYN29ZRG1EZ1p1bkF3K3h2Mjl2?=
 =?utf-8?B?dzRBcC81bFJQdWZwd01XN2dEUlViYmxaZFhSbEFMTUtYQ2xweDRuQzJ2cWZU?=
 =?utf-8?B?QVA3RElUT0RBWlQrQ3BQL0VxNW1KektyYTdRTmRTdW9TaU9Ebng5bXFQc243?=
 =?utf-8?B?ak9mOGoySk8vb0s0cUE5SlNteDBHbmdMSzloa05ZNHp4SVNCWDl6R05DTE1y?=
 =?utf-8?B?WDBiWTFYZld0Rm9MNFh3SkxWVGtRQ3kvUnhWeXFsMDdHOGxlVHJRcW9vNlJi?=
 =?utf-8?B?dlMyWnloWTFnVTFkUkxYcTJ1MEgvTmlGT3ZzMVNSVXZKYkRubXFoUVBnWFNQ?=
 =?utf-8?B?ek1mOWxJUmdxS1NKMlFOL1J1VHVyWTczcGE1UFBjLzBTT293cm95WVB5MjZN?=
 =?utf-8?B?bzhYc1JXU2VUVCtROFlpUURoOG8zTmZhVGUyZmF1SVRSbCtOdllmbWZ3MUlX?=
 =?utf-8?B?aGxyVmY2RlcyN09qd3c1T3lrcWtqNmdneDdsY2c5VFI5dUxHM0dnakdYUTRv?=
 =?utf-8?B?N3AyVEhZOVM4cXRqV2Rhb0U1ZnBWY2l4ZXpBc2RRalk0aXNXNXI1MUVFcEZU?=
 =?utf-8?B?NThaM0REVFgyUGkrb0hYTWpHMVBzK0NmeE8rS0JsVmFYM1NDdVJ5c3lRSjZs?=
 =?utf-8?B?MUhRSnlqUy9BK0lzSUlVbGxXUDNKVUVhT2Rnb2lQalJrR1o3ZVlZUXNMd2di?=
 =?utf-8?B?cWZCR1hxZEVNZEJCRXpnS2FNZHJIVHpaMDRKVm1NeVNNa1gwZzRVUGpwN2py?=
 =?utf-8?B?ZElmMjFxOHBNb2pTcjB6N2RaSWZqQUJDZm43Mk5tL3UrZHBxNzZkN1VJM3M5?=
 =?utf-8?B?anhGVlI4Z2VWamZKMFE1YmFPbnlzR2lUL1RoOVgwMTA4bEd0YUJaeU1ISnh5?=
 =?utf-8?B?dkU3MmQ4RCs5RVd2ZlJ5YlFKOW5QdmIvalc1NWdWUWIwN0lYR2J3V3RWejRW?=
 =?utf-8?B?S3BLaE5PWlc0QW1YQjdZSHVJTXpDR1lJc1ZiK1djQ3hkaGpGRU5sYXByT0lo?=
 =?utf-8?B?eWZPeFVobmJLZk0yUzJRYXY3a1g2NWdBY1hTLytTYnkxeDhBZWZ1eXMxeklR?=
 =?utf-8?B?Q0gwMnJ1dUVKZ0J0ekFaUWU3Q3lyL3ZRMzFMQ3NJdGdBTXl5eDMybWZVZnM3?=
 =?utf-8?B?SXRZMVdQTHg0TFRCYkJsb3BISjE2OHRyWVFGNXRPRGxHYnN3dkt2NXVQdkpq?=
 =?utf-8?B?Q3pSem1oKzNtWEFuMW84Mk8ybithZEEvRFhQZXpubDVGYkZYUTVtWTI0QTUw?=
 =?utf-8?B?SVY4ZytvZUlmOXFVRVRldzF6b0NxZlJGOVY0bUFoNDJPY2k5LzIrWUViWEN0?=
 =?utf-8?B?SEx5TFRiRzdUREt5S3ZoOXE1WVFORlkyVXIwRUg3VGJ3RzcyVFpaOWduQktF?=
 =?utf-8?B?L1ozRVQxQnArN29wbUdUVmVxRkxxc0NoblFZWFZOeXJ6emVjRnppbjVCcEIw?=
 =?utf-8?B?ck9zR2t3V3BxbDVmM3g0Wk1IOGFidnB4SE1RdjN5cnRidEFHakdtR2lSNUlT?=
 =?utf-8?Q?xNjP0OjBieyZX4GXtweo6iI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C5C7BD32D8806469434970D4FF227FB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6231.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9362b32a-76a0-4242-a8b5-08ddb9543c8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 10:36:00.0399
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UyKK4L78myowYvIJESZ5iaF1aasARm9ksTmHe4cjW7lFwlixqZOodr6jh0M3r6xaYBvszBw+fnXLJUX7ch1IIWvCsfEgaUtF+T6mWlIJpAhMdhUo/FglfnG/E5LKViLP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4968

SGksDQoNClRoYW5rcyBBZGEgZm9yIHRoZSBxdWljayBpbnZlc3RpZ2F0aW9uLiBJIHRvbyBjaGVj
a2VkIHRoZSBoaXN0b3J5IG9mIHRoZSANCmNoYW5nZS4gQXMgeW91IG1lbnRpb25lZCB0aGlzIGNv
dWxkIGhhdmUgYmVlbiBsb3N0IGluIHRoZSBwb3J0aW5nLg0KDQpUaGlzIHBhdGNoIGlzIHJlcXVp
cmVkIGZvciBTQU05eDYwLCBTQU05eDcsIFNBTTlHMjUgYXMgaXQgaXMgcmVjb21tZW5kZWQgDQpi
eSB0aGUgZGF0YXNoZWV0LiBGb3IgMTMzTUh6IHRoaXMgbXVzdCBiZSBzZXQgdG8gMiwgaW5kaWNh
dGluZyB0aGUgc2V0dXAgDQp0aW1lIGFzIDMgY2xvY2sgY3ljbGVzLiBJIHdpbGwgaW52ZXN0aWdh
dGUgdGhpcyBtb3JlIGFuZCBzZW5kIGEgcGF0Y2ggYXNhcC4NCg0KSSB3aWxsIGFsc28gdHJ5IHRv
IGdldCBtb3JlIG1pc3NpbmcgZGV0YWlscyBpbiB0aGUgZGF0YXNoZWV0Lg0KDQpUaGFua3MsDQpC
YWxhDQoNCk9uIDAxLzA3LzI1IDk6MTggcG0sIEFkYSBDb3VwcmllIERpYXogd3JvdGU6DQo+IEVY
VEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxl
c3MgeW91IGtub3cgDQo+IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEhpLA0KPiANCj4gSSdt
IG5vdCByZWFsbHkgaW52b2x2ZWQgaW4gdGhpcyBwYXJ0IG9mIHRoZSBrZXJuZWwgb3IgZHJpdmVy
cywNCj4gYnV0IEkgdG9vayBzb21lIHRpbWUgdG8gbG9vayBpbnRvIGl0LiBIb3BlZnVsbHkgSSdt
IG5vdCBjb21wbGV0ZWx5DQo+IG1pc3Npbmcgc29tZXRoaW5nICENCj4gDQo+IE9uIDMwLzA2LzIw
MjUgMTU6MzgsIFppeHVuIExJIHdyb3RlOg0KPj4gSGksDQo+Pg0KPj4gQWZ0ZXIgdXBkYXRpbmcg
b3VyIFNBTTlHMjUgZGV2aWNlIGZyb20ga2VybmVsIDMuMTYgdG8gNi42LCB3ZSBoYXZlDQo+PiBl
bmNvdW50ZXJlZCBVQklGUyBmYWlsdXJlcyB3aXRoIEVDQyBlcnJvcnMNCj4+DQo+PiBbLi4uXQ0K
Pj4NCj4+IEFmdGVyIHNvbWUgZGlhZ25vc3RpY3MsIEkgdXNlZCBkZXZtZW0yIHRvIGNvbXBhcmUg
U01DIGFuZCBQTUVDQw0KPj4gcmVnaXN0ZXJzIGJldHdlZW4gdGhlIHR3byBrZXJuZWxzLiBBbGwg
dmFsdWVzIG1hdGNoIGV4Y2VwdCBmb3IgdGhlDQo+PiBQTUVDQ19DTEsgcmVnaXN0ZXIsIHdoaWNo
IGlzIDIgaW4ga2VybmVsIDMuMTYgWzFdIGFuZCAwIGluIGtlcm5lbCA2LjYNCj4+IFsyXS4gSXQg
YXBwZWFycyB0aGUgY2xvY2sgc2V0dGluZyBpcyBtaXNzaW5nIHNpbmNlIHRoZSBrZXJuZWwgNC4x
NA0KPj4gcmVmYWN0b3IuDQo+Pg0KPj4gQWNjb3JkaW5nIHRvIHRoZSBTQU05RzI1IGRhdGFzaGVl
dCB0aGlzIGZpZWxkIG11c3QgYmUgcHJvZ3JhbW1lZCB3aXRoIDIuDQo+Pg0KPj4gTWFudWFsbHkg
c2V0dGluZyBQTUVDQ19DTEsgdG8gMiAoZGV2bWVtMiAweGZmZmZlMDEwIHcgMikgcmVzb2x2ZXMg
dGhlDQo+PiBuYW5kdGVzdCBpc3N1ZS4NCj4+DQo+PiBJcyB0aGUgY2xvY2sgc2V0dGluZyBtb3Zl
ZCB0byBlbHNld2hlcmUgYWZ0ZXIgdGhlIHJlZmFjdG9yID8NCj4gDQo+IEFzIGZhciBhcyBJIGNh
biB0ZWxsLCB0aGUgc2V0dGluZyBvZiB0aGUgKlBNRUNDX0NMSyogd2FzIGxvc3QgaW4NCj4gZjg4
ZmMxMjJjYzM0IChtdGQ6IG5hbmQ6IENsZWFudXAvcmV3b3JrIHRoZSBhdG1lbF9uYW5kIGRyaXZl
ciksDQo+IHdoaWNoIHdhcyBtZXJnZWQgZm9yIDQuMTIuDQo+IA0KPiBUaGUgcmVnaXN0ZXIgb2Zm
c2V0IGFuZCB2YWx1ZXMgYXJlwqAgcGFydCBvZiB0aGUgZGVmaW5lcyBpdCBpbnRyb2R1Y2VzDQo+
IGJ1dCBhcmUgdW51c2VkLCBzbyB0aGV5IG1pZ2h0IGhhdmUgYmVlbiBmb3Jnb3R0ZW4uDQo+IEkg
Y291bGRuJ3QgZmluZCBhbm90aGVyIHBsYWNlIHdoZXJlIHRoaXMgd2FzIGRvbmUsIGFuZCBJIHRo
aW5rIGl0IHdvdWxkDQo+IG1ha2Ugc2Vuc2UgZm9yIGl0IHRvIGJlIGRvbmUgaGVyZSBzdGlsbC4N
Cj4gDQo+IFRoZSB0cmlja3kgcGFydCBpcyB0aGF0IG5vdyB0aGUgZHJpdmVyIGhhbmRsZXMgb3Ro
ZXIgUE1FQ0NzIHRoYXQgZG8gbm90IA0KPiBoYXZlDQo+IHRoaXMgcmVnaXN0ZXIgYXQgYWxsIGlu
IHRoZWlyIGRhdGFzaGVldHMgOg0KPiAgwqAtIFNBTUE1RDIgc2VyaWVzWzNdLCBwYWdlIDcxMywg
MzYuMjAgUmVnaXN0ZXIgc3VtbWFyeSA6DQo+ICDCoMKgwqDCoCAweDgwICgweDEwIG9mZnNldCkg
aXMgbWFya2VkIHJlc2VydmVkLA0KPiAgwqAtIFNBTUE1RDQgc2VyaWVzWzRdLCBwYWdlIDUxMiwg
VGFibGUgMzAtMjAgOg0KPiAgwqDCoMKgwqAgMHgwODAgKDB4MTAgb2Zmc2V0KSBpcyBtYXJrZWQg
cmVzZXJ2ZWQsDQo+IA0KPiBTbyBJIHRoaW5rIGl0J3MgYmVzdCBub3QgdG8gYWRkIHRoaXMgd3Jp
dGUgYmFjayBmb3IgYWxsIGNhc2VzLg0KPiANCj4gSSBhbHNvIGNoZWNrZWQsIGFzIHNvbWUgb3Ro
ZXIgU29DcycgUE1FQ0NzIGFyZSBtYXJrZWQgY29tcGF0aWJsZSB3aXRoDQo+IHRoZSBvbmUgdXNl
ZCBpbiB5b3VyIFNBTTlHMjUgKGBhdG1lbCxhdDkxc2FtOWc0NS1wbWVjY2ApIDoNCj4gIMKgLSBT
QU05eDYwIHNlcmllc1s1XSwgcGFnZSAyNTYsIDIxLjYgUmVnaXN0ZXIgU3VtbWFyeSA6DQo+ICDC
oMKgwqDCoCAweDEwIG9mZnNldCBoYXMgUE1FQ0NfQ0xLIHByZXNlbnQsIHJlY29tbWVuZHMgc2V0
dGluZyB0byAyIGF0IDEzM01IeiwNCj4gIMKgLSBTQU05eDcgc2VyaWVzWzZdLCBwYWdlIDI2Mywg
MjEuNiBSZWdpc3RlciBTdW1tYXJ5IDoNCj4gIMKgwqDCoMKgIDB4MTAgb2Zmc2V0IGhhcyBQTUVD
Q19DTEsgcHJlc2VudCwgcmVjY29tZW5kcyBzZXR0aW5nIHRvIDIgYXQgMTMzTUh6Lg0KPiANCj4g
U28gaXQgc2hvdWxkIGJlIHNhZmUgdG8gd3JpdGUgMiB0byB0aGlzIHJlZ2lzdGVyIGZvciBhbGwg
dGhvc2UgbWF0Y2hpbmcNCj4gdGhpcyAvY29tcGF0aWJsZS8gc3RyaW5nLg0KPiANCj4gVGhlIGRh
dGFzaGVldCBpdHNlbGYgaXMgbm90IGNsZWFyIGFzIHRvIHdoYXQgdG8gZG8gZm9yIG90aGVyIE1D
SyANCj4gZnJlcXVlbmNpZXMsDQo+IHRob3VnaCBhcyAxMzNNSHogaXMgdGhlIGhpZ2hlc3Qgc3Vw
cG9ydGVkIGZyZXF1ZW5jeSBhbmQgaXQgd29ya2VkIGJlZm9yZSwNCj4gaG9wZWZ1bGx5IGl0IGp1
c3QgbWVhbnMgYSBjeWNsZSBvciB0d28gb2YgdXNlbGVzcyBkZWxheSBhdCB3b3JzZSwNCj4gYnV0
IGF0IGxlYXN0IGl0IGtlZXBzIGl0IHNpbXBsZS4NCj4gDQo+IEkndmUgd3JpdHRlbiBhIHNtYWxs
IHBhdGNoIGJlbG93IHRoYXQgSSB0aGluayBzaG91bGQgZml4IHRoZSBpc3N1ZSwgYnV0IA0KPiBh
Z2Fpbg0KPiBJIGRvbid0IGtub3cgaWYgdGhhdCdzIHVwc3RyZWFtYWJsZSBhcy1pcy4NCj4gDQo+
PiBCZXN0IHJlZ2FyZHMsDQo+PiBaaXh1biBMSQ0KPj4NCj4+IFsxXSANCj4+IGh0dHBzOi8vZ2l0
aHViLmNvbS90b3J2YWxkcy9saW51eC9ibG9iLzE5NTgzY2E1ODRkNmY1NzQzODRlMTdmZTc2MTNk
ZmFlYWRjZGM0YTYvZHJpdmVycy9tdGQvbmFuZC9hdG1lbF9uYW5kLmMjTDEwNTgNCj4+IFsyXSAN
Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9ibG9iL2ZmYzI1MzI2M2ExMzc1
YTY1ZmE2YzlmNjJhODkzZTk3NjdmYmViZmEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYXRtZWwvcG1l
Y2MuYyNMNzcyDQo+Pg0KPiBIb3BlZnVsbHkgdGhhdCBjYW4gaGVscCAhDQo+IEJlc3QgcmVnYXJk
cywNCj4gQWRhDQo+IA0KPiANCj4gWzNdOiANCj4gaHR0cHM6Ly93dzEubWljcm9jaGlwLmNvbS9k
b3dubG9hZHMvZW4vRGV2aWNlRG9jL1NBTUE1RDItU2VyaWVzLURhdGEtU2hlZXQtRFM2MDAwMTQ3
NkMucGRmDQo+IFs0XTogDQo+IGh0dHBzOi8vd3cxLm1pY3JvY2hpcC5jb20vZG93bmxvYWRzL2Fl
bURvY3VtZW50cy9kb2N1bWVudHMvTVBVMzIvUHJvZHVjdERvY3VtZW50cy9EYXRhU2hlZXRzL1NB
TUE1RDQtU2VyaWVzLURhdGEtU2hlZXQtRFM2MDAwMTUyNS5wZGYNCj4gWzVdOiANCj4gaHR0cHM6
Ly93dzEubWljcm9jaGlwLmNvbS9kb3dubG9hZHMvYWVtRG9jdW1lbnRzL2RvY3VtZW50cy9NUFUz
Mi9Qcm9kdWN0RG9jdW1lbnRzL0RhdGFTaGVldHMvU0FNOVg2MC1EYXRhLVNoZWV0LURTNjAwMDE1
NzkucGRmDQo+IFs2XTogDQo+IGh0dHBzOi8vd3cxLm1pY3JvY2hpcC5jb20vZG93bmxvYWRzL2Fl
bURvY3VtZW50cy9kb2N1bWVudHMvTVBVMzIvUHJvZHVjdERvY3VtZW50cy9EYXRhU2hlZXRzL1NB
TTlYNy1TZXJpZXMtRGF0YS1TaGVldC1EUzYwMDAxODEzLnBkZg0KPiANCj4gLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tID44IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2F0bWVsL3BtZWNjLmMgDQo+IGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvYXRtZWwvcG1lY2MuYw0KPiBpbmRleCAzYzdkZWUxYmUyMWQuLmNkOTZiNDRmM2Yz
MCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYXRtZWwvcG1lY2MuYw0KPiAr
KysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9hdG1lbC9wbWVjYy5jDQo+IEBAIC0xNDMsNiArMTQz
LDcgQEAgc3RydWN0IGF0bWVsX3BtZWNjX2NhcHMgew0KPiAgwqDCoMKgwqDCoMKgIGludCBuc3Ry
ZW5ndGhzOw0KPiAgwqDCoMKgwqDCoMKgIGludCBlbF9vZmZzZXQ7DQo+ICDCoMKgwqDCoMKgwqAg
Ym9vbCBjb3JyZWN0X2VyYXNlZF9jaHVua3M7DQo+ICvCoMKgwqDCoMKgwqAgYm9vbCBuZWVkX2Ns
a19jb25maWc7DQo+ICDCoH07DQo+IA0KPiAgwqBzdHJ1Y3QgYXRtZWxfcG1lY2Mgew0KPiBAQCAt
Nzg3LDYgKzc4OCw5IEBAIGludCBhdG1lbF9wbWVjY19lbmFibGUoc3RydWN0IGF0bWVsX3BtZWNj
X3VzZXIgDQo+ICp1c2VyLCBpbnQgb3ApDQo+ICDCoMKgwqDCoMKgwqAgd3JpdGVsKFBNRUNDX0NU
UkxfRU5BQkxFLCBwbWVjYy0+cmVncy5iYXNlICsgQVRNRUxfUE1FQ0NfQ1RSTCk7DQo+ICDCoMKg
wqDCoMKgwqAgd3JpdGVsKFBNRUNDX0NUUkxfREFUQSwgcG1lY2MtPnJlZ3MuYmFzZSArIEFUTUVM
X1BNRUNDX0NUUkwpOw0KPiANCj4gK8KgwqDCoMKgwqDCoCBpZiAocG1lY2MtPmNhcHMtPm5lZWRf
Y2xrX2NvbmZpZykNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd3JpdGVsKFBNRUND
X0NMS18xMzNNSFosIHBtZWNjLT5yZWdzLmJhc2UgKyANCj4gQVRNRUxfUE1FQ0NfQ0xLKTsNCj4g
Kw0KPiAgwqDCoMKgwqDCoMKgIHJldHVybiAwOw0KPiAgwqB9DQo+ICDCoEVYUE9SVF9TWU1CT0xf
R1BMKGF0bWVsX3BtZWNjX2VuYWJsZSk7DQo+IEBAIC04OTYsNiArOTAwLDcgQEAgc3RhdGljIHN0
cnVjdCBhdG1lbF9wbWVjY19jYXBzIGF0OTFzYW05ZzQ1X2NhcHMgPSB7DQo+ICDCoMKgwqDCoMKg
wqAgLnN0cmVuZ3RocyA9IGF0bWVsX3BtZWNjX3N0cmVuZ3RocywNCj4gIMKgwqDCoMKgwqDCoCAu
bnN0cmVuZ3RocyA9IDUsDQo+ICDCoMKgwqDCoMKgwqAgLmVsX29mZnNldCA9IDB4OGMsDQo+ICvC
oMKgwqDCoMKgwqAgLm5lZWRfY2xrX2NvbmZpZyA9IHRydWUsDQo+ICDCoH07DQo+IA0KPiAgwqBz
dGF0aWMgc3RydWN0IGF0bWVsX3BtZWNjX2NhcHMgc2FtYTVkNF9jYXBzID0gew0KPiANCj4gDQoN
Cg==
