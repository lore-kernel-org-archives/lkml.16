Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2104.outbound.protection.outlook.com [40.107.21.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C1221B910;
	Tue,  6 May 2025 11:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746530712; cv=fail; b=ii750jw7DsXRn5hq5sbJLTzV5yLpKZKrv/vNkyuV2mzD8ERRnPZzhvc1t/+O8RYJRKfBIYsRXIkvu8+7KgLqxtyuMezrdgKPLSIA7Jku2alPVY05uNCMDWit8fPtgQNzG+1Zmg6qcrZVGVShPb03m35Zovv4sSLz6QvlH+5NoYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746530712; c=relaxed/simple;
	bh=fTz2Rl/rF82hxsfHJ7rHNICKRBDgFG31ZGfvVzQqs3M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jqKAgjusxetA8sKdnr3ca9M98vQ0qk/YMKy/N/RTXE0jtz0/xXV5f964nJ2Ik+OEIBG3sYuN1OuT+8cbVBPwYR6NGbjKpfZoUTpbbYewp9ciUJvH8TQ+j8YrSb4tfKdSql7uM1koaqJngX4YO+SFJceYdU6JT5IbJndwOn/9VE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=OPxArYS5; arc=fail smtp.client-ip=40.107.21.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="OPxArYS5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G7W/8CAyzeEOSMnas1Voa/u/dsrY9WMP+GFWpqurOyiJM6CMSvMSQ9NXsztbcCnyzYaH0/M1knFDyqzMQwyOItQLhh5knfGfYNvu9wgZGrnUThbkn/EtBZGkGGKm1+/AW5JcQ+XlUs7IBXlole+tevtITE21bW+A1TsZFFXYWYgSfVxsKkDMFvu0kA4bMdyIvt0qH+28mibRFYkSv7hw3zOgwrw/4Cug+79J9unPJJ7kfQln2qFu85fBrZ830e/QigCCRfZkOIaY8v4kIErQvs4h17FGLW273P4I8lo6CqjpFtRT2b/TpomGENVUlniz0wFDryFTXu774z83mMRrrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbzv4QwHBzexPLJRjBnyyxv8zbjM0Wf/De5jjcjGd9I=;
 b=BcrdY4a/0Ft6O7HUH6vxZb+jAqOgY9Gn9RW5zTs3CAEuUfEd/6qLVzkn/8RINZ4JPva2i7mRdKkTOepYbc03270/SaPaeh0R6fIp1rudwL6GnqW8UecOxXbik4mOSFkPBMON31KHu8KqsfTbxy8blJ/t9CO3LGv8d81eR6eZYU26eIeUNs5kN8m/R8RCwftLiSKO4RrKITaDWTM8y16F5QltXAphCdtZRJQ43G3Ag7pAhfqlo8+ftcPEZ1kD5Bu2lYRpfqExonRG0fn1uokypM+j95/AGiQ2HvHSFvfN89LknjmbxBM29sv6OqlJ5KIjoDuS7d4xYi7u5NkIEiqR8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbzv4QwHBzexPLJRjBnyyxv8zbjM0Wf/De5jjcjGd9I=;
 b=OPxArYS5RhxQFiu7hY36alSVeMuxiRtZoNV2YG8BSZOWW3jZfplcgQSgu8B5unDnconmuNazkBkZp9NpUOcZg/ZOXfGEPVSccp2xyX763TC1Z5uPA45147JI1NPWSHNFyJHBRoq1xzgG7a/YEIPfxhyFfyWyN3/1NDQQygvo2eSssRPTpg7faKDz6WvZQn96kNeoLoLjaBgyCfociwfu0ejE8/3r2VWz1K1Vg/QBkOprLoBbzPVxnsDFm0Q4ClZpxznV05h8nKKi+UDVPmLlrK76+ELeU5gNGS+sDqS6yZE9cZE7FToH/T+NMUvrYk2wZ6UOd9aSe5PeVAr2Ohe2DQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:248::6)
 by GV1P195MB2035.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:5d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 11:25:04 +0000
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981]) by VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981%4]) with mapi id 15.20.8699.019; Tue, 6 May 2025
 11:25:04 +0000
