Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010011.outbound.protection.outlook.com [52.101.69.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FB0158874;
	Thu, 19 Jun 2025 02:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750299543; cv=fail; b=Pze9IQeCQFm1eMHGfggKEuG3wNDbcexQ14MUyHu/7FQThNXAU76LXQJejcJA2airu6IGVz+MxJGu/vwl9vHkpL+EjfNNY9ix1VwIyVVZBy9hOy9JgZD9z60v7gnpSQ/TX3I/VZITf7fnbvLKw0X+bdInHEIiXFqTh64ipnBbUnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750299543; c=relaxed/simple;
	bh=qbmcI/ElzKuHbMWmkp1YwSCIEPGzXls6DmSV2quY/9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ub/0wy2YcYyTUR9lTydLkrAJ/WvYtS8cg6wv7rlxVHPsupsco01EnXrZ4arurh4F74Bfbw1mECoh7YCtjj7irGXDJxXyZqySP8A8MJ9Q+at+qaGInBNGzRitqmusWJSOcwd2+YYfQ7dqA0A+cpgaPK61jQkMfReqP9N9wiDW45I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kIXrFbvY; arc=fail smtp.client-ip=52.101.69.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kIXrFbvY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUyv4Cct5ht6duEv5+c+DuQMAKh2Ri2gm4B/AtOvGrLxa2q3Piu3ifMYwkeWpMRnFFSwMnpvnAbk5rr4ilJ8OICM3tLrT+f2VAElAijO9xni8ij7qM6gAsVmnDAaTsQS1I6ffd7x/M3MYUaJQlB9++FgUgREiRLZVdvTlDcD1E9NEljPCOBt1A2mTbniU1T4g3EsDNhUFGHmYYolGZbwcBzbZ2/2fEF1J0oWRwmr0A3UIZ+ieP0hCLR+I5Of7dBntYA+Jh4qN3SjAcqWklZ7VW6V/W+oC9w2jrGp+t+yXU8fvPbEEQxaq5DLBpsaB865LbWsuIpO0L4betM3f5Lxbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDaXdl4pOzJ6zg92NsSZmWErqhG5a5ymLn3xuEMbuAg=;
 b=jRjMCxYSvDT4j1JE809XaZnCHI0Xpu6jJ2SRB/dPsFyJdQsahWj+EY6NwZ6CdbXC5DsWRqmLEoliCa5KT4n2JlVmbAe39U+avn+fYuyZPyCfQ1ZZeVy8v0ao9Qkl3pX4GnvrXFiWTAz2DL4ViRF02P5zYmmCeBv3TyCy5Etm7KDV99EokX/d2ZliUCPTYBJTJbnH/EESLZL+XUpnrnuWG2bqavGN767fEn0rQZsllP59/QlmOISRxTlmg10TNnKZETrP1mf7TpFRt9Xx7cS6Lgioz/yYhPOKPzYzU3eRdB4xlHwijRN23j8zyuhK0n/K2LDUkfZMkkyf4Q0FFt+iDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDaXdl4pOzJ6zg92NsSZmWErqhG5a5ymLn3xuEMbuAg=;
 b=kIXrFbvYt5KoIdd6ULPZMgQ5lpzlf0WWGVX/IQrEKrZLFesLwMw8jxxAizFZthgLPbPoY2U2/lJh0P9XbOvkr1V+akI15HrkBDbDstgGYb4ARxPgLoTRQDHTX9T0/F4r5nmo9Lyfydk7SSGKVnLKPjwPYmWoPDPM5bphyuDihNkHAVHNWERmIu1x/r+GMhW++fGZwUVpWVr5r8Ym7SZR5FcujOjj/1/iR0XoSEENxFqKsWRPs/wawjvIy0BJCKb4q9AwUb9+tL42jJ1M2+UcEXHKJz6T6nmp0NiVZEgT6LmZDtOLsN+nLL7LlC3XBCqeI896bLXqcYm/vi6dLZPtUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10163.eurprd04.prod.outlook.com (2603:10a6:800:245::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 02:18:55 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.027; Thu, 19 Jun 2025
 02:18:55 +0000
Date: Wed, 18 Jun 2025 22:18:48 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jorge Marques <gastmaier@gmail.com>
Cc: Jorge Marques <jorge.marques@analog.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] i3c: master: Add driver for Analog Devices I3C
 Controller IP
Message-ID: <aFNziEj7j31xy/mY@lizhi-Precision-Tower-5810>
References: <20250618-adi-i3c-master-v3-0-e66170a6cb95@analog.com>
 <20250618-adi-i3c-master-v3-2-e66170a6cb95@analog.com>
 <aFMWSpmXGlk7kjfe@lizhi-Precision-Tower-5810>
 <j7chefh364hvw5l3g6dmij45d7ysze23ydruanjnv5jlfykq24@msvelo5g3tm4>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <j7chefh364hvw5l3g6dmij45d7ysze23ydruanjnv5jlfykq24@msvelo5g3tm4>
X-ClientProxiedBy: PH0P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::20) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10163:EE_
X-MS-Office365-Filtering-Correlation-Id: 80a4a1f4-5eb0-4f8d-4eac-08ddaed7a44b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?akt3SHlWa2U0RjBOdzBUczZ0WkxZZTdnQ1dxbFJXMmhVUzRRNk5Jb3g2c3VB?=
 =?utf-8?B?NGxITU8zaVlSMUtWU3l5OFRaV0t0bHJwSC8zYWFVQTFuWmtJZ1JIY3BmdEgw?=
 =?utf-8?B?dVBEVTkwanJDQ1ZDd3pIQThsT3BTdlBXSDR1a0wvaVRJc0ZDaVljdFV1THZK?=
 =?utf-8?B?NWtjTHNWelpjblVJRjEwT2t4MG9zQzRIM29uNUhlcy9lemtJa1lpTk00N3VJ?=
 =?utf-8?B?RGVEUkxqbHBobUt4a0U4N0FRc1NZYTlPMDJGcVhJVXNLZy95dUJHYzhZUyt6?=
 =?utf-8?B?Q25pb213dHhoU2w1MTlJa1RQMXEvY3VvTHU0eVk4MjFISDhFVzZyYVlMSVZ2?=
 =?utf-8?B?UUpCV0Nkek9WMWwwdjdWU3FQYkMySkVRTFpTL0tJV1p5bmF1cCtwbnB3OHFs?=
 =?utf-8?B?Vnc3KzRSZXd2OXRvdFA3VGRITjBTKzJvR1ArU2RmK0U5UEovMU4xQ084YUQx?=
 =?utf-8?B?ZDQrSkpTS1ZoSzIyZVhPdFRqN21KMFZSN0pVMUcwejdjT2hEWC9FWU5Vb3RS?=
 =?utf-8?B?aHRQYjRoSWpYTUxBQWk1U2tRcXppNVlEVUFlZGM1RG8ySjZZZ2R2bTFOM2VU?=
 =?utf-8?B?Z1gvUFIvYlRXaC9zUlhGRFJ3ZDlPRHNsbHZ3RkNZYlZrUmp4VG9MelZBUHZ5?=
 =?utf-8?B?RThPWFRFWjBZa1cvUWZvRURobUVHNlFyRlVPNEhTb2VCaGdqb2Nya1huZWNq?=
 =?utf-8?B?NWIvVmQ4ZFduOUVUNGp6R1hSUzZ1UURQSW55aDM5VnpMdTVja3Z4THEzYWZF?=
 =?utf-8?B?QjJWYmxCQjNiaEdNU3c1SmRweit2SUhNQ1pQejFSNDJtY3NpS2JtMlBhVGRM?=
 =?utf-8?B?c3BwQ0thMVBhSmZhQ3B5bVpCb2hpc003bE5UcnVLQ24xRkhjV01LdzJvSjVo?=
 =?utf-8?B?Q2FtU0JkYkhSUnhnK0thTER6by82dE9DNkJRVzFTZnk3YStrM0IxYTdCLzZn?=
 =?utf-8?B?Y2NSeVRZbVlEWm1yUlVSbjFvOXJXaUtMSmlqa0orOXRiQXdrQnBZd3FIRkJs?=
 =?utf-8?B?MGp1T05zcVIvMmFSMERscnk0VjI1MEZraXJPMnRWOVFVWndoNkoweDdPSWo3?=
 =?utf-8?B?ZXhiQXRLWEgzdHBmaUJqVlV2OWtjdUZza0grZDc2Szg4eFJWNlZVZzB1azlW?=
 =?utf-8?B?V1doNFVWc2xVWktkdk5DdTgxdWdlVmZBK0JJZFgzWnl5eTg3TzBZUjBNYytq?=
 =?utf-8?B?cmYvWWFFVFFyU253THIzRDJWRllDbUorMmRONXZwNGhkWTAwaktsUERlaWYr?=
 =?utf-8?B?WnNYUU1rTk9aMkpWWVBEZlR3SWU0WXkxVTJwWE8rdVc3K2V0NXdMM1ozQmxH?=
 =?utf-8?B?M25lZUE1QjB0VVpzcmR4a05lQ0gza0gwRFViOEo4Y3ZaN2hEWEsydnZNc25x?=
 =?utf-8?B?ai9CejRUUk4vREg4SmVBdGh4RGw4ZSt3dEU4OXBUWDhmTDVaMnBYN1ZaMHVR?=
 =?utf-8?B?a0FadDA3MS9RM0s2WnhDWGp2VE9ROXdZRlhyWEV2WDJCdmlZOTljUm9wM0Zj?=
 =?utf-8?B?dmdlZWRLK0JTREV1di9OTGs0Yk4yaytHMFhSWm5kLzRFRllKTjV6eXZWU0Fh?=
 =?utf-8?B?djJmU3Y2WDBpRkZVZkhvZllrMWc0TW5UNllWM3N4cmlNVzBsSnkxQ1p5YkJK?=
 =?utf-8?B?bGZqblVOQmZraWFSVFp4UmFLYlIvOGVzeUVucGxMS1Y2UVFuWW8raGx3dW9F?=
 =?utf-8?B?YnA0aTQwYU8xbmc0NzF4NlRIcFRzalF0T0JJaTdrdkJRNXdqVHp3bXl2VFIr?=
 =?utf-8?B?elB6eXBaZlRJRFUwS0tJWVh1U2pjSk5WTk9ZQnlXR1RBOTR4LytveVRQWnN6?=
 =?utf-8?B?aHZoYjRzRWh1TVUrUXdvaFVvSDFTR1NRam8yRC9JV2ZPQXFqOStLVEJmdC9x?=
 =?utf-8?B?dTJrLy92dXRCL09PNHcyNjUwQXlkdXVIeStRQWlJWjI4NklIZ0NGOWhsUWxv?=
 =?utf-8?Q?88srEdM6A70=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWJkMmNBQ1dSQ2ZZeVFqWmlYMFZReEdWVXVaNjRNM3pmWlZIQThoSWp0cERR?=
 =?utf-8?B?MGU5c2h5WVNJNlBMcjNFUDVoYnlCOHZiRVBzYUVBS1ordzdRaFRKTnVGdERy?=
 =?utf-8?B?aUpNcXRBU0Roc1BJa2Q4b3BENTBQbGphdFJpajV0UW4rTk1JQTdFRUdqQTd5?=
 =?utf-8?B?dm9ENmtKc3h3aThkMVNzb2V0dEs3YXZqZm1kWEMxT1VxMVBLM2Niem1XN0F2?=
 =?utf-8?B?eEVCdVkwY0RXQnZHY1lQNFhzb2ZJdVFKWlBYOW5zQndRTXRNM0RJTHVkb2Z4?=
 =?utf-8?B?MTBtVDZuYjRyMExDUlRHSHFxWGd5bUhYcWZmMCtHeWlhMzRtc0FGZEMyS0J2?=
 =?utf-8?B?ZW50cmxiRm9uQVhpWkdQeGw0and1VTk3K2h3alE1TUtwb0RWeGcycEhnNWk4?=
 =?utf-8?B?VXFUc1IxeVZ6c1FFaDN0UHYvamNobGlSQ2VRV2E4UmQvK1puWTN6TVZFUDFM?=
 =?utf-8?B?Uy8reEF1bEZpZllkRncvbmZhMnViODNmZUJRaTRFSTNCNSt0T21RbFdtWjJJ?=
 =?utf-8?B?WXY5M2lyTVBRZEI1Q3oveDlUQW12SEZ6eVljckRHZExDbWYwYjhmZnBsUFNR?=
 =?utf-8?B?aVk3ZmtrM09qZEM5MWFJSTFUUmRCYnJCbkM0ck5qaG1JWHlVN2NuT1hKR1F0?=
 =?utf-8?B?RDd2TDRDUUFic0NJV25yRjJydVZjMFRyVWpMZkU3bFBGazlXcFptUVdRemg4?=
 =?utf-8?B?S3dUSlI3dWNRbjJmN2lRd1o1NmY3azEvbjBHSTBwMGNUcTY3cVRYaVFlNHVH?=
 =?utf-8?B?QThCcUxncXBNU2RCRWVycWRpS2FDcDVQcUovV3YzNkczd0JhazR0enJUZnBL?=
 =?utf-8?B?UGtDZUZjZ2ZIanBCdkdUMm9vQkZzREYwQ3FMcjFCb1JCKy9KUzgvdFh5Vmlo?=
 =?utf-8?B?czlpOEJ5ZzhncEt1KzBKQ1dKdHBXUU1iNWtPbitta1NwMkxpWkg0MmxqK0k1?=
 =?utf-8?B?S3lVN2RwUm5tamtTVWlPNjJSN1d4eldncU1wcVVCUmFkalNiZ2d6ajJpTGRM?=
 =?utf-8?B?L2NFRG0reDVKc0hzelFZWFVwMXJGN1Y5aVYreTMvV00zbENORmxzdGhQaEw2?=
 =?utf-8?B?YUNSUDhySC8rcExkSVRnOEdEeTZaUEJnd1VVT0Y4SlZyRHhjTEthckpwVHZq?=
 =?utf-8?B?UWI0MFJKeFNZd0pmNUxyb0RoV3o3RDNUdTIyQlk1TTcwbjJoMHMrMStybnVn?=
 =?utf-8?B?YWJOOWJKanJDTkVwUzNGdUN4ZmFYWnlFdWxKNnQreVdldmprMmJ3bjFYZ1M5?=
 =?utf-8?B?UStEZndEbDkxY1JvMExDVGFFeklkNXZON0lFd0szdHhsVzlLazlrT29haXov?=
 =?utf-8?B?cUVGY0ZZL1hOZHZHWFUzR0E5Tk8weTZvQ0xQdENseEhCOXAydW1SK3NpMWNj?=
 =?utf-8?B?NUNoZHBtU2pYS3hoQitPYWZyb2pTVGZNc2QxR01TV3F2eUhLWm1ZeVJyYVF4?=
 =?utf-8?B?T2FmbGtLODl0cEhGQlA4WURaVWV3dGp2cGF2Um9TTXRidEpTUVFhVk5tbG5O?=
 =?utf-8?B?eFNqNE5DWFhsZWZmRFl1Z0htWXVPL0xXOVlsZEVFM3N6VDFzSkpEaFRheWRT?=
 =?utf-8?B?dk4wMyticm8vYnVsNElVY1h4VVZoYlNmY21XZ04wQ1FiY3FHV2t3TDJWSEZO?=
 =?utf-8?B?TXdNODByOStWcEZFQTJHMGJLZ1N3b2p1MFhMZ2poRElFS1NsQ3o5bXU4MTFv?=
 =?utf-8?B?YW1KL0c4bnd6ellpc2dlbm1tbHV0VXcwR1Y3RTlDZDFxaXhQcUk4YUZnWHFL?=
 =?utf-8?B?KzBkQnoxTFdkc2ZqMFJ3SGpNd25xRVJ3UlA3MzJyT3RRRC83ZEpYdURCWlk2?=
 =?utf-8?B?dHVqbGpmcnFVQk5GMHFhL3oyTTNDMjd3MnhXNjQ1ZXpDbkgxK2NRM2hhd1RO?=
 =?utf-8?B?b0wza3lZTHp1Y0ZDVDltSWU2bHZEVG9pb0VwQ2k4MURsQWRiR2toNFo3UzAr?=
 =?utf-8?B?aFdHamM1VWowU1kzZ1BaMGJCV2FwRzlScEQ3MTlWYkdQYlRKN0F5QmxzTWkx?=
 =?utf-8?B?WXRKVUk2YTBMMkhMRlB3RlRvT0J1cTEveWF0WWlLNlltMVVtRE1vdEE0eldq?=
 =?utf-8?B?WmZjRWNQWmNzY3lNOHVUTUpKbFRCTGlrVU9tbEx2K0NmeThWSDE4TUVJV3Za?=
 =?utf-8?Q?vzZlQ97+O4rhLaqvn3jDays7g?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80a4a1f4-5eb0-4f8d-4eac-08ddaed7a44b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 02:18:55.8030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bYTv1yQqDAlfCYg9yZd3rQPa5f34axZofrC2qTOh3vOmxiiRAurUVrJBqruMfpEhF3vDHdG7cEMWkd4MhgZd+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10163

