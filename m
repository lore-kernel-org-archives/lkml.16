Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7EE1714B4;
	Mon,  9 Jun 2025 09:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749461246; cv=fail; b=DY9t2qgDBJyLLsq/01716a7/66ywdV9eM4J6QwDcNq640EhXR5T3rlA0MQvpP4LzpD/QvzL9IkmP/8yOEaVXhbktU2Fbe9BreahOUP4VxiRu4XzWnOCKjc4xNokyQ6/5oKe0V5fGDT+rWZ9InGW+6OnfeaRdWfKoeShB9qLGId8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749461246; c=relaxed/simple;
	bh=uhWvKygWEmXQy+sldPDmUq/0ylge56BPjSqzVwZiU80=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OD1zLs25kMrvyKqV4jr7t/F+5GVIsBktq5qzCzrEAd7MQqyJd17+SyqXJX+VGG75cPO2ksZ1p678TfH/vdpaZDRE6WKUqcvX9A7eU47lPvYpr2OwelCErILrYHdwcjY2NZnzC7ZUTgxZhGl1hhRPY2u61zTJpXgLgcUMR+4/B88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Gzft1dXy; arc=fail smtp.client-ip=40.107.244.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Gzft1dXy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mv3FCDm5tpNEzZRp4ZJbektBxJ4P5mBqqOk9BhPqsZz0m5L1mABKpBz4ZPpuFomN/qrxXZPqM8At5OaNP4965dAg5ET+SqMj5WfbPAWtc7wdMK7lxaUO/khEsmF9raZA8UaBt3odFb5wAk32QQtz0caZYIfctHexlsim55VotGDDeH9Q9Yd8sEKPAktUJ0gUTcxy1KOvXws6orF3lIU2GYtm29Y9bJRaZrmQdyjZUIjitKD12R8EVq1PY0LV5bmy7sYAZQBvV6c8oPKxGcFOC8Cr9dO5RH2rZE91PYcmrXTArTq4M45XuGuECLfHjb/meftVAIJhszM1xlAX+ynD9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uhWvKygWEmXQy+sldPDmUq/0ylge56BPjSqzVwZiU80=;
 b=s/49usNtEADFoxdtiezF8t7ZRXhUEtU6Uh5AAj07CmizhEALc0ESLvImADLoXYNEo7Xua2Q5cbofdbjA+0acLhrDcA1NQNT4SqfDK7UwlY+4aAj130wJ4kWKlFB1ygRth/jdQ02KzITpH/+TKjovDjBwKzXYlANSWfRweiNl0dNbaOYdKNQsGSsG9l+ZlwmCZiF7RBRN20ox5IHFmVR0OUb6SyPUWRp4DZzIjZrlP9Xc67qr8f/bBbGJxc2PTXt+5teBDZzOrcocJlq/tdNKLggeFbFh7VtavP1KXzgzeOLWJDCex1StUoi9k4AkZXuePP8z2ZRFtC7g6K4xDkiXlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uhWvKygWEmXQy+sldPDmUq/0ylge56BPjSqzVwZiU80=;
 b=Gzft1dXyQ5t1vkXH8gL6+9WcqNpPKTjn02ITxZm10LhJpV5SjKp0/2dGuG3/pwd6NYeOE156BcPKpWqLzut4zSckNUjYm6C49h4vNQE/AI0jAluDGFpUK+ostwpYrwsHnktI5SKFWT0R9JQXjaPOtLPTYt2nvpkfa1edu+jOoknAxbjK2XpwlL6BYvtzYOk/7f2kHf7VlwoSIzEaO4xB67ITFIGnDgsUXTuZoxk/RgGYQkwF+/Afm7mcVyAmRb5Da9PZGQDmxHtyGkyPFP1cb4cOEt4nYy0E85vpqDQ2hdLtMFK+isUeqMS/LxTRWp5/Y1/5uBrBLkEOlOFIw1UqYg==
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f3a) by DM4PR11MB6216.namprd11.prod.outlook.com
 (2603:10b6:8:a8::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Mon, 9 Jun
 2025 09:27:20 +0000
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::a7eb:da5d:125c:3345]) by DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::a7eb:da5d:125c:3345%5]) with mapi id 15.20.8813.021; Mon, 9 Jun 2025
 09:27:20 +0000