Message-ID: <6ac1c6c3-a1fb-4e30-8ab3-9fabffea41c7@phytec.de>
Date: Tue, 6 May 2025 13:24:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/11] arm64: dts: ti: k3-am62a-mcu: Add R5F remote
 proc node
To: Andrew Davis <afd@ti.com>, "Mendez, Judith" <jm@ti.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hari Nagalla <hnagalla@ti.com>,
 Beleswar Padhi <b-padhi@ti.com>, Markus Schneider-Pargmann
 <msp@baylibre.com>, Devarsh Thakkar <devarsht@ti.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250502220325.3230653-1-jm@ti.com>
 <20250502220325.3230653-4-jm@ti.com>
 <50039c49-a6c5-4f29-a35a-53b9af117fd8@phytec.de>
 <6c5e786d-7581-492f-92fb-be92ecbecd87@ti.com>
 <31d32966-05fe-4369-afda-3278822d8cb5@ti.com>
 <646350fd-3dc5-47eb-ab1b-1a6a9acd69a8@phytec.de>
 <84e6413e-4a61-40a5-acc7-85da76e6d540@ti.com>
Content-Language: en-US
From: Daniel Schultz <d.schultz@phytec.de>
In-Reply-To: <84e6413e-4a61-40a5-acc7-85da76e6d540@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0209.namprd03.prod.outlook.com
 (2603:10b6:303:b8::34) To VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:248::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0P195MB2484:EE_|GV1P195MB2035:EE_