On Thu, Jun 19, 2025 at 12:17:26AM +0200, Jorge Marques wrote:
> On Wed, Jun 18, 2025 at 03:40:58PM -0400, Frank Li wrote:
> > On Wed, Jun 18, 2025 at 09:16:44AM +0200, Jorge Marques wrote:
> > > Add support for Analog Devices I3C Controller IP, an AXI-interfaced IP
> > > core that supports I3C and I2C devices, multiple speed-grades and
> > > I3C IBIs.
> > >
> > > Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> > > ---
> > >  MAINTAINERS                         |    1 +
> > >  drivers/i3c/master/Kconfig          |   11 +
> > >  drivers/i3c/master/Makefile         |    1 +
> > >  drivers/i3c/master/adi-i3c-master.c | 1026 +++++++++++++++++++++++++++++++++++
> > >  4 files changed, 1039 insertions(+)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 6f56e17dcecf902c6812827c1ec3e067c65e9894..9eb5b6c327590725d1641fd4b73e48fc1d1a3954 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -11247,6 +11247,7 @@ I3C DRIVER FOR ANALOG DEVICES I3C CONTROLLER IP
> > >  M:	Jorge Marques <jorge.marques@analog.com>
> > >  S:	Maintained
> > >  F:	Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> > > +F:	drivers/i3c/master/adi-i3c-master.c
> > >
> > >  I3C DRIVER FOR CADENCE I3C MASTER IP
> > >  M:	Przemysław Gaj <pgaj@cadence.com>
> > > diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
> > > index 7b30db3253af9d5c6aee6544c060e491bfbeb643..328b7145cdefa20e708ebfa3383e849ce51c5a71 100644
> > > --- a/drivers/i3c/master/Kconfig
> > > +++ b/drivers/i3c/master/Kconfig
> > > @@ -1,4 +1,15 @@
> > >  # SPDX-License-Identifier: GPL-2.0-only
> > > +config ADI_I3C_MASTER
> > > +	tristate "Analog Devices I3C master driver"
> > > +	depends on HAS_IOMEM
> > > +	help
> > > +	  Support for Analog Devices I3C Controller IP, an AXI-interfaced IP
> > > +	  core that supports I3C and I2C devices, multiple speed-grades and
> > > +	  I3C IBIs.
> > > +
> > > +	  This driver can also be built as a module.  If so, the module
> > > +	  will be called adi-i3c-master.
> > > +
> > >  config CDNS_I3C_MASTER
> > >  	tristate "Cadence I3C master driver"
> > >  	depends on HAS_IOMEM
> > > diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile
> > > index 3e97960160bc85e5eaf2966ec0c3fae458c2711e..6cc4f4b73e7bdc206b68c750390f9c3cc2ccb199 100644
> > > --- a/drivers/i3c/master/Makefile
> > > +++ b/drivers/i3c/master/Makefile
> > > @@ -1,4 +1,5 @@
> > >  # SPDX-License-Identifier: GPL-2.0-only
> > > +obj-$(CONFIG_ADI_I3C_MASTER)		+= adi-i3c-master.o
> > >  obj-$(CONFIG_CDNS_I3C_MASTER)		+= i3c-master-cdns.o
> > >  obj-$(CONFIG_DW_I3C_MASTER)		+= dw-i3c-master.o
> > >  obj-$(CONFIG_AST2600_I3C_MASTER)	+= ast2600-i3c-master.o
> > > diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..d4e0756efec9588383ac55ca9ea9228368ce767d
> > > --- /dev/null
> > > +++ b/drivers/i3c/master/adi-i3c-master.c
> > > @@ -0,0 +1,1026 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * I3C Controller driver
> > > + * Copyright 2025 Analog Devices Inc.
> > > + * Author: Jorge Marques <jorge.marques@analog.com>
> > > + */
> > > +
> > > +#include <linux/bitops.h>
> > > +#include <linux/bitfield.h>
> > > +#include <linux/clk.h>
> > > +#include <linux/err.h>
> > > +#include <linux/errno.h>
> > > +#include <linux/i3c/master.h>
> > > +#include <linux/interrupt.h>
> > > +#include <linux/io.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/platform_device.h>
> > > +
> > > +#define VERSION_MAJOR(x)		((u32)FIELD_GET(GENMASK(23, 16), (x)))
> > > +#define VERSION_MINOR(x)		((u32)FIELD_GET(GENMASK(15, 8), (x)))
> > > +#define VERSION_PATCH(x)		((u32)FIELD_GET(GENMASK(7, 0), (x)))
> Hi Frank,
> >
> > I suppose that needn't (u32), any warnings report without u32?
> >
> Here I will actually remove and use the macros from
> linux/fpga/adi-axi-common.h
>
> > > +
> > > +#define MAX_DEVS			16
> > > +
> > > +#define REG_VERSION			0x000
> to be replaced removed, and ADI_AXI_REG_VERSION used instead.
> > > +#define REG_ENABLE			0x040
> > > +#define REG_IRQ_MASK			0x080
> > > +#define REG_IRQ_PENDING			0x084
> > > +#define   REG_IRQ_PENDING_CMDR		BIT(5)
> > > +#define   REG_IRQ_PENDING_IBI		((u32)BIT(6))
> >
> > needn't u32
> In earlier CI runs, I used to get with gcc_x86_64, due to the inversion
> ~REG_IRQ_PENDING_IBI:
>
>   > conversion from 'long unsigned int' to 'unsigned int' changes value
>   > from '18446744073709551615' to '4294967295' [-Werror=overflow]
>
> Couldn't replicate in this patch version, so I will remove.
>
> > > +#define   REG_IRQ_PENDING_DAA		BIT(7)
> >
> > Add empty line between registers
> >
> Ok
> > > +#define REG_CMD_FIFO			0x0d4
> > > +#define	  REG_CMD_FIFO_0_IS_CCC		BIT(22)
> > > +#define   REG_CMD_FIFO_0_BCAST		BIT(21)
> > > +#define   REG_CMD_FIFO_0_SR		BIT(20)
> > > +#define   REG_CMD_FIFO_0_LEN(l)		FIELD_PREP(GENMASK(19, 8), (l))
> > > +#define   REG_CMD_FIFO_0_DEV_ADDR(a)	FIELD_PREP(GENMASK(7, 1), a)
> > > +#define   REG_CMD_FIFO_0_RNW		BIT(0)
> > > +#define   REG_CMD_FIFO_1_CCC(id)	FIELD_PREP(GENMASK(7, 0), (id))
> > > +#define REG_CMD_FIFO_ROOM		0x0c0
> > > +#define REG_CMDR_FIFO			0x0d8
> > > +#define   REG_CMDR_FIFO_NO_ERROR	0
> > > +#define   REG_CMDR_FIFO_CE0_ERROR	1
> > > +#define   REG_CMDR_FIFO_CE2_ERROR	4
> > > +#define   REG_CMDR_FIFO_NACK_RESP	6
> > > +#define   REG_CMDR_FIFO_UDA_ERROR	8
> > > +#define   REG_CMDR_FIFO_ERROR(x)	FIELD_GET(GENMASK(23, 20), (x))
> > > +#define   REG_CMDR_FIFO_XFER_BYTES(x)	FIELD_GET(GENMASK(19, 8), (x))
> >
> > Sort according bit pos. REG_CMDR_FIFO_XFER_BYTES should before
> > REG_CMDR_FIFO_ERROR
> >
> Ahh true
> > > +#define REG_SDO_FIFO			0x0dc
> > > +#define REG_SDO_FIFO_ROOM		0x0c8
> > > +#define REG_SDI_FIFO			0x0e0
> > > +#define REG_IBI_FIFO			0x0e4
> > > +#define REG_FIFO_STATUS			0x0e8
> > > +#define   REG_FIFO_STATUS_CMDR_EMPTY	BIT(0)
> > > +#define   REG_FIFO_STATUS_IBI_EMPTY	BIT(1)
> > > +#define REG_OPS				0x100
> > > +#define   REG_OPS_SET_SG(x)		FIELD_PREP(GENMASK(6, 5), (x))
> > > +#define   REG_OPS_PP_SG_MASK		GENMASK(6, 5)
> >
> > REG_OPS_SET_SG(x) FIELD_PREP(REG_OPS_PP_SG_MASK, (x))
> Ack.
> >
> > > +#define REG_IBI_CONFIG			0x140
> > > +#define   REG_IBI_CONFIG_LISTEN		BIT(1)
> > > +#define   REG_IBI_CONFIG_ENABLE		BIT(0)
> >
> > sort it. keep consisent in whole file, from 0->31 or 31->0
> >
> Ack, decrementing
> > > +#define REG_DEV_CHAR			0x180
> > > +#define   REG_DEV_CHAR_IS_I2C		BIT(0)
> > > +#define   REG_DEV_CHAR_IS_ATTACHED	BIT(1)
> > > +#define   REG_DEV_CHAR_BCR_IBI(x)	(((x) & GENMASK(2, 1)) << 1)
> >
> > FIELD_PREP()
> Ok, I will remove the simplification and make it clearer by setting
>
>      #define   REG_DEV_CHAR_BCR_IBI(x)       FIELD_PREP(GENMASK(3, 2), (x))
>
> Then usage:
>
>      #include <linux/i3c/device.h>
>      ...
>      bcr_ibi = FIELD_GET(I3C_BCR_IBI_PAYLOAD | I3C_BCR_IBI_REQ_CAP, (i3cdev->info.bcr));
>      ...REG_DEV_CHAR_BCR_IBI(bcr_ibi)...;
>
> >
> > > +#define   REG_DEV_CHAR_WEN		BIT(8)
> > > +#define   REG_DEV_CHAR_ADDR(x)		FIELD_PREP(GENMASK(15, 9), (x))
> > > +
> > > +enum speed_grade {PP_SG_UNSET, PP_SG_1MHZ, PP_SG_3MHZ, PP_SG_6MHZ, PP_SG_12MHZ};
> > > +struct adi_i3c_cmd {
> > > +	u32 cmd0;
> > > +	u32 cmd1;
> > > +	u32 tx_len;
> > > +	const void *tx_buf;
> > > +	u32 rx_len;
> > > +	void *rx_buf;
> > > +	u32 error;
> > > +};
> > > +
> > > +struct adi_i3c_xfer {
> > > +	struct list_head node;
> > > +	struct completion comp;
> > > +	int ret;
> > > +	unsigned int ncmds;
> > > +	unsigned int ncmds_comp;
> > > +	struct adi_i3c_cmd cmds[];
> > > +};
> > > +
> > > +struct adi_i3c_master {
> > > +	struct i3c_master_controller base;
> > > +	u32 free_rr_slots;
> > > +	unsigned int maxdevs;
> > > +	struct {
> > > +		unsigned int num_slots;
> > > +		struct i3c_dev_desc **slots;
> > > +		spinlock_t lock; /* Protect IBI slot access */
> > > +	} ibi;
> > > +	struct {
> > > +		struct list_head list;
> > > +		struct adi_i3c_xfer *cur;
> > > +		spinlock_t lock; /* Protect transfer */
> > > +	} xferqueue;
> > > +	void __iomem *regs;
> > > +	struct clk *clk;
> > > +	unsigned long i3c_scl_lim;
> > > +	struct {
> > > +		u8 addrs[MAX_DEVS];
> > > +		u8 index;
> > > +	} daa;
> > > +};
> > > +
> > > +static inline struct adi_i3c_master *to_adi_i3c_master(struct i3c_master_controller *master)
> > > +{
> > > +	return container_of(master, struct adi_i3c_master, base);
> > > +}
> > > +
> > > +static void adi_i3c_master_wr_to_tx_fifo(struct adi_i3c_master *master,
> > > +					 const u8 *bytes, unsigned int nbytes)
> > > +{
> > > +	unsigned int n, m;
> > > +	u32 tmp;
> > > +
> > > +	n = readl(master->regs + REG_SDO_FIFO_ROOM);
> > > +	m = min(n, nbytes);
> > > +	writesl(master->regs + REG_SDO_FIFO, bytes, m / 4);
> > > +
> > > +	if (m & 3) {
> > > +		memcpy(&tmp, bytes + (m & ~3), m & 3);
> > > +		writel(tmp, master->regs + REG_SDO_FIFO);
> > > +	}
> > > +}
> > > +
> > > +static void adi_i3c_master_rd_from_rx_fifo(struct adi_i3c_master *master,
> > > +					   u8 *bytes, unsigned int nbytes)
> > > +{
> > > +	readsl(master->regs + REG_SDI_FIFO, bytes, nbytes / 4);
> > > +	if (nbytes & 3) {
> > > +		u32 tmp;
> > > +
> > > +		tmp = readl(master->regs + REG_SDI_FIFO);
> > > +		memcpy(bytes + (nbytes & ~3), &tmp, nbytes & 3);
> > > +	}
> > > +}
> >
> > can you move above two helper function as inline into drivers/i3c/internals.h
> >
> > or create new one drivers/i3c/master/helper.h or other naming.
> >
> > Renesas IP have similar above two functions to access FIFO.
> > https://lore.kernel.org/linux-i3c/174964724485.330045.2181706921272138816.robh@kernel.org/T/#t
> >
> Ok, yes that's common because the passes type u8 doesn't ensure
> multiples of 32 at least. Added to my TODO list.
> > > +
> > > +static bool adi_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
> > > +					    const struct i3c_ccc_cmd *cmd)
> > > +{
> > > +	if (cmd->ndests > 1)
> > > +		return false;
> > > +
> > > +	switch (cmd->id) {
> > > +	case I3C_CCC_ENEC(true):
> > > +	case I3C_CCC_ENEC(false):
> > > +	case I3C_CCC_DISEC(true):
> > > +	case I3C_CCC_DISEC(false):
> > > +	case I3C_CCC_RSTDAA(true):
> > > +	case I3C_CCC_RSTDAA(false):
> > > +	case I3C_CCC_ENTDAA:
> > > +	case I3C_CCC_SETDASA:
> > > +	case I3C_CCC_SETNEWDA:
> > > +	case I3C_CCC_GETMWL:
> > > +	case I3C_CCC_GETMRL:
> > > +	case I3C_CCC_GETPID:
> > > +	case I3C_CCC_GETBCR:
> > > +	case I3C_CCC_GETDCR:
> > > +	case I3C_CCC_GETSTATUS:
> > > +	case I3C_CCC_GETHDRCAP:
> > > +		return true;
> > > +	default:
> > > +		break;
> > > +	}
> > > +
> > > +	return false;
> > > +}
> > > +
> > > +static int adi_i3c_master_disable(struct adi_i3c_master *master)
> > > +{
> > > +	writel(0, master->regs + REG_IBI_CONFIG);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static struct adi_i3c_xfer *adi_i3c_master_alloc_xfer(struct adi_i3c_master *master,
> > > +						      unsigned int ncmds)
> > > +{
> > > +	struct adi_i3c_xfer *xfer;
> > > +
> > > +	xfer = kzalloc(struct_size(xfer, cmds, ncmds), GFP_KERNEL);
> > > +	if (!xfer)
> > > +		return NULL;
> > > +
> > > +	INIT_LIST_HEAD(&xfer->node);
> > > +	xfer->ncmds = ncmds;
> > > +	xfer->ret = -ETIMEDOUT;
> > > +
> > > +	return xfer;
> > > +}
> > > +
> > > +static void adi_i3c_master_start_xfer_locked(struct adi_i3c_master *master)
> > > +{
> > > +	struct adi_i3c_xfer *xfer = master->xferqueue.cur;
> > > +	unsigned int i, n, m;
> > > +
> > > +	if (!xfer)
> > > +		return;
> > > +
> > > +	for (i = 0; i < xfer->ncmds; i++) {
> > > +		struct adi_i3c_cmd *cmd = &xfer->cmds[i];
> > > +
> > > +		if (!(cmd->cmd0 & REG_CMD_FIFO_0_RNW))
> > > +			adi_i3c_master_wr_to_tx_fifo(master, cmd->tx_buf, cmd->tx_len);
> > > +	}
> > > +
> > > +	n = readl(master->regs + REG_CMD_FIFO_ROOM);
> > > +	for (i = 0; i < xfer->ncmds; i++) {
> > > +		struct adi_i3c_cmd *cmd = &xfer->cmds[i];
> > > +
> > > +		m = cmd->cmd0 & REG_CMD_FIFO_0_IS_CCC ? 2 : 1;
> > > +		if (m > n)
> > > +			break;
> > > +		writel(cmd->cmd0, master->regs + REG_CMD_FIFO);
> > > +		if (cmd->cmd0 & REG_CMD_FIFO_0_IS_CCC)
> > > +			writel(cmd->cmd1, master->regs + REG_CMD_FIFO);
> > > +		n -= m;
> > > +	}
> > > +}
> > > +
> > > +static void adi_i3c_master_end_xfer_locked(struct adi_i3c_master *master,
> > > +					   u32 pending)
> > > +{
> > > +	struct adi_i3c_xfer *xfer = master->xferqueue.cur;
> > > +	int i, ret = 0;
> > > +	u32 status0;
> > > +
> > > +	if (!xfer)
> > > +		return;
> > > +
> > > +	for (status0 = readl(master->regs + REG_FIFO_STATUS);
> > > +	     !(status0 & REG_FIFO_STATUS_CMDR_EMPTY);
> > > +	     status0 = readl(master->regs + REG_FIFO_STATUS)) {
> >
> > how about
> >
> > while (!(readl(master->regs + REG_FIFO_STATUS) & REG_FIFO_STATUS_CMDR_EMPTY))) {
> >
> Ack, thanks!
> Same for 'REG_FIFO_STATUS_IBI_EMPTY for'.
> > > +		struct adi_i3c_cmd *cmd;
> > > +		u32 cmdr, rx_len;
> > > +
> > > +		cmdr = readl(master->regs + REG_CMDR_FIFO);
> > > +
> > > +		cmd = &xfer->cmds[xfer->ncmds_comp++];
> > > +		if (cmd->cmd0 & REG_CMD_FIFO_0_RNW) {
> > > +			rx_len = min_t(u32, REG_CMDR_FIFO_XFER_BYTES(cmdr), cmd->rx_len);
> > > +			adi_i3c_master_rd_from_rx_fifo(master, cmd->rx_buf, rx_len);
> > > +		}
> > > +		cmd->error = REG_CMDR_FIFO_ERROR(cmdr);
> > > +	}
> > > +
> > > +	for (i = 0; i < xfer->ncmds; i++) {
> >
> > I think you iterate to ncmds_comp?
> >
> You are correct thanks! Each command yields a command receipt interrupt.
> > > +		switch (xfer->cmds[i].error) {
> > > +		case REG_CMDR_FIFO_NO_ERROR:
> > > +			break;
> > > +
> > > +		case REG_CMDR_FIFO_CE0_ERROR:
> > > +		case REG_CMDR_FIFO_CE2_ERROR:
> > > +		case REG_CMDR_FIFO_NACK_RESP:
> > > +		case REG_CMDR_FIFO_UDA_ERROR:
> > > +			ret = -EIO;
> > > +			break;
> > > +
> > > +		default:
> > > +			ret = -EINVAL;
> > > +			break;
> > > +		}
> > > +	}
> > > +
> > > +	xfer->ret = ret;
> > > +
> > > +	if (xfer->ncmds_comp != xfer->ncmds)
> > > +		return;
> > > +
> > > +	complete(&xfer->comp);
> > > +
> > > +	xfer = list_first_entry_or_null(&master->xferqueue.list,
> > > +					struct adi_i3c_xfer, node);
> > > +	if (xfer)
> > > +		list_del_init(&xfer->node);
> > > +
> > > +	master->xferqueue.cur = xfer;
> > > +	adi_i3c_master_start_xfer_locked(master);
> > > +}
> > > +
> > > +static void adi_i3c_master_queue_xfer(struct adi_i3c_master *master,
> > > +				      struct adi_i3c_xfer *xfer)
> > > +{
> > > +	init_completion(&xfer->comp);
> > > +	guard(spinlock_irqsave)(&master->xferqueue.lock);
> > > +	if (master->xferqueue.cur) {
> > > +		list_add_tail(&xfer->node, &master->xferqueue.list);
> > > +	} else {
> > > +		master->xferqueue.cur = xfer;
> > > +		adi_i3c_master_start_xfer_locked(master);
> > > +	}
> > > +}
> > > +
> > > +static void adi_i3c_master_unqueue_xfer(struct adi_i3c_master *master,
> > > +					struct adi_i3c_xfer *xfer)
> > > +{
> > > +	guard(spinlock_irqsave)(&master->xferqueue.lock);
> > > +	if (master->xferqueue.cur == xfer)
> > > +		master->xferqueue.cur = NULL;
> > > +	else
> > > +		list_del_init(&xfer->node);
> > > +
> > > +	writel(0x01, master->regs + REG_ENABLE);
> > > +	writel(0x00, master->regs + REG_ENABLE);
> > > +	writel(REG_IRQ_PENDING_CMDR, master->regs + REG_IRQ_MASK);
> > > +}
> > > +
> > > +static enum i3c_error_code adi_i3c_cmd_get_err(struct adi_i3c_cmd *cmd)
> > > +{
> > > +	switch (cmd->error) {
> > > +	case REG_CMDR_FIFO_CE0_ERROR:
> > > +		return I3C_ERROR_M0;
> > > +
> > > +	case REG_CMDR_FIFO_CE2_ERROR:
> > > +	case REG_CMDR_FIFO_NACK_RESP:
> > > +		return I3C_ERROR_M2;
> > > +
> > > +	default:
> > > +		break;
> > > +	}
> > > +
> > > +	return I3C_ERROR_UNKNOWN;
> > > +}
> > > +
> > > +static int adi_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
> > > +				       struct i3c_ccc_cmd *cmd)
> > > +{
> > > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > > +	struct adi_i3c_xfer *xfer;
> > > +	struct adi_i3c_cmd *ccmd;
> > > +
> > > +	xfer = adi_i3c_master_alloc_xfer(master, 1);
> > > +	if (!xfer)
> > > +		return -ENOMEM;
> > > +
> > > +	ccmd = xfer->cmds;
> > > +	ccmd->cmd1 = REG_CMD_FIFO_1_CCC(cmd->id);
> > > +	ccmd->cmd0 = REG_CMD_FIFO_0_IS_CCC |
> > > +		     REG_CMD_FIFO_0_LEN(cmd->dests[0].payload.len);
> > > +
> > > +	if (cmd->id & I3C_CCC_DIRECT)
> > > +		ccmd->cmd0 |= REG_CMD_FIFO_0_DEV_ADDR(cmd->dests[0].addr);
> > > +
> > > +	if (cmd->rnw) {
> > > +		ccmd->cmd0 |= REG_CMD_FIFO_0_RNW;
> > > +		ccmd->rx_buf = cmd->dests[0].payload.data;
> > > +		ccmd->rx_len = cmd->dests[0].payload.len;
> > > +	} else {
> > > +		ccmd->tx_buf = cmd->dests[0].payload.data;
> > > +		ccmd->tx_len = cmd->dests[0].payload.len;
> > > +	}
> > > +
> > > +	adi_i3c_master_queue_xfer(master, xfer);
> > > +	if (!wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(1000)))
> > > +		adi_i3c_master_unqueue_xfer(master, xfer);
> > > +
> > > +	cmd->err = adi_i3c_cmd_get_err(&xfer->cmds[0]);
> > > +	kfree(xfer);
> >
> > you can use
> > struct adi_i3c_xfer *xfer __free(kfree) = NULL;
> >
> >  to simple code.
> >
> Ah cool, will use in all xfer instances.
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int adi_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
> > > +				     struct i3c_priv_xfer *xfers,
> > > +				     int nxfers)
> > > +{
> > > +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> > > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > > +	struct adi_i3c_xfer *xfer;
> > > +	int i, ret;
> > > +
> > > +	if (!nxfers)
> > > +		return 0;
> >
> > add an empty line.
> >
> Ack.
> > > +	xfer = adi_i3c_master_alloc_xfer(master, nxfers);
> > > +	if (!xfer)
> > > +		return -ENOMEM;
> > > +
> > > +	for (i = 0; i < nxfers; i++) {
> > > +		struct adi_i3c_cmd *ccmd = &xfer->cmds[i];
> > > +
> > > +		ccmd->cmd0 = REG_CMD_FIFO_0_DEV_ADDR(dev->info.dyn_addr);
> > > +
> > > +		if (xfers[i].rnw) {
> > > +			ccmd->cmd0 |= REG_CMD_FIFO_0_RNW;
> > > +			ccmd->rx_buf = xfers[i].data.in;
> > > +			ccmd->rx_len = xfers[i].len;
> > > +		} else {
> > > +			ccmd->tx_buf = xfers[i].data.out;
> > > +			ccmd->tx_len = xfers[i].len;
> > > +		}
> > > +
> > > +		ccmd->cmd0 |= REG_CMD_FIFO_0_LEN(xfers[i].len);
> > > +
> > > +		if (i < nxfers - 1)
> > > +			ccmd->cmd0 |= REG_CMD_FIFO_0_SR;
> > > +
> > > +		if (!i)
> > > +			ccmd->cmd0 |= REG_CMD_FIFO_0_BCAST;
> > > +	}
> > > +
> > > +	adi_i3c_master_queue_xfer(master, xfer);
> > > +	if (!wait_for_completion_timeout(&xfer->comp,
> > > +					 msecs_to_jiffies(1000)))
> > > +		adi_i3c_master_unqueue_xfer(master, xfer);
> > > +
> > > +	ret = xfer->ret;
> > > +
> > > +	for (i = 0; i < nxfers; i++)
> > > +		xfers[i].err = adi_i3c_cmd_get_err(&xfer->cmds[i]);
> > > +
> > > +	kfree(xfer);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +struct adi_i3c_i2c_dev_data {
> > > +	u16 id;
> > > +	s16 ibi;
> > > +	struct i3c_generic_ibi_pool *ibi_pool;
> > > +};
> > > +
> > > +static int adi_i3c_master_get_rr_slot(struct adi_i3c_master *master,
> > > +				      u8 dyn_addr)
> > > +{
> > > +	if (!master->free_rr_slots)
> > > +		return -ENOSPC;
> > > +
> > > +	return ffs(master->free_rr_slots) - 1;
> > > +}
> > > +
> > > +static int adi_i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev, u8 dyn_addr)
> > > +{
> > > +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> > > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > > +	u8 addr;
> > > +
> > > +	addr = dev->info.dyn_addr ? dev->info.dyn_addr : dev->info.static_addr;
> > > +
> > > +	writel(REG_DEV_CHAR_ADDR(dyn_addr), master->regs + REG_DEV_CHAR);
> > > +	writel((readl(master->regs + REG_DEV_CHAR) &
> > > +		~REG_DEV_CHAR_IS_ATTACHED) | REG_DEV_CHAR_WEN,
> > > +	       master->regs + REG_DEV_CHAR);
> > > +
> > > +	writel(REG_DEV_CHAR_ADDR(addr), master->regs + REG_DEV_CHAR);
> > > +	writel(readl(master->regs + REG_DEV_CHAR) |
> > > +	       REG_DEV_CHAR_IS_ATTACHED | REG_DEV_CHAR_WEN,
> > > +	       master->regs + REG_DEV_CHAR);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int adi_i3c_master_attach_i3c_dev(struct i3c_dev_desc *dev)
> > > +{
> > > +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> > > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > > +	struct adi_i3c_i2c_dev_data *data;
> > > +	int slot;
> > > +	u8 addr;
> > > +
> > > +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> > > +	if (!data)
> > > +		return -ENOMEM;
> > > +
> > > +	slot = adi_i3c_master_get_rr_slot(master, dev->info.dyn_addr);
> > > +	if (slot < 0) {
> > > +		kfree(data);
> > > +		return slot;
> > > +	}
> > > +
> > > +	data->ibi = -1;
> >
> > why -1 here?
> >
> Doesn't mean much, just stores the ibi slot occupied by the device.
> NULL would be position 0 of the array.
> It can be left uninitialized and not cleaned-up when removed.
> > > +	data->id = slot;
> > > +	i3c_dev_set_master_data(dev, data);
> > > +	master->free_rr_slots &= ~BIT(slot);
> > > +
> > > +	addr = dev->info.dyn_addr ? dev->info.dyn_addr : dev->info.static_addr;
> > > +
> > > +	writel(REG_DEV_CHAR_ADDR(addr), master->regs + REG_DEV_CHAR);
> > > +	writel(readl(master->regs + REG_DEV_CHAR) |
> > > +	       REG_DEV_CHAR_IS_ATTACHED | REG_DEV_CHAR_WEN,
> > > +	       master->regs + REG_DEV_CHAR);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void adi_i3c_master_sync_dev_char(struct i3c_master_controller *m)
> > > +{
> > > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > > +	struct i3c_dev_desc *i3cdev;
> > > +	u8 addr;
> > > +
> > > +	i3c_bus_for_each_i3cdev(&m->bus, i3cdev) {
> > > +		addr = i3cdev->info.dyn_addr ?
> > > +		       i3cdev->info.dyn_addr : i3cdev->info.static_addr;
> > > +		writel(REG_DEV_CHAR_ADDR(addr), master->regs + REG_DEV_CHAR);
> > > +		writel(readl(master->regs + REG_DEV_CHAR) |
> > > +		       REG_DEV_CHAR_BCR_IBI(i3cdev->info.bcr) | REG_DEV_CHAR_WEN,
> > > +		       master->regs + REG_DEV_CHAR);
> > > +	}
> > > +}
> > > +
> > > +static void adi_i3c_master_detach_i3c_dev(struct i3c_dev_desc *dev)
> > > +{
> > > +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> > > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > > +	struct adi_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> > > +	u8 addr;
> > > +
> > > +	addr = dev->info.dyn_addr ? dev->info.dyn_addr : dev->info.static_addr;
> > > +
> > > +	writel(REG_DEV_CHAR_ADDR(addr), master->regs + REG_DEV_CHAR);
> > > +	writel((readl(master->regs + REG_DEV_CHAR) &
> > > +		~REG_DEV_CHAR_IS_ATTACHED) | REG_DEV_CHAR_WEN,
> > > +	       master->regs + REG_DEV_CHAR);
> > > +
> > > +	i3c_dev_set_master_data(dev, NULL);
> > > +	master->free_rr_slots |= BIT(data->id);
> > > +	kfree(data);
> > > +}
> > > +
> > > +static int adi_i3c_master_attach_i2c_dev(struct i2c_dev_desc *dev)
> > > +{
> > > +	struct i3c_master_controller *m = i2c_dev_get_master(dev);
> > > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > > +	struct adi_i3c_i2c_dev_data *data;
> > > +	int slot;
> > > +
> > > +	slot = adi_i3c_master_get_rr_slot(master, 0);
> > > +	if (slot < 0)
> > > +		return slot;
> > > +
> > > +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> > > +	if (!data)
> > > +		return -ENOMEM;
> > > +
> > > +	data->id = slot;
> > > +	master->free_rr_slots &= ~BIT(slot);
> > > +	i2c_dev_set_master_data(dev, data);
> > > +
> > > +	writel(REG_DEV_CHAR_ADDR(dev->addr) |
> > > +	       REG_DEV_CHAR_IS_I2C | REG_DEV_CHAR_IS_ATTACHED | REG_DEV_CHAR_WEN,
> > > +	       master->regs + REG_DEV_CHAR);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void adi_i3c_master_detach_i2c_dev(struct i2c_dev_desc *dev)
> > > +{
> > > +	struct i3c_master_controller *m = i2c_dev_get_master(dev);
> > > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > > +	struct adi_i3c_i2c_dev_data *data = i2c_dev_get_master_data(dev);
> > > +
> > > +	writel(REG_DEV_CHAR_ADDR(dev->addr) |
> > > +	       REG_DEV_CHAR_IS_I2C | REG_DEV_CHAR_WEN,
> > > +	       master->regs + REG_DEV_CHAR);
> > > +
> > > +	i2c_dev_set_master_data(dev, NULL);
> > > +	master->free_rr_slots |= BIT(data->id);
> > > +	kfree(data);
> > > +}
> > > +
> > > +static void adi_i3c_master_bus_cleanup(struct i3c_master_controller *m)
> > > +{
> > > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > > +
> > > +	adi_i3c_master_disable(master);
> > > +}
> > > +
> > > +static void adi_i3c_master_upd_i3c_scl_lim(struct adi_i3c_master *master)
> > > +{
> > > +	struct i3c_master_controller *m = &master->base;
> > > +	struct i3c_bus *bus = i3c_master_get_bus(m);
> > > +	u8 i3c_scl_lim = 0;
> > > +	struct i3c_dev_desc *dev;
> > > +	u8 pp_sg;
> > > +
> > > +	i3c_bus_for_each_i3cdev(bus, dev) {
> > > +		u8 max_fscl;
> > > +
> > > +		max_fscl = max(I3C_CCC_MAX_SDR_FSCL(dev->info.max_read_ds),
> > > +			       I3C_CCC_MAX_SDR_FSCL(dev->info.max_write_ds));
> > > +
> > > +		switch (max_fscl) {
> > > +		case I3C_SDR1_FSCL_8MHZ:
> > > +			max_fscl = PP_SG_6MHZ;
> > > +			break;
> > > +		case I3C_SDR2_FSCL_6MHZ:
> > > +			max_fscl = PP_SG_3MHZ;
> > > +			break;
> > > +		case I3C_SDR3_FSCL_4MHZ:
> > > +			max_fscl = PP_SG_3MHZ;
> > > +			break;
> > > +		case I3C_SDR4_FSCL_2MHZ:
> > > +			max_fscl = PP_SG_1MHZ;
> > > +			break;
> > > +		case I3C_SDR0_FSCL_MAX:
> > > +		default:
> > > +			max_fscl = PP_SG_12MHZ;
> > > +			break;
> > > +		}
> > > +
> > > +		if (max_fscl &&
> > > +		    (i3c_scl_lim > max_fscl || !i3c_scl_lim))
> > > +			i3c_scl_lim = max_fscl;
> > > +	}
> > > +
> > > +	if (!i3c_scl_lim)
> > > +		return;
> > > +
> > > +	master->i3c_scl_lim = i3c_scl_lim - 1;
> > > +
> > > +	pp_sg = readl(master->regs + REG_OPS) & ~REG_OPS_PP_SG_MASK;
> > > +	pp_sg |= REG_OPS_SET_SG(master->i3c_scl_lim);
> > > +
> > > +	writel(pp_sg, master->regs + REG_OPS);
> > > +}
> > > +
> > > +static void adi_i3c_master_get_features(struct adi_i3c_master *master,
> > > +					unsigned int slot,
> > > +					struct i3c_device_info *info)
> > > +{
> > > +	memset(info, 0, sizeof(*info));
> > > +
> > > +	info->dyn_addr = 0x31;
> >
> > master address is hardcode?
> >
> Yes.
> There is/was no register to read it from because the controller does not
> support secondary mastership or changing role, so this address is not
> used for anything (as is). Since it is odd, I will move add these
> hardcoded values to the register map (read-only), still won't do
> anything.

need comments for 0x31

> > > +	info->dcr = 0x00;
> > > +	info->bcr = 0x40;
> > > +	info->pid = 0;
> > > +}
> > > +
> > > +static int adi_i3c_master_do_daa(struct i3c_master_controller *m)
> > > +{
> > > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > > +	u32 irq_mask;
> > > +	int ret, addr;
> > > +
> > > +	addr = 0x8;
> > > +	for (u8 i = 0; i < MAX_DEVS; i++) {
> > > +		addr = i3c_master_get_free_addr(m, addr);
> > > +		if (addr < 0)
> > > +			return addr;
> >
> > assume MAX_DEVS 128, if only get 4 address, suppose you should enumerate
> > for such 4 devices, instead of return error and give up do_daa.
> >
> The IP Core supports just 16 devices (max # on the bus), so it should
> not run-out of addresses, but I understand the assignment. As is, the IP
> core has 16 slots and will only terminate the DAA from its side if it
> run out of slots (if no device request an address (NACK bit), the DAA is
> also terminated). Not writing a DA during the DA IRQ will just hang the
> bus.
>
> For the suggestion to work I need to re-read the spec and rework the RTL
> to allow this early termination. However, I am currently a little
> opposed of changing the RTL beyond basic read-only registers
> modifications.
> > > +		master->daa.addrs[i] = addr;
> > > +	}
> > > +
> > > +	irq_mask = readl(master->regs + REG_IRQ_MASK);
> > > +	writel(irq_mask | REG_IRQ_PENDING_DAA,
> > > +	       master->regs + REG_IRQ_MASK);
> > > +
> > > +	master->daa.index = 0;
> > > +	ret = i3c_master_entdaa_locked(&master->base);
> > > +
> > > +	writel(irq_mask, master->regs + REG_IRQ_MASK);
> > > +
> > > +	/* DAA always finishes with CE2_ERROR or NACK_RESP */
> > > +	if (ret && ret != I3C_ERROR_M2)
> > > +		return ret;
> > > +
> > > +	/* Add I3C devices discovered */
> > > +	for (u8 i = 0; i < master->daa.index; i++)
> > > +		i3c_master_add_i3c_dev_locked(m, master->daa.addrs[i]);
> > > +	/* Sync retrieved devs info with the IP */
> > > +	adi_i3c_master_sync_dev_char(m);
> > > +
> > > +	i3c_master_defslvs_locked(&master->base);
> > > +
> > > +	adi_i3c_master_upd_i3c_scl_lim(master);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int adi_i3c_master_bus_init(struct i3c_master_controller *m)
> > > +{
> > > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > > +	struct i3c_device_info info = { };
> > > +	int ret;
> > > +
> > > +	ret = i3c_master_get_free_addr(m, 0);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	adi_i3c_master_get_features(master, 0, &info);
> > > +	ret = i3c_master_set_info(&master->base, &info);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	writel(REG_IBI_CONFIG_LISTEN,
> > > +	       master->regs + REG_IBI_CONFIG);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void adi_i3c_master_handle_ibi(struct adi_i3c_master *master,
> > > +				      u32 ibi)
> > > +{
> > > +	struct adi_i3c_i2c_dev_data *data;
> > > +	struct i3c_ibi_slot *slot;
> > > +	struct i3c_dev_desc *dev;
> > > +	u8 da, id;
> > > +	u8 *mdb;
> > > +
> > > +	da = (ibi >> 17) & GENMASK(6, 0);
> > > +	for (id = 0; id < master->ibi.num_slots; id++) {
> > > +		if (master->ibi.slots[id] &&
> > > +		    master->ibi.slots[id]->info.dyn_addr == da)
> > > +			break;
> > > +	}
> > > +
> > > +	if (id == master->ibi.num_slots)
> > > +		return;
> > > +
> > > +	dev = master->ibi.slots[id];
> > > +	guard(spinlock)(&master->ibi.lock);
> > > +
> > > +	data = i3c_dev_get_master_data(dev);
> > > +	slot = i3c_generic_ibi_get_free_slot(data->ibi_pool);
> > > +	if (!slot)
> > > +		return;
> > > +
> > > +	mdb = slot->data;
> > > +	mdb[0] = (ibi >> 8) & GENMASK(7, 0);
> > > +
> > > +	slot->len = 1;
> > > +	i3c_master_queue_ibi(dev, slot);
> > > +}
> > > +
> > > +static void adi_i3c_master_demux_ibis(struct adi_i3c_master *master)
> > > +{
> > > +	u32 status0;
> > > +
> > > +	for (status0 = readl(master->regs + REG_FIFO_STATUS);
> > > +	     !(status0 & REG_FIFO_STATUS_IBI_EMPTY);
> > > +	     status0 = readl(master->regs + REG_FIFO_STATUS)) {
> >
> > use while()
> >
> Ack.
> > > +		u32 ibi = readl(master->regs + REG_IBI_FIFO);
> > > +
> > > +		adi_i3c_master_handle_ibi(master, ibi);
> > > +	}
> > > +}
> > > +
> > > +static void adi_i3c_master_handle_da_req(struct adi_i3c_master *master)
> > > +{
> > > +	u8 payload0[8];
> > > +	u32 addr;
> > > +
> > > +	/* Clear device characteristics */
> > > +	adi_i3c_master_rd_from_rx_fifo(master, payload0, 6);
> > > +	addr = master->daa.addrs[master->daa.index++];
> > > +	addr = (addr << 1) | (parity8(addr) ? 0 : 1);
> > > +
> > > +	writel(addr, master->regs + REG_SDO_FIFO);
> > > +}
> > > +
> > > +static irqreturn_t adi_i3c_master_irq(int irq, void *data)
> > > +{
> > > +	struct adi_i3c_master *master = data;
> > > +	u32 pending;
> > > +
> > > +	pending = readl(master->regs + REG_IRQ_PENDING);
> > > +	writel(pending, master->regs + REG_IRQ_PENDING);
> >
> > Add an empty line here
> >
> Ack.
> > > +	if (pending & REG_IRQ_PENDING_CMDR) {
> > > +		spin_lock(&master->xferqueue.lock);
> > > +		adi_i3c_master_end_xfer_locked(master, pending);
> > > +		spin_unlock(&master->xferqueue.lock);
> >
> > you use guard, keep consisent, use guard or scoped_guard here
> >
> scoped_guard
> > > +	}
> > > +	if (pending & REG_IRQ_PENDING_IBI)
> > > +		adi_i3c_master_demux_ibis(master);
> > > +	if (pending & REG_IRQ_PENDING_DAA)
> > > +		adi_i3c_master_handle_da_req(master);
> > > +
> > > +	return IRQ_HANDLED;
> > > +}
> > > +
> > > +static int adi_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
> > > +				    struct i2c_msg *xfers,
> > > +				    int nxfers)
> > > +{
> > > +	struct i3c_master_controller *m = i2c_dev_get_master(dev);
> > > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > > +	struct adi_i3c_xfer *xfer;
> > > +	int i, ret;
> > > +
> > > +	if (!nxfers)
> > > +		return 0;
> > > +	for (i = 0; i < nxfers; i++) {
> > > +		if (xfers[i].flags & I2C_M_TEN)
> > > +			return -EOPNOTSUPP;
> > > +	}
> > > +	xfer = adi_i3c_master_alloc_xfer(master, nxfers);
> > > +	if (!xfer)
> > > +		return -ENOMEM;
> > > +
> > > +	for (i = 0; i < nxfers; i++) {
> > > +		struct adi_i3c_cmd *ccmd = &xfer->cmds[i];
> > > +
> > > +		ccmd->cmd0 = REG_CMD_FIFO_0_DEV_ADDR(xfers[i].addr);
> > > +
> > > +		if (xfers[i].flags & I2C_M_RD) {
> > > +			ccmd->cmd0 |= REG_CMD_FIFO_0_RNW;
> > > +			ccmd->rx_buf = xfers[i].buf;
> > > +			ccmd->rx_len = xfers[i].len;
> > > +		} else {
> > > +			ccmd->tx_buf = xfers[i].buf;
> > > +			ccmd->tx_len = xfers[i].len;
> > > +		}
> > > +
> > > +		ccmd->cmd0 |= REG_CMD_FIFO_0_LEN(xfers[i].len);
> >
> > Just curiouse
> > What's happen if IBI happen (address arbitrate) at first command?
> >
> The controller does the state machine for the IBI and yield a IBIR
> interrupt, then proceeds with the xfer, yielding the CMDR for each CMD.

Does controller retry current command again after handle IBI?

Frank Li

> > > +	}
> > > +
> > > +	adi_i3c_master_queue_xfer(master, xfer);
> > > +	if (!wait_for_completion_timeout(&xfer->comp,
> > > +					 m->i2c.timeout))
> > > +		adi_i3c_master_unqueue_xfer(master, xfer);
> > > +
> > > +	ret = xfer->ret;
> > > +	kfree(xfer);
> > > +	return ret;
> > > +}
> > > +
> > > +static int adi_i3c_master_disable_ibi(struct i3c_dev_desc *dev)
> > > +{
> > > +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> > > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > > +	struct i3c_dev_desc *i3cdev;
> > > +	u32 enabled = 0;
> > > +	int ret;
> > > +
> > > +	ret = i3c_master_disec_locked(m, dev->info.dyn_addr,
> > > +				      I3C_CCC_EVENT_SIR);
> > > +
> > > +	i3c_bus_for_each_i3cdev(&m->bus, i3cdev) {
> > > +		if (dev != i3cdev && i3cdev->ibi)
> > > +			enabled |= i3cdev->ibi->enabled;
> > > +	}
> > > +	if (!enabled) {
> > > +		writel(REG_IBI_CONFIG_LISTEN,
> > > +		       master->regs + REG_IBI_CONFIG);
> > > +		writel(readl(master->regs + REG_IRQ_MASK) & ~REG_IRQ_PENDING_IBI,
> > > +		       master->regs + REG_IRQ_MASK);
> > > +	}
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int adi_i3c_master_enable_ibi(struct i3c_dev_desc *dev)
> > > +{
> > > +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> > > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > > +
> > > +	writel(REG_IBI_CONFIG_LISTEN | REG_IBI_CONFIG_ENABLE,
> > > +	       master->regs + REG_IBI_CONFIG);
> > > +
> > > +	writel(readl(master->regs + REG_IRQ_MASK) | REG_IRQ_PENDING_IBI,
> > > +	       master->regs + REG_IRQ_MASK);
> > > +
> > > +	return i3c_master_enec_locked(m, dev->info.dyn_addr,
> > > +				      I3C_CCC_EVENT_SIR);
> > > +}
> > > +
> > > +static int adi_i3c_master_request_ibi(struct i3c_dev_desc *dev,
> > > +				      const struct i3c_ibi_setup *req)
> > > +{
> > > +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> > > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > > +	struct adi_i3c_i2c_dev_data *data;
> > > +	unsigned long flags;
> > > +	unsigned int i;
> > > +
> > > +	data = i3c_dev_get_master_data(dev);
> > > +	data->ibi_pool = i3c_generic_ibi_alloc_pool(dev, req);
> > > +	if (IS_ERR(data->ibi_pool))
> > > +		return PTR_ERR(data->ibi_pool);
> > > +
> > > +	spin_lock_irqsave(&master->ibi.lock, flags);
> > > +	for (i = 0; i < master->ibi.num_slots; i++) {
> > > +		if (!master->ibi.slots[i]) {
> > > +			data->ibi = i;
> > > +			master->ibi.slots[i] = dev;
> > > +			break;
> > > +		}
> > > +	}
> > > +	spin_unlock_irqrestore(&master->ibi.lock, flags);
> >
> > same here, use scope_guard to keep consistent.
> >
> Ack.
> > > +
> > > +	if (i < master->ibi.num_slots)
> > > +		return 0;
> > > +
> > > +	i3c_generic_ibi_free_pool(data->ibi_pool);
> > > +	data->ibi_pool = NULL;
> > > +
> > > +	return -ENOSPC;
> > > +}
> > > +
> > > +static void adi_i3c_master_free_ibi(struct i3c_dev_desc *dev)
> > > +{
> > > +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> > > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > > +	struct adi_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> > > +	unsigned long flags;
> > > +
> > > +	spin_lock_irqsave(&master->ibi.lock, flags);
> > > +	master->ibi.slots[data->ibi] = NULL;
> > > +	data->ibi = -1;
> > > +	spin_unlock_irqrestore(&master->ibi.lock, flags);
> > > +
> > > +	i3c_generic_ibi_free_pool(data->ibi_pool);
> > > +}
> > > +
> > > +static void adi_i3c_master_recycle_ibi_slot(struct i3c_dev_desc *dev,
> > > +					    struct i3c_ibi_slot *slot)
> > > +{
> > > +	struct adi_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> > > +
> > > +	i3c_generic_ibi_recycle_slot(data->ibi_pool, slot);
> > > +}
> > > +
> > > +static const struct i3c_master_controller_ops adi_i3c_master_ops = {
> > > +	.bus_init = adi_i3c_master_bus_init,
> > > +	.bus_cleanup = adi_i3c_master_bus_cleanup,
> > > +	.attach_i3c_dev = adi_i3c_master_attach_i3c_dev,
> > > +	.reattach_i3c_dev = adi_i3c_master_reattach_i3c_dev,
> > > +	.detach_i3c_dev = adi_i3c_master_detach_i3c_dev,
> > > +	.attach_i2c_dev = adi_i3c_master_attach_i2c_dev,
> > > +	.detach_i2c_dev = adi_i3c_master_detach_i2c_dev,
> > > +	.do_daa = adi_i3c_master_do_daa,
> > > +	.supports_ccc_cmd = adi_i3c_master_supports_ccc_cmd,
> > > +	.send_ccc_cmd = adi_i3c_master_send_ccc_cmd,
> > > +	.priv_xfers = adi_i3c_master_priv_xfers,
> > > +	.i2c_xfers = adi_i3c_master_i2c_xfers,
> > > +	.request_ibi = adi_i3c_master_request_ibi,
> > > +	.enable_ibi = adi_i3c_master_enable_ibi,
> > > +	.disable_ibi = adi_i3c_master_disable_ibi,
> > > +	.free_ibi = adi_i3c_master_free_ibi,
> > > +	.recycle_ibi_slot = adi_i3c_master_recycle_ibi_slot,
> > > +};
> > > +
> > > +static const struct of_device_id adi_i3c_master_of_match[] = {
> > > +	{ .compatible = "adi,i3c-master" },
> > > +	{}
> > > +};
> > > +
> > > +static int adi_i3c_master_probe(struct platform_device *pdev)
> > > +{
> > > +	struct adi_i3c_master *master;
> > > +	unsigned int version;
> > > +	int ret, irq;
> > > +
> > > +	master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
> > > +	if (!master)
> > > +		return -ENOMEM;
> > > +
> > > +	master->regs = devm_platform_ioremap_resource(pdev, 0);
> > > +	if (IS_ERR(master->regs))
> > > +		return PTR_ERR(master->regs);
> > > +
> > > +	master->clk = devm_clk_get_enabled(&pdev->dev, "axi");
> > > +	if (IS_ERR(master->clk))
> > > +		return PTR_ERR(master->clk);
> >
> > you have optional clock i3c, not use it in driver?
> >
> It is not used in the driver indeed, it describes how the IP Core is
> compiled and wired, but doesn't affect the logic in the driver itself.
> The RTL logic is always driven by a 100MHz clock, and the source is
> either axi or i3c, if the latter present.

can you use devm_clk_bulk_get_all_enabled() ?

> > > +
> > > +	irq = platform_get_irq(pdev, 0);
> > > +	if (irq < 0)
> > > +		return irq;
> > > +
> > > +	version = readl(master->regs + REG_VERSION);
> > > +	if (VERSION_MAJOR(version) != 0) {
> > > +		dev_err(&pdev->dev, "Unsupported IP version %u.%u.%c\n",
> > > +			VERSION_MAJOR(version),
> > > +			VERSION_MINOR(version),
> > > +			VERSION_PATCH(version));
> > > +		return -EINVAL;
> >
> > return dev_err_probe();
> Ack.
> >
> > Frank
> Best regards,
> Jorge
> > > +	}
> > > +
> > > +	writel(0x00, master->regs + REG_ENABLE);
> > > +	writel(0x00, master->regs + REG_IRQ_MASK);
> > > +
> > > +	ret = devm_request_irq(&pdev->dev, irq, adi_i3c_master_irq, 0,
> > > +			       dev_name(&pdev->dev), master);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	platform_set_drvdata(pdev, master);
> > > +
> > > +	master->maxdevs = MAX_DEVS;
> > > +	master->free_rr_slots = GENMASK(master->maxdevs, 1);
> > > +
> > > +	writel(REG_IRQ_PENDING_CMDR, master->regs + REG_IRQ_MASK);
> > > +
> > > +	spin_lock_init(&master->ibi.lock);
> > > +	master->ibi.num_slots = 15;
> > > +	master->ibi.slots = devm_kcalloc(&pdev->dev, master->ibi.num_slots,
> > > +					 sizeof(*master->ibi.slots),
> > > +					 GFP_KERNEL);
> > > +	if (!master->ibi.slots)
> > > +		return -ENOMEM;
> > > +
> > > +	return i3c_master_register(&master->base, &pdev->dev,
> > > +				   &adi_i3c_master_ops, false);
> > > +}
> > > +
> > > +static void adi_i3c_master_remove(struct platform_device *pdev)
> > > +{
> > > +	struct adi_i3c_master *master = platform_get_drvdata(pdev);
> > > +
> > > +	writel(0xff, master->regs + REG_IRQ_PENDING);
> > > +	writel(0x00, master->regs + REG_IRQ_MASK);
> > > +	writel(0x01, master->regs + REG_ENABLE);
> > > +
> > > +	i3c_master_unregister(&master->base);
> > > +}
> > > +
> > > +static struct platform_driver adi_i3c_master = {
> > > +	.probe = adi_i3c_master_probe,
> > > +	.remove = adi_i3c_master_remove,
> > > +	.driver = {
> > > +		.name = "adi-i3c-master",
> > > +		.of_match_table = adi_i3c_master_of_match,
> > > +	},
> > > +};
> > > +module_platform_driver(adi_i3c_master);
> > > +
> > > +MODULE_AUTHOR("Jorge Marques <jorge.marques@analog.com>");
> > > +MODULE_DESCRIPTION("Analog Devices I3C master driver");
> > > +MODULE_LICENSE("GPL");
> > >
> > > --
> > > 2.49.0
> > >