From: <Manikandan.M@microchip.com>
To: <tudor.ambarus@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<pratyush@kernel.org>, <mwalle@kernel.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v3 3/3] ARM: dts: microchip: sama5d27_wlsom1: Add
 nvmem-layout in QSPI for EUI48 MAC Address
Thread-Topic: [PATCH v3 3/3] ARM: dts: microchip: sama5d27_wlsom1: Add
 nvmem-layout in QSPI for EUI48 MAC Address
Thread-Index: AQHbyh6Tkpoizvmt60egXf7veFuZgLP6mbsAgAATawA=
Date: Mon, 9 Jun 2025 09:27:20 +0000
Message-ID: <759e4a1e-6af4-4bf9-9a95-01a7f6faaf46@microchip.com>
References: <20250521070336.402202-1-manikandan.m@microchip.com>
 <20250521070336.402202-4-manikandan.m@microchip.com>
 <a15fd377-1828-4cb5-8c7b-7d26ea2a7733@linaro.org>
In-Reply-To: <a15fd377-1828-4cb5-8c7b-7d26ea2a7733@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF9623118BD:EE_|DM4PR11MB6216:EE_
x-ms-office365-filtering-correlation-id: 16ebb60f-3667-4983-a240-08dda737d565
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?MjZuV0VGM1RoYlRSeG15cnNvNkpmQXVLUmtRVExVRnJIUDVzTktKUXcvcCtm?=
 =?utf-8?B?UWxuSTM1a3RnY2tteW1MMWdvZ0dBMVNIR2ZFamdDampqV095aTM0cUdUYXA0?=
 =?utf-8?B?c01TMzBvVmIvU2g3MmxHTnZVSmR5SFNpcUhWWnRvVGZiRzh6WklVN1JLRktJ?=
 =?utf-8?B?TzlhcUdVZjROd1ZCSlVGTjUxZFpMb0xtRXlVV1Q3eU9YSFZXNnJjREUzSTZa?=
 =?utf-8?B?R3kyYzhtQ2pCZ1lUSEExUTZWWnhzVVdiUkhGQklYV0l4c2hsdkpjcld1NDYr?=
 =?utf-8?B?TXVSVXliOFB1YlBNNzVaZDlsYWJhSWlML3MyNWp5Qm1NYmM2K29oRmtDMmcw?=
 =?utf-8?B?WThGSDNnQlRuQ3RtMUtXUWpEU013TEQ3aFlZdGFJSTdXb2Y4TlR0S1RvQ3Bj?=
 =?utf-8?B?RG55akZtOEZFTnp0U1I5Ly9xYkJSWlIxVTJFUFRzOVcrVXBvNStnanZuUFha?=
 =?utf-8?B?Z24xSm1QVHh4WlZRSTJxcXJNVEpZZ2ZmZE1zMDMwQnVRZllGRG5ydndhdkd2?=
 =?utf-8?B?Qzlob25mL05NM1VLdVBrMllBdDdmNTJOVXlxVktQS3JQdkVJeTRhaERwUUUr?=
 =?utf-8?B?MHZSR3ZQZjUvUnFOclhYU2ZEWGJYVi9IWkNEdkIxaU9qMzNpR01LcVVHMmwy?=
 =?utf-8?B?Y1RaQ0U4MWU3aWtpTmVJaFFwVm9odTRlTGtycmNpeXpycER1N1AzNUFEMXE1?=
 =?utf-8?B?cG1iQTkyY2RldDBrajJnTnBLdjczWnBtNEMzYjZsQ0dWazZoNXNoR3Z0QXdk?=
 =?utf-8?B?VW8zbkFudlA0eWVxNXQ3bkpWc2F6T1V3UkY3NUdjSkVYR2VyVEtCa05jcEV2?=
 =?utf-8?B?cmlrM1cvMEwzREh2bC9PTGpuWkYvN1NmOUtGYU5PWGR5cXZoVnF4S1pDZGVE?=
 =?utf-8?B?ZXo1c2FkbVhXbVZUYkh2bjVlRlRrK1I3UDl1N01jeG9mbzg2Y1pYVTNJZGpJ?=
 =?utf-8?B?WmFublNPam1oa0tIR2tJeUJ0S0dJR29Gd0tLWDRUSzUvMEoxZ2lHaW9HakEz?=
 =?utf-8?B?cUgxVGVDRm80M25kekFOOUJaeHArUzh4QnlQZ1VlZjdaUDNwaXgrdlF6OHB3?=
 =?utf-8?B?SGcydWNnWEl1VS9mL3NvTy9QdnlQM2U2OHh6REJVVTlubjdHclhXcDZnTEo3?=
 =?utf-8?B?cVRBUVpTQzdGTG1TM0VLS2pKcFJJZEhyekNiZkloenExK2QrWldtbWl1ZnlC?=
 =?utf-8?B?NzFpUGFsazBZd1ZoK29zallyZkJLajlLYlFhcWJ5VDNVZzN3QVJ1allYK29G?=
 =?utf-8?B?MGdFZjJiZmlERHNFbktQNElldzU2dTJBWVo0K282RTQvaEpkQ2NUdTR5ODB1?=
 =?utf-8?B?T3FCVk54Nk5EbjhsS091TXMxTWRhUWVaMWtjZU1DRFcrWlNvTXlhZ3Jla1Jy?=
 =?utf-8?B?Rjg0V3ptZXZsMUhacXBONlNFdkxVOGRlZy9lZU9BaUU2VkdzTEVQR215T3RP?=
 =?utf-8?B?THVNSEludzNCRHZ6d0E3ZFhmYkNpZkZVNkpIbFJnQ1lzVEYzNmtjSHhZTzlI?=
 =?utf-8?B?c0duTE1NQkxISTQxSldzQUJFUm5VYVNibnh2YVJTREtLd2YzdVR0R21ZRGhD?=
 =?utf-8?B?VVkvQVhFc1I1OUhzK0FuUWQ5MFEvUFIzbmdoTnFuNlBINDZiaWFpYUd0QmdW?=
 =?utf-8?B?dXJOdHdTUDJzL01rZUVzUGZhZnY0a2tTakNuL01GNG9XS0F0QUZCRUlTUUxH?=
 =?utf-8?B?VVlzcStvRHdBNEtQWXhacEFmUHNLUGxIUmtTZzBMYXR1ZWdCMVlubFhMcmRq?=
 =?utf-8?B?WUFGSENyeW43UGdzVGRqWTRhcnpFQVd4Z0FQbU9maGkyN3Vub3c3c25WQUh1?=
 =?utf-8?B?VDl3OFM3Z29GcmJEK1VoZGhNUWUvbFhVSkNJWTBoMGRiVkN5b29rTVduZll2?=
 =?utf-8?B?VmRqMG9qb0w4YnJ4ZGZsYldIUDJzVzVUTlRsbkJCV2k4QUUxSTdhekJGdFNE?=
 =?utf-8?B?MlBxUXI4ZFJFSFlCeHZvTlFvb1pGcVN3S3UxTFduYTBBNE5uUGwxbjRHanlB?=
 =?utf-8?Q?GmA6bD8zyovLCWjaxydyMWYCggGqwc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF9623118BD.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZTB2d2QxVHBmNVF6YklRcjdyNVh5M2N0dDZXYytYTjF3UktTdTE3c3craFpM?=
 =?utf-8?B?ZDh6N2xRajQ5WjhtcTlBM3FPRHVES05qNFJEeWtSS0YrWjVHSEJmSCs4a20v?=
 =?utf-8?B?N2JWcDZhM3JtSDNRV0VCS0pPMmduRGxodnhHamtEY2NkZkhxbUFDZm1iL21m?=
 =?utf-8?B?Z2JuZlFMUlJCSFFpN0tXc2pNVWd2aGVob1BGQlFBdWtISzkyRGp2SGVhc3FV?=
 =?utf-8?B?NVBWUFM1ZFZpakU1czBUNndDMVpFUm1INDBsQlZETWNPTitDU3hjS1pGbmFk?=
 =?utf-8?B?Z1ptcVZkMmtNeGNvTG9tYzI3RzhwQ0ZEUXJTRmtqNVlCcGxhZWFNN21sTDdy?=
 =?utf-8?B?cXlFZCt3eGFPbTk1UG9SWWd2TUgzR2lZRXFLZndnWjJIVnJTelR4MENITmNQ?=
 =?utf-8?B?TzUxYi9naFBPUlBtUE94S1FkdlhCelJYQm01c3dCSHNrWERqZzFLVEphVjBy?=
 =?utf-8?B?NzVjR0NMMUh5NEY2MkdFSGpXWDljcUNtOFRuaStFT0JqZnZGOXJiKzU0QUFX?=
 =?utf-8?B?N1VsZWExbjdyeXhDY201UUM3NHozenppQVFVMnFyQSsrUFdEVml4dm1DRUZo?=
 =?utf-8?B?MjN4aytoL3ovUEhBeHlnVi9IYmJGRDc1anc4eUlWMHFVMm1icFdYeFgzR3FV?=
 =?utf-8?B?OXZpQVc1RW5CZkZFeEpKbHgwL1Z2cVdpVk9xMjFtdkIzNEx3TjFKYy84QnM4?=
 =?utf-8?B?Qmp5Q3pIN1ZCVFRDcVZ0VnN3MGk5b0QzOGFRa1MwZVpiVjg0bEpWdUtTWmxz?=
 =?utf-8?B?ZXNTT1h3YmJVY0I5UHIvU0xsWXNXaVdqU1pCS0JOdzFuVTdxZXBBT3JvZ3Zk?=
 =?utf-8?B?enM3bG1kbUd3NzJycXAzVmtWVG9vdHdQVmlvMm5na1pNa2ZhSHBSaU1GdmlB?=
 =?utf-8?B?ZVpoOUo3b1ZLaHIrUmRSV1RVYURSOFJKK3ZOSVZvZHd1b1JJbHFvZlQvd3M4?=
 =?utf-8?B?SzJRVXZ3a1E1MjhqS2RHZ1dhOVZ6eVdWYWdyLzZoOXlRaHI2NnJuRi9Ra2RN?=
 =?utf-8?B?czVYRHI1K0I2M3h3N25qMEk0dkM5Q2RCMUlMcTN2RFVrcHhCbDl0Y0VzN2xs?=
 =?utf-8?B?MzJ3VkR5YWJMbHI2c0NYNHQ5YlNFTWF0eWdFeGNRdnRJSUR0ZGFSV1piaVJ0?=
 =?utf-8?B?NDd1cTBMc1M1cXd6M3FKbFVRckxGOWJBV2w5VU5rK2kxMHVKYVByN3JTM2tW?=
 =?utf-8?B?ZFZvTm5zUXUzUUpTWUlTNG8wcFVBVk11MmdvdnpFbEIwanFrVkorSU8xNEJ3?=
 =?utf-8?B?dHFSbGJKVkZLU1BEWlFBdWZmSFI4TEtTY2xkMTRrY3dDZ2NvVitscUw0R1Vs?=
 =?utf-8?B?S3NEdkh1MnMzWEQzclB5cFR5RS9vTHpFS29mdEpvT2I5K2xXYisyc1VqN0lI?=
 =?utf-8?B?aldobkZIbzhIcXZveVJ4VkNNZWV6U2FHQXlVa2ZlNmVXWGNTakt3TkdnN1Q5?=
 =?utf-8?B?SnE3a3pwSlNYdklLZFBWOWk1Mmh2MGhDaFp0MXRtUkh6UjNSSGpHdEVCUXA4?=
 =?utf-8?B?NkxQYkxGWEk1T1NySVl4NGg2U2QwU2ZqN0ZaWTIyNml5SFdQRVh4OGdzT2k2?=
 =?utf-8?B?ZWloTVdPcWhkVTBHdEtHWS9FWU43ajlremZPc0Q1K0NHWTRQSUs4d1pEL3R5?=
 =?utf-8?B?bmVRYTFVUmxSdktmNURNaStXcFpPOVBrYko3REhreVptSUlZclhpVjQvUXp0?=
 =?utf-8?B?N05nc3hndTdJbVg1Uy9NbUdob29tSTU2eWpLbVZESk9RcUpLRlduUGxoZUlk?=
 =?utf-8?B?aG4xMExjc0lPS0tWbUFqVk9NeDBMWHZVWXpwd1FYeVJndkVERUR1SU5kYS9X?=
 =?utf-8?B?cnJ4cy94OHE0ZmRBYmJZYTI4NHVmUkJyWTJhVFROWXREZnFMVTVuU2VUMHpv?=
 =?utf-8?B?cjlpL2YyWDBvcG1mUnAwaTJmekZqMURQQUFTQUx1V0VuMFhTVWx5MlJiUXA2?=
 =?utf-8?B?dkNBQ0pybG1HY1pxMUdvNnJ4MnNwOEJzTlo3Y2o0OWJIdFI3NHB5V2pKTGxi?=
 =?utf-8?B?VmdmUm1CRW1BcUpiSGNPSVNScitlbFE3bld1VzhFaFcyUW9Wbm1FR0pocVJh?=
 =?utf-8?B?alBQSTlyaXlLeGxYMFpGV05LNERpSmpIbmpUUlh6cHY0cWxvSUF6MXliNEpK?=
 =?utf-8?Q?/MfFHc6/iBIZyJFyI3d7HGi1V?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <68527CB0CDFBC945825EDAA053F820C0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF9623118BD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16ebb60f-3667-4983-a240-08dda737d565
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2025 09:27:20.1324
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q0FZn7YE6T72LsVKludUJjUTc5U4TFxyv3fOIjFnxgrn0mNmh5JSUsBKiJM24fu5JBJr7z3a1B7cJt+ICp2yCSHq5j1ooGSqR08k+961ydw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6216