X-MS-Office365-Filtering-Correlation-Id: fee3b3e9-b9cf-4b5c-8841-08dd8c90a5d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVp2NEMzc1VqV2xmbUVzYWIyaEY0Z2gxaThJelNlcGF4Q0t4bksweXArUmtz?=
 =?utf-8?B?YTdqU2dvYkkzTkI5YkJ4ak9aMzVrVm40anAxNEZBRWxxN1RPK0VCa2FlM0VN?=
 =?utf-8?B?aHZuQVB5b3ZBV2tVTXU1cVBFcGY4VjdDZjdGVzZ5ZitqZjM4VzV3WFdYMnRM?=
 =?utf-8?B?NENvSFBpd3MrVmZJK3JUcVFhZHArSnp6YU9RQVk3S3pkNW1oMjNaSmF3Vmlo?=
 =?utf-8?B?bGhtV1ZOZHFxMXUzT2tsYjhTNFBQTmN5V1BSOWVTUGtHN0Z1VWo1TlpPNGsv?=
 =?utf-8?B?Y25qYm1XbUFoK1FpVEZNRWE4VmdwYUlwMTBQb0dTdGRRV0VKR2ZKc1BURVRw?=
 =?utf-8?B?eGRDTi9iOFRaOFhBZkd0QnFPVnVzTkZzVTdTWjc0VlZNTXQybEpPemNqWll4?=
 =?utf-8?B?RTJCK3FhNzhJSjRNMUpGc1gyL29KZldUYTlnVFo4cUFiRHd2VFJrNG1sK1RW?=
 =?utf-8?B?S2FTajdtMk1rTyswNUZEbnVRMjc2eHFXV2dWTVJVd2tWVW5EM2hVcFZqRWxH?=
 =?utf-8?B?OVJXbC9JQXMyTnVLUmZ6UTJrY0Yzd0docGk5UTkvY1lNUmlCV1BvR1o4NHFN?=
 =?utf-8?B?MlFhNm5yaWJOanlSZVlBaDVXNndZWDUwNEtWMG10aC84cGZRMU5YYUpHVkpW?=
 =?utf-8?B?MWxCNk1Od0htSDlWU25MRXZEQVRWSWdFbTRjdlgzWVNxdldnMjltcmVNYWdM?=
 =?utf-8?B?eExDN3loOWJDQ1k5YlhjZXMzRzNnWWZkU2hKdXU3c2pGbkE0b0RHTEVUeHNa?=
 =?utf-8?B?T2V0ZHlvVTkzNHhkUWpYUVZoM0VBK2lSUWM3TEs4NWx2RVdHNWNCQWNYMmht?=
 =?utf-8?B?cTkyL2orb0NlU2xsb1FJNVB1aHdnVzNncUx2cXhvUE9qSGhlVVhVNEEvR01y?=
 =?utf-8?B?eFFKalNGbTJyOFJwWFJueGxaemdDZmI3cWlyTEF5UnQvTU8wbW9zTEZRNVR1?=
 =?utf-8?B?ejBMNWh1RWVlSHpjY1BHakFNMGhWdGpRdS9RU0YvSnVVSDI4bHBOQVlPQ08v?=
 =?utf-8?B?QU92SzRaLzZHaGdnWThaZlZ2eGR6cFo2ZnRDQTZyU1ZyZzRWekJGazYvNjVB?=
 =?utf-8?B?dFZjWW5WL1NUeDQ4LzFEQkNVTUhOM1RKbEErQkV3eElPQUhIbWt6cENJeERI?=
 =?utf-8?B?SExWaEZvU1o5TVA3b29DMTNYN2RYUmVTd2tHTnhhc2RqVWJOTW5uRmgybWth?=
 =?utf-8?B?VTEvWWVKdnFuVEt2Z0IrL2hSL2JRL05sTWFxYlNrV0pKNkd4TTBNMzltVVBq?=
 =?utf-8?B?STUwVUVUNWRtU2g5WXlOQ0JoTk5oNmw2bW5BTzlyVVgwekhYaTY4QVc4QWIr?=
 =?utf-8?B?dmxvaUxwajJzamgrSjhqaHNlRWQ2RElTNmJXZDVHK0VNTHdHWWlIaFZLdDJD?=
 =?utf-8?B?ajVvYVQ1OVNTek1heCtMY0RGb2Y2aEkyR2d3dFpyWkpZblBOczZWQUpEcXV1?=
 =?utf-8?B?RkRHazI5T3JzMHduNG90V0FNaGNQUEtKUEs5UHFtRmUyaENEcnVJV3VOVXo1?=
 =?utf-8?B?MGdwTENJcSszbURveW9IMkl5bitjQzhJWjNTUHZmWXZxa1RKbmRKeFRFN2ZU?=
 =?utf-8?B?K01RY21tMTFvOUF2cjBiNG5JUjVHdE1YVjMyNk5HbGxtQk1IV253Um1UOU54?=
 =?utf-8?B?N3Viejd5UUpNb0ZvT1p2OE5vTEdib0Q1VEhRK0dnM3pBcytrWVdZZzJPaCt1?=
 =?utf-8?B?Y2dCWnFRcnhOZFc4MUhOS1dyOW9FajJ4Nlo2YVhFWjIvVjJETVRnZ3g5ZU1p?=
 =?utf-8?B?eTRqY29aTGZJTzJ6S1Q4NldYTXA1dTEvVkUyWktnWGdiVmc3aFJ1dVZlSWZ1?=
 =?utf-8?B?V3VHTXZIbVVoZlNraTdvRnBWbTUwRDdFTlRsNjJ4bmpIWDlBbklpRVZHS0gz?=
 =?utf-8?B?ZktBTjJJRytONWl3WFpIZ1ZHY2NiY0FHdzR5endzY3o5bEYyZTRmVUZXM2dG?=
 =?utf-8?Q?QcGG6Ck2sU8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0P195MB2484.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzhLV0ZxWEVubVdxTFBESTcrZWtyb0pITThpVVRqZ01lOVVROTEvTitudE1l?=
 =?utf-8?B?YWhhSHJ6emRPbDhoRk1ZSlNaSWlvOXg5ckt5N2tSLzZjUXFCQVNGa051SDAz?=
 =?utf-8?B?Y2d3ZFc3d2dZeFRPd3l2b1dSM2VFSndWelIyQ1pkTGtBU1BReEdGQmdMMGJy?=
 =?utf-8?B?WGVOK3BRRXNLWDI5WmlwOWpWLzRiVDdORjdENkNMWTk0RlhYMjdTb0NYSm5B?=
 =?utf-8?B?RkVSbkVRZlhJbG9UcXB5amhiZEFoWHZyOERhVzFzd2VrRzVaSFBSY3UyOG04?=
 =?utf-8?B?SUtiQ2IyUG9EUjNZTWc1ZGNEbFBQWDBhL3ZKZ0lKVkt4MExoTkhwc3MyaFVh?=
 =?utf-8?B?aUFySklZejZxN0tKQi9RaStWcUFGNHBtUll6Zkx3T2laR2prQ01mYjZCVm5C?=
 =?utf-8?B?dm5oL3d3a3FKTURHb3hDTUlQSzZuQTl2aitEOW5sRmg1UE96UEpZelFkbEdP?=
 =?utf-8?B?MFg3RFUrTm05SWRmaXRlLzlUdGZQYkYybWo4YXRXVGdsdEloK3Y0Z3E5NUhx?=
 =?utf-8?B?dDlRV29Qc3JNV1k4UnppUXZCRGdYSWgrdWdOVkJHUE4wTUJkY0VnSnh6bW1a?=
 =?utf-8?B?SlNadHZEWEkzbW9vK0N2ckdhZm1QWEFxNDFQMFZGVVQyam1mdmlUUU1kZkJB?=
 =?utf-8?B?ZEphZ01rMG9ueTNoY3hBVWhldlRLWDZQbmhmbDRlZlVMRzBKQ1RZb3V0M3RN?=
 =?utf-8?B?UzJWbnNISHZDTUJOa21CN3NkazBnK1FrZFJiTGo4Zm5IT0QwUkJCb3IwRkpM?=
 =?utf-8?B?R2M3cVRsdzVXdXY4OElBUUtVcmdEM01iUXRiK0Vhd29mWmV6eGcrODVTK21l?=
 =?utf-8?B?ZFRMQlBUN1lpVVMxdThDRnRTd1VzLzBlZ2RROGwxTmoxR0hsTEw2a0tTalpW?=
 =?utf-8?B?S2I3N25RWUVTUzJFVURWMUpxYzhNeXBkZVVneDYvMkdmSGljaGpPb09sTUhB?=
 =?utf-8?B?dHNWVWlBR3liNXRrSUw2N1ZhQUlkNWlwekNJSEdnUkpzeXM4ZTV6d05DTlJx?=
 =?utf-8?B?eXFWQkxEeFdnSGJiTEJudlJtd3d4ZTEyZjlhMHRLeXlQWXhkUzFIbmRQc01G?=
 =?utf-8?B?S3dSUlpmclBNaWFNY2dleHlHdFU1WE9vZEgvelN6a0dSUEdtWCtYK21rQjN4?=
 =?utf-8?B?L2ZUd0hzbkxGcjJ0ZVBvd3FXTjVlcGlPdlJESHBDdmpBaC9YcWh6ZlRoak5h?=
 =?utf-8?B?V1IxZkFMazV4dkpLVUlRV0RGd2IzZ211eVVyMmVCQ0dldjNUemV1c21jOEhY?=
 =?utf-8?B?b1FmVkdCMC8zelF2NHVUQUkxSlZCZWdLRGp3SGJObDFESWd6WkxMWnZKRnJk?=
 =?utf-8?B?UjlkRXhwOWErdUYvN2lEelhKbjloZ0lQdWg0VWRsNkpMT3BoVzlpMkdaa0tt?=
 =?utf-8?B?OFNUOGhHRXoxVmdCRlJ3L2FUaXl5UXR5UCtZUUQxbHhjb1V5T2s3N1hyblND?=
 =?utf-8?B?RW5zdXo0UlZuSVRkancxL0VZK2k1NEx2d1BjMFhXNVJOalk1bW5rVmdlQWcr?=
 =?utf-8?B?RURRTHladUo2QS9hL253QnFubWJnMjFXbHNGVit1dEtCWUtkenN5NXdTOEFw?=
 =?utf-8?B?RHdVdVUrWURjdzluNWxoWlVsL3lqTEFGTXFVeTlRMzU0MG11Zm50RG1wTlBx?=
 =?utf-8?B?cUljZzFVZjVWK01XbmNUcURNNWQ2R2hodlllVEdzTHJidElac0tNUHM2SFNH?=
 =?utf-8?B?MDgwWDU5bll4ZVpqUmFsWFNWSXh5YjN0MC9kZDNKYWNScmpMakVpRkVxMXJK?=
 =?utf-8?B?bXZOTm1oRFNha2kxbDhWVGVvL3RBK1pMUUhCa3UwbGNTUjJmcVNsMy9DeENB?=
 =?utf-8?B?TFAzTHBYM01zd1U3Uko4WWtQZStmWitocXZLWEd1Zm5UejlockFpRjlIUmc0?=
 =?utf-8?B?MStGNEF6dlZYN2Jqb1Z1ak9pVVFSRU5ZY1cvbGd3NG9rMTRBTXNFUzF0OE1z?=
 =?utf-8?B?Mksvdkh2QUlGRFFmUXJ0S2dObXFjM1pyY2U2ZlcxdXNmUHg4d0E3SGE1RVVo?=
 =?utf-8?B?VmIxd2NZMndtNVA4M0pwSkR4Z1I3aXhkQndJam10WDdGd0xzazdHa0p3VVVV?=
 =?utf-8?B?U3JxRERJL01FSEFtcmpLZkJPQ2hYNUtPb2ZQYVIrU1ZadS9iL1g3QUtKMlg1?=
 =?utf-8?B?a0E4MkhSeFExOFJpQVhES3Qzb254dFRQVkRUaUJ0dk1EejVDQ1pWaHlQUkky?=
 =?utf-8?Q?ZSia0PhURS/MgQBSawJ43ktCJmoZRh0YbZiehb74Ob2S?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fee3b3e9-b9cf-4b5c-8841-08dd8c90a5d8