SGkgVHVkb3IsDQoNCk9uIDA5LzA2LzI1IDE6NDcgcG0sIFR1ZG9yIEFtYmFydXMgd3JvdGU6DQo+
IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1
bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gNS8yMS8yNSA4OjAz
IEFNLCBNYW5pa2FuZGFuIE11cmFsaWRoYXJhbiB3cm90ZToNCj4+IEFkZCBudm1lbS1sYXlvdXQg
aW4gUVNQSSB0byByZWFkIHRoZSBFVUk0OCBNYWMgYWRkcmVzcyBieSB0aGUNCj4+IG5ldCBkcml2
ZXJzIHVzaW5nIHRoZSBudm1lbSBwcm9wZXJ0eS5UaGUgb2Zmc2V0IGlzIHNldCB0byAweDANCj4+
IHNpbmNlIHRoZSBmYWN0b3J5IHByb2dyYW1tZWQgYWRkcmVzcyBpcyBhdmFpbGFibGUgaW4gdGhl
DQo+PiByZXNvdXJjZSBtYW5hZ2VkIHNwYWNlIGFuZCB0aGUgc2l6ZSBkZXRlcm1pbmUgaWYgdGhl
IHJlcXVlc3RlZA0KPj4gYWRkcmVzcyBpcyBvZiBFVUk0OCAoMHg2KSBvciBFVUktNjQgKDB4OCkg
dHlwZS4NCj4+IFRoaXMgaXMgdXNlZnVsIGZvciBjYXNlcyB3aGVyZSBVLUJvb3QgaXMgc2tpcHBl
ZCBhbmQgdGhlIEV0aGVybmV0DQo+PiBNQUMgYWRkcmVzcyBpcyBuZWVkZWQgdG8gYmUgY29uZmln
dXJlZCBieSB0aGUga2VybmVsDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogTWFuaWthbmRhbiBNdXJh
bGlkaGFyYW4gPG1hbmlrYW5kYW4ubUBtaWNyb2NoaXAuY29tPg0KPj4gLS0tDQo+PiAgIC4uLi9i
b290L2R0cy9taWNyb2NoaXAvYXQ5MS1zYW1hNWQyN193bHNvbTEuZHRzaSAgICB8IDEzICsrKysr
KysrKysrKysNCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykNCj4+DQo+PiBk
aWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvbWljcm9jaGlwL2F0OTEtc2FtYTVkMjdfd2xz
b20xLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9taWNyb2NoaXAvYXQ5MS1zYW1hNWQyN193bHNv
bTEuZHRzaQ0KPj4gaW5kZXggYjM0YzUwNzI0MjVhLi5iZTA2ZGYxYjdkNjYgMTAwNjQ0DQo+PiAt
LS0gYS9hcmNoL2FybS9ib290L2R0cy9taWNyb2NoaXAvYXQ5MS1zYW1hNWQyN193bHNvbTEuZHRz
aQ0KPj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvbWljcm9jaGlwL2F0OTEtc2FtYTVkMjdfd2xz
b20xLmR0c2kNCj4+IEBAIC0yMTAsNiArMjEwLDkgQEAgJm1hY2IwIHsNCj4+ICAgICAgICAjc2l6
ZS1jZWxscyA9IDwwPjsNCj4+ICAgICAgICBwaHktbW9kZSA9ICJybWlpIjsNCj4+DQo+PiArICAg
ICBudm1lbS1jZWxscyA9IDwmbWFjX2FkZHJlc3NfZXVpNDg+Ow0KPj4gKyAgICAgbnZtZW0tY2Vs
bC1uYW1lcyA9ICJtYWMtYWRkcmVzcyI7DQo+PiArDQo+PiAgICAgICAgZXRoZXJuZXQtcGh5QDAg
ew0KPj4gICAgICAgICAgICAgICAgcmVnID0gPDB4MD47DQo+PiAgICAgICAgICAgICAgICBpbnRl
cnJ1cHQtcGFyZW50ID0gPCZwaW9BPjsNCj4+IEBAIC0yMzgsNiArMjQxLDE2IEBAIHFzcGkxX2Zs
YXNoOiBmbGFzaEAwIHsNCj4+ICAgICAgICAgICAgICAgIG0yNXAsZmFzdC1yZWFkOw0KPj4gICAg
ICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsNCj4+DQo+PiArICAgICAgICAgICAgIG52
bWVtLWxheW91dCB7DQo+PiArICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJmaXhl
ZC1sYXlvdXQiOw0KPj4gKyAgICAgICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+
Ow0KPj4gKyAgICAgICAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDE+Ow0KPj4gKw0KPj4g
KyAgICAgICAgICAgICAgICAgICAgIG1hY19hZGRyZXNzX2V1aTQ4OiBtYWMtYWRkcmVzc0AwIHsN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHg2PjsNCj4+ICsg
ICAgICAgICAgICAgICAgICAgICB9Ow0KPiANCj4gSG93IHdvdWxkIHRoaXMgd29yayBpZiBpbiB0
aGUgZnV0dXJlIHRoZSBtY2hwIHZlbmRvciB0YWJsZSBhZGRzIHNvbWUNCj4gb3RoZXIgaW5mbyB0
aGF0IG5lZWRzIHRvIGJlIHJlZmVyZW5jZWQgYXMgbnZtZW0/IEhvdyBkbyB5b3UgZGlzdGluZ3Vp
c2gNCj4gdGhlIGluZm8gZnJvbSB0aGUgdGFibGU/DQo+IFdvdWxkIGl0IGJlIHBvc3NpYmxlIHRv
IGhhdmUgc29tZSBraW5kIG9mIGFkZHJlc3MgYW5kIHNpemUgdG8gcmVmZXJlbmNlDQo+IHRoZSBT
RkRQPw0KDQpJIHdhcyBwcmV2aW91c2x5IGFkdmlzZWQgbm90IHRvIGhhcmRjb2RlIHRoZSBvZmZz
ZXQgaW4gdGhlIERldmljZSBUcmVlIA0KWzFdLiBJbiB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlv
biAocGF0Y2ggMS8zKSwgdGhlIHJlYWQgY2FsbGJhY2sgZm9yIA0KdGhlIE1DSFAgdmVuZG9yIHRh
YmxlIGRpc3Rpbmd1aXNoZXMgYmV0d2VlbiBFVUktNDggYW5kIEVVSS02NCBNQUMgDQphZGRyZXNz
ZXMgYmFzZWQgb24gdGhlIG52bWVtIHNpemUsIHdoaWNoIGNvcnJlc3BvbmRzIHRvIHRoZSBzaXpl
IG9mIHRoZSANCnJlc3BlY3RpdmUgTUFDIGFkZHJlc3MuDQoNClsxXSAtLT4gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGttbC9EODg5SFpGOTdIOFUuMVVVWDU0QkFWTEFDM0BrZXJuZWwub3JnLw0K
DQo+IA0KPj4gKyAgICAgICAgICAgICB9Ow0KPj4gKw0KPj4gICAgICAgICAgICAgICAgcGFydGl0
aW9ucyB7DQo+PiAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZml4ZWQtcGFy
dGl0aW9ucyI7DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+
Ow0KPiANCg0KLS0gDQpUaGFua3MgYW5kIFJlZ2FyZHMsDQpNYW5pa2FuZGFuIE0uDQoNCg==