X-MS-Exchange-CrossTenant-AuthSource: VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 11:25:04.5663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qyjOktXEUmhmwyyfUsA2XYkRBx/DtwLhYQ8O3Uap9EA6AxE4CU6N+LPvbARQz4+sxqQ1F7Uq1p0qB+iMWs7ZpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P195MB2035


On 5/5/25 19:23, Andrew Davis wrote:
> On 5/5/25 11:00 AM, Daniel Schultz wrote:
>> Hey,
>>
>> On 5/5/25 17:22, Andrew Davis wrote:
>>> On 5/5/25 10:05 AM, Mendez, Judith wrote:
>>>> Hi Daniel,
>>>>
>>>> On 5/5/2025 4:55 AM, Daniel Schultz wrote:
>>>>> Hi,
>>>>>
>>>>> I'm unable to load the latest TI firmware 
>>>>> (98efd20ec71f8c1c8f909d34ab656731) with this patch.
>>>>>
>>>>> [    7.012889] remoteproc remoteproc1: 79000000.r5f is available
>>>>> [    7.032640] remoteproc remoteproc1: powering up 79000000.r5f
>>>>> [    7.038626] remoteproc remoteproc1: Booting fw image am62a-mcu- 
>>>>> r5f0_0-fw, size 53140
>>>>> [    7.057209] remoteproc remoteproc1: bad phdr da 0x79100000 mem 
>>>>> 0x47ea0
>>>
>>> So this looks like the firmware has sections in the SRAM region. 
>>> That would be the
>>> issue here.
>>>
>>>>> [    7.064716] remoteproc remoteproc1: Failed to load program 
>>>>> segments: -22
>>>>>
>>>>> I figured out that the mcu sram node disappeared in v5. Apparently 
>>>>> adding it back manually doesn't solve this problem. Any idea 
>>>>> what's wrong?
>>>>
>>>> For am62ax, there should be several items changed with this v8
>>>> series in order for remoteproc to work with the TI default firmware:
>> What firmware did you use? I was using the latest public default 
>> firmware from ti-linux-firmware.
>>>>
>>>> 1. memory carveouts were reduced to 15MB [0] & edge-ai memory
>>>> carveouts are not included here
>>>
>>> This shouldn't be an issue, the default firmware doesn't
>>> use the extended carveouts.
>> Yes, this is just the echo firmware.
>>>
>>>> 2. mcu_sram1 node removed [2]
>>>>
>>>
>>> So when you say you added back the SRAM node, did you also add the
>>> sram = <&mcu_ram>; in the core node?
>>
>> With that property added, I can load the firmware again! So, what's 
>> the problem with adding this sram node and did you remove it?
>>
>
> Good to hear that fixed it.
>
> And we removed the SRAM node as I was unhappy with how we were 
> handling reserving it.
> The firmware should declare usage of shared resources like this in its 
> resource table,
> and the RProc driver should dynamically request the same from a normal 
> SRAM pool.
> What we were doing before was to statically block out the whole SRAM 
> node for use by
> the R5, and the driver would unconditionally map it, even if it was 
> not used by the
> loaded firmware at all.
okay, that make sense.
>
> I wanted us to fix the above before upstreaming it so we left it out 
> of this
> series. Next cycle we should have the better solution ready and posted 
> for
> upstream.

thanks for the feedback. We're still on linux-ti 6.12 with this product. 
So, I don't care if it's not fully working yet. I was just preparing our 
device-trees with R5 and C7 nodes.

- Daniel

>
> Andrew
>
>> - Daniel
>>
>>>
>>> Andrew
>>>
>>>> If you want to catch up on the general direction for this series,
>>>> please refer to [3]. atm remoteproc can fail with the default FW,
>>>> but we are trying to move away from that firmware and this is the
>>>> first step in that direction.
>>>>
>>>> [0] 
>>>> https://lore.kernel.org/linux-devicetree/0ab5c5ec-cde3-41f1-8adf-2419b31497c1@ti.com/
>>>> [1] 
>>>> https://lore.kernel.org/linux-devicetree/04e77daf-e775-44fa-82bf-8b6ebf73bcef@ti.com/
>>>> [2] 
>>>> https://lore.kernel.org/linux-devicetree/32358aa1-0c02-4f4d-9782-2d8376c0d9fc@ti.com/
>>>> [3] 
>>>> https://lore.kernel.org/linux-devicetree/e131298f-3713-482a-a740-ff89709270b4@ti.com/
>>>>
>>>> ~ Judith
>>>>
>>>>>
>>>>> On 5/3/25 00:03, Judith Mendez wrote:
>>>>>> From: Hari Nagalla <hnagalla@ti.com>
>>>>>>
>>>>>> AM62A SoCs have a single R5F core in the MCU voltage domain.
>>>>>> Add the R5FSS node with the child node for core0 in MCU voltage
>>>>>> domain .dtsi file.
>>>>>>
>>>>>> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
>>>>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>>>>> Acked-by: Andrew Davis <afd@ti.com>
>>>>>> ---
>>>>>>   arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi | 25 
>>>>>> ++++++++++++++++++++++++
>>>>>>   1 file changed, 25 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi 
>>>>>> b/arch/arm64/ boot/dts/ti/k3-am62a-mcu.dtsi
>>>>>> index 9ed9d703ff24..ee961ced7208 100644
>>>>>> --- a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
>>>>>> @@ -174,4 +174,29 @@ mcu_mcan1: can@4e18000 {
>>>>>>           bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
>>>>>>           status = "disabled";
>>>>>>       };
>>>>>> +
>>>>>> +    mcu_r5fss0: r5fss@79000000 {
>>>>>> +        compatible = "ti,am62-r5fss";
>>>>>> +        #address-cells = <1>;
>>>>>> +        #size-cells = <1>;
>>>>>> +        ranges = <0x79000000 0x00 0x79000000 0x8000>,
>>>>>> +             <0x79020000 0x00 0x79020000 0x8000>;
>>>>>> +        power-domains = <&k3_pds 7 TI_SCI_PD_EXCLUSIVE>;
>>>>>> +        status = "disabled";
>>>>>> +
>>>>>> +        mcu_r5fss0_core0: r5f@79000000 {
>>>>>> +            compatible = "ti,am62-r5f";
>>>>>> +            reg = <0x79000000 0x00008000>,
>>>>>> +                  <0x79020000 0x00008000>;
>>>>>> +            reg-names = "atcm", "btcm";
>>>>>> +            resets = <&k3_reset 9 1>;
>>>>>> +            firmware-name = "am62a-mcu-r5f0_0-fw";
>>>>>> +            ti,atcm-enable = <0>;
>>>>>> +            ti,btcm-enable = <1>;
>>>>>> +            ti,loczrama = <0>;
>>>>>> +            ti,sci = <&dmsc>;
>>>>>> +            ti,sci-dev-id = <9>;
>>>>>> +            ti,sci-proc-ids = <0x03 0xff>;
>>>>>> +        };
>>>>>> +    };
>>>>>>   };
>>>>
