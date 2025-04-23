Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11010047.outbound.protection.outlook.com [52.101.51.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CEF46447;
	Wed, 23 Apr 2025 21:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.51.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745444640; cv=fail; b=BbGw5hk0ZuOa1AZUhAPF3O1AmE/0LPVMgVooic1i5ueaOpXMnLlPgUISHixEvCsye1Yq5TbWabKpfW5oRdTDix9vQZQ/yyxsYHZNt9y0U+oPMUm5HSSTqZtkINCqP/iPeEzRfAkLMy0Gp7hBfjLclZwk5I84Ep36qhpZ5cLPK0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745444640; c=relaxed/simple;
	bh=gGtbsFg2OKzaO89yiwj8CXZMxU7nVsa2fdKuKh+NyR4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lm45IkOBjB0zVA4izyGo7KhU7KyjzaLUFJkZj457QcSyFyMs3PW343Vl+65U0iWn0sEOl94PoCtYmhqnmbU9UM/1LIX/LwXXW85vQTv82fBCcfzS+bp3esE8qYwsJFms7eCXUH4k7vbXtplrXZnsiQbB2nasDr+/tUxRwUuUsGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=J5rG0qZc; arc=fail smtp.client-ip=52.101.51.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="J5rG0qZc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H7z26UDqZkVFEuOJbJWNg+1iaRD/bj7wiBuDj1IhwQYEgdTWI68MG5gwJ7DQqzFHor7bYjnZYWRs8NQrltlFxcxFGpJOIlVjYSCfsYk4DGtb+v22jImCiv6bIxLTkAnFW4VzBHAxDOfYmTluqNkR2OyAh2TTquAdGFUS/72IwAlS8b73Aw+k/yka+9NtPL28+tT/LL8+sHXkRYS+H5I374KuHL5QaM6Eptmj8T5HSvXpOnE2omhUxOFfFVmp5qOjlBXgjn+cckR7Qy95tHZLjRjliKqGpRcFKxyXkS5jaU2Cc6xNhuuLG3sW3eVThLUOOIstiePidTFz5Bgd/gnC7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2UtYAiYMIKbexucH4NUbxn8DUfPTyn+bZg3Scaaog/E=;
 b=gWTqbauFMJD7V9z0Jp73L9KY9JNlmKhaEpdy5fCB4/udUS47yexJ976VqMoaFzm2Cxzg1fa/Ia9lV8t34i87gMDebbgVMMZTRqQUgHkLDH58q5h8zlfuiXQx+v2q0n/UXlDJS/kzDfzOQ6xPay4urXM0EkD3OgDWjjvIupbPYcPo6ISm8zFBQCbXWkKK6YswappBCOHLrhmZvAXSw9s5PoF03CW+Kwiept05kilxCxrOiE2YnIdSSL1tfLWCCsSZHnYbONbjxo2AtRSRDTge0aKZCsXzbV2fwaGmSEnQufKTUypSCEasU/omHqATqdJgx4NmQMsDiQ5JurCMvjIVAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UtYAiYMIKbexucH4NUbxn8DUfPTyn+bZg3Scaaog/E=;
 b=J5rG0qZcVDLRmRkwXeMUtvW/CFiCVvvrdIBSiTrh3jrh0Ew+Nvz5QoPisekeW96BvjwWniZhH3xB7PvndXUaCK9pMX2E5QIHAw3hLsyIARPIbFoTWBSEzMZcBkEwZdm4MrNakgGUJExCNuCkBZ1PmGneR2G+lHF8s5oNy5Lw1piAVxPkdMlgi4MwENKc3W2DzP3w1n1V1RHEmkP5gowDpdHyatLcrGop8kwgEkCLfw1aqZ1uveGPi06reG72HUTXc1/mYN4x3lNUWl3y+5ekKt57+hkjZuU7NhC8xjPDyxi7GpdWGXwwYw8cOXfhjgliZQsLylI3Ct6RfvG9MDLL3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BYAPR03MB3461.namprd03.prod.outlook.com (2603:10b6:a02:b4::23)
 by SJ0PR03MB5952.namprd03.prod.outlook.com (2603:10b6:a03:2d8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Wed, 23 Apr
 2025 21:43:54 +0000
Received: from BYAPR03MB3461.namprd03.prod.outlook.com
 ([fe80::706b:dd15:bc81:313c]) by BYAPR03MB3461.namprd03.prod.outlook.com
 ([fe80::706b:dd15:bc81:313c%5]) with mapi id 15.20.8678.023; Wed, 23 Apr 2025
 21:43:48 +0000
Message-ID: <e9ec2ef2-01ca-4648-b788-d427f05126f1@altera.com>
Date: Wed, 23 Apr 2025 14:43:34 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: clock: socfpga: convert to yaml
To: Rob Herring <robh@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com,
 sboyd@kernel.org, dinguyen@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20250423150318.27101-1-matthew.gerlach@altera.com>
 <20250423200728.GA954453-robh@kernel.org>
Content-Language: en-US
From: "Gerlach, Matthew" <matthew.gerlach@altera.com>
In-Reply-To: <20250423200728.GA954453-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0025.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::38) To BYAPR03MB3461.namprd03.prod.outlook.com
 (2603:10b6:a02:b4::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3461:EE_|SJ0PR03MB5952:EE_
X-MS-Office365-Filtering-Correlation-Id: b96185ab-7aa1-4d21-d1ff-08dd82afe870
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NjJkRjdlUzJPOTVCT0hIQmdjZ2ZxeEkzQzJkSmtyUG9ERGhUVWM5cXMzR29h?=
 =?utf-8?B?Z2cwRXRDS1J6dW9CMzJQeDB0RmhXNWY4dXVaZzIrTlZ3cXBMUGJ1MkQwWTJt?=
 =?utf-8?B?dXNCSVJFZjNhTjZsbzdKejAzb1lldVB3SCtEbERXVXhoVndmZW9pbzBhQ29Z?=
 =?utf-8?B?MU5yY21ZbWhDVnRiRlJULzhZVXVRSktPSU1XTytreEl3RWxWZGZPVkFPTnRt?=
 =?utf-8?B?UHdRT2NlQ0Z6Y1RDeHFDYjZhdWNVTDJiME9PanpmUlFhQ0w0akFHUUpyeERu?=
 =?utf-8?B?dk1wSVVLdzFlei9US1NuVUJNUUNIUURoalRGajdSdTdEaU1Jb0tPckk2cWVR?=
 =?utf-8?B?ckRRT0dza2RJRUQrb2FmUmVvenNiWGRudi84NllSZERaWE5zcFNPTmNVUFdO?=
 =?utf-8?B?REZUWkZ2YXFaNDJzT09ZZGhjdSthdkxTVTFUUHBhQ2ZKa2NFT0h4ZzdWWS96?=
 =?utf-8?B?aUVXZm9meEczUFE5SWk3cnlZOUJtQ0dRRUo0VmIzTjFnOFB1YUZWczczYXJR?=
 =?utf-8?B?LzY1RzNMOTlGM2w4ZkNGK0FrMzVYSDNUcGtWdUVmMGZVaVRid1cwTHNMeXFM?=
 =?utf-8?B?YjVScDIrbVNXN0tkTkpwTkY0anZRN1lEdHlsbkVEbTFzUFovWURmeExyelAx?=
 =?utf-8?B?TFNqb083bWpiUkVXL3E4WkRpTWlodm9MMVU5eVdiM1huOCtvcXFvNjY5UnND?=
 =?utf-8?B?ekpINmpUNUZLY0UrbGxhSFVINTBFZXVaTTJjNjN0WFh1K3Rsa0xZeEZra2Fs?=
 =?utf-8?B?OXRCbk14YTIwMCsyd3NNWHBHNUo5OHpNYklicER1ZFdNVURnWFZsY09XYjlV?=
 =?utf-8?B?ZnhSZUNrUHlCaHYzSmQrN3E0aVFQV0p1V3JLNTJWTHRCSkowV0kyaDh4U2R5?=
 =?utf-8?B?aGN5aVJNajVHMENlSXFPeUpMRlVaMmpOZU4vL21ycGJPNzl6NjhOR1NCNjRY?=
 =?utf-8?B?MXEvbG8vdnNtckRuZXNtV0Z2QVNhQkY4alJQUWhoekptRmp1cmFnN3l2bDZO?=
 =?utf-8?B?aUUyMDI0TXp1dGEzMmtLYnhiNUIycnZqM3laNWI1MFpBSUNuMnM0R0tWQStE?=
 =?utf-8?B?bFVRS1lSc0xMOUtoZjNROXhYb2FieU9aODZveUwzOU5SODkzRkpSR01aaS9C?=
 =?utf-8?B?UkRpUmpyU3pMSXo3em03OTM2S3BVaU05OGREQWFqaUlPdDcvdit2bGdwaC9U?=
 =?utf-8?B?bXhFQ1lLTnI2em5TYXJJaHh3Yldjdmk1Q1p6emJLU3pIZEdtRmNPbVZYWTNY?=
 =?utf-8?B?VHdMYVVhQWlpeW5ZaHhROXVzNHhqd21MRjFTbHVneGRzclQxL2MwYloyYUwx?=
 =?utf-8?B?TStNSldFa2duMm54OEVhRklZWTBINzlGUDN5T0dXbG9JZ1BjUTZCcWVNRmFw?=
 =?utf-8?B?RHY5MkdiQnUrZlh0N0hkNW4wT09lMW9KR0h5eGZuVHZDdXJMWXBrMjFNNVAv?=
 =?utf-8?B?b0NlblFsZ1RzeDMrRDQybUFYWlE5L0pIelBmWW9WeUlBaXdJR1Vmb045cEMz?=
 =?utf-8?B?OEVuTGg0M0d3ay9ZTEg4UmJyeFNxYlI4dEtvWDQrTmhQWENTbTFTQ2V0ejBN?=
 =?utf-8?B?Ui9QWjBXOHZJeDF6YkpGemdvTURYSVo3bXZTUTlWMHkrckhneHVCUUZEM05j?=
 =?utf-8?B?dTlVY1pOT2t2Tmk5RkFxUEVpYStVMGlPL0lDTG1aL0VmalF3TEtCNDNzTUlv?=
 =?utf-8?B?bDRNaUlVOVFJYldzcjVlRWc3SHZJM0ZsSUlHUVR6UTZidjhUTVhQZStCTWQ2?=
 =?utf-8?B?UU5OcFgxUFU0a1J4N3ZuZ0JIWXRhTXZZNnVYR0xMeWw4V2VRS25NYjBudlBL?=
 =?utf-8?B?VmNaT3NzMVV2TFZ0RDRiSkNtRmZyeHZTam82TDRTQVBLYUt2RmZUaG94R3Nh?=
 =?utf-8?B?ZWRvMlYzODk1QjZnVEMvb1ZpTUM3NW1EdUFLSTlKVVAvTDVBeUpuSTBPbWRI?=
 =?utf-8?Q?AxTvyf4+ywo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3461.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1dKNWdBS3hRL09sVWxIR2xvSmFyZzVpN2hZN3kvZEpWbTZzcDdZcjFIRlJq?=
 =?utf-8?B?NDZMandmczU5dythcVBVZ2tjNW9yd3pOQzFkVUNWZDkrVHYwU0tLRG5qY1Ft?=
 =?utf-8?B?VjJQRXptNmRTeHdLcVJvZTdoWm01U2FYUTRqQitmN1k1WEdWWE5ySUZ6S2dB?=
 =?utf-8?B?cVZPMmtPd2NUck9kd3pPbU5DbzE5ekpReURrRkRSVks4RnJNRTk4N1JZdkxo?=
 =?utf-8?B?dU90cld2cVFwZ2xINGduVzZyWFZHNGRuSlNFQjFLRW1EME5NZkJFNC9HRmpX?=
 =?utf-8?B?UitMRHNHZU9pNC9FU3BmTTJhK3c0ZHBzbGFJeEpQYUw1TFB3RExqQTlwUHlk?=
 =?utf-8?B?V0FpUlI2di9ZUTRpRVExa0FMczVldTAya01QU005VXNLNkwvcFRmeHVteU5W?=
 =?utf-8?B?dEJZTFdCajd6SmJKMjIvRVR4NC8xYUNMUmZ1eDBqRzdXZHM1QVpuU29ZMFpH?=
 =?utf-8?B?U1hUOUNBN0UzRytHZ0NwZnVpbS9TN2t2TjFoMHFvMENlQ0U2dGtWYnQyMG5T?=
 =?utf-8?B?NFloazVhekhEbVA5RVZxbGdQbDYrNytSYjlsMy9QYklFRGNjR0cva3E4RDF4?=
 =?utf-8?B?ZUFyZjM5aWs4VmJNNERMRjBteHlTZStGbEFzcEQrZ1hESzlqaFBGN2hob2Uw?=
 =?utf-8?B?YlIyWjh6VGRIU0ZmUHZzdEZ2emVTQmc4bklZSU4zTUx3bFRwTG5jR1dPMEk0?=
 =?utf-8?B?eHRpbnA5aGlmRk1LZHhUK3FJd0FPRFZPSzdyQlZtSUM5V0hnNEZuQTRXOGxp?=
 =?utf-8?B?TDQzWTFlVi9lUHZzaUtpdkkyRFhKNWhZUG9uN1Z0WEdHQ2xzM285Q1dhb2Vu?=
 =?utf-8?B?TVRYR3V1bU9lZTg0eFhhclZWMElxVERsRFZMenEzaFk4SkZlRVhaZFg5aWFv?=
 =?utf-8?B?VFNXLy93TUJVbHlILzZhN3o2aDJxVW1LL05tY0x4eE90NVZIU0x6L0I0K0ZJ?=
 =?utf-8?B?RzZtQ1pQVDE4QWNibE9rVHg1RUVwZ3k3R1VEUTVXWHhCN0FOaDBtUGR6dVRi?=
 =?utf-8?B?UUl1MVJHaXh5a1pMUTcvTVhCMEM4czdhNGE2SkJ5dTNpSmN0WVFQd0h3UDFz?=
 =?utf-8?B?Wnl6SlZML0x5WHBERHA0ekxuZTFZa1FkMkt2VGlWbzIzRXdjdGJzZW4veHA1?=
 =?utf-8?B?MVRUczFOVGF3SGJVdVdhaTVrQmJFNS9iQUU4RVJjYnVkenFHaWQzVlQ1Y3oy?=
 =?utf-8?B?VFBXL0pieUk3YWRhWjgvdk9VRW9TdzRMTGxhM3pPbGlWN0UyVllGQmVrbStH?=
 =?utf-8?B?bFZkcVdvWUdtM3BBakp0ajd1aDh2NjhZcXdJdjRVSTMrNTBKdFAwTU94US8w?=
 =?utf-8?B?dEdJcHFVZ1FwZEN5eHo1QVZCL1VnbHhQd21DczZPK0pqWDBoOHFjV29FZUtm?=
 =?utf-8?B?K0hSMXJUdlJmdk9GZTRlUTUvbVJ3R3ZLY0V4dFV1NTBkWE1NYXhHQWFhbjFS?=
 =?utf-8?B?R2I5NythMS9ua3dJek1HRzJrZ3lXeG8ySUtoNm5IMlczZkE2M3AwKzhJdEhU?=
 =?utf-8?B?cDZVSFNxSHNBaDFNbjA0V0tBeHFXYkhBZktMNVI5NHVaZGEzNllCWlNvTnY1?=
 =?utf-8?B?QnQwUGNRWllEekcxUUlSemhoR0MzTkNIYWtlWG1vanR0dWdMbG4zVUJxSXZX?=
 =?utf-8?B?MDV4VEdub1gvdnBHYjlqUVhrM2s2d2plK3N6aGsrcFJHSmZDemNMV0FCWlhI?=
 =?utf-8?B?NFNEMVhaL1lpNzYxMVZ1WGJibS9TcmV3dGtkTjdkQy9RZHJBOGplWDdNY2pR?=
 =?utf-8?B?Zm1uM0YvZjN5TG1pOGo5eFdLSDdpV2FWNWFHbVlCNkpSZnVEQnpwRE94Q2JT?=
 =?utf-8?B?Y2FUY3JRdHBmYnJKa2gwU1F2UGlnR1k2cE1TOXJ1N05xZ2VEdm5HZ2JTbm9j?=
 =?utf-8?B?Sy94ZkVRVGFFUmdkakQyTzQ0TDJXS1gyVmVTVTRJRWptMEVwb0srbFY1NnJZ?=
 =?utf-8?B?YUppUytVRjE3bVJUWG5RNG5sbXlVZVZhTGZXYk16U1lCaW9wZmUwaEZBZFRq?=
 =?utf-8?B?dXZKcUZaa05DcDNzZTIzYVUzYmx2VVpoeitRRlp3emhRd0xZaU1ZMG9xWU9O?=
 =?utf-8?B?MmRXZlhQODBvTHFxencxRW1yNzduRDc1Q3Z0Q2hwajExMTRmQ1RDTmJIYVpC?=
 =?utf-8?B?cDllZjd0MStWSVpaZnVxMjRsZVdiTkhyNGJmOC9udGJ1VGhRQkd5VjZFMUN5?=
 =?utf-8?B?K1E9PQ==?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b96185ab-7aa1-4d21-d1ff-08dd82afe870
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3461.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 21:43:47.6303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cZYn5MxnibniYDibm+Lw1/XKyaqiiyuHyDT0ia3PfEJ9pvnI8a7JB4OYkIvFOU+IpgWe1xZOfTbKXUGZA27XexT148j7G2kwqlkZ+nqAkLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5952



On 4/23/2025 1:07 PM, Rob Herring wrote:
> 
> On Wed, Apr 23, 2025 at 08:03:18AM -0700, Matthew Gerlach wrote:
>> Convert the clock device tree bindings to yaml for the Altera SoCFPGA
>> Cyclone5, Arria5, and Arria10 chip families. Since the clock nodes are
>> subnodes to Altera SOCFPGA Clock Manager, the yaml was added to
>> socfpga-clk-manager.yaml.
>>
>> Signed-off-by: Matthew Gerlach <matthew.gerlach@altera.com>
>> ---
>> v2:
>>  - Fix node name regexs.
>>  - Remove redundant type for clocks.
>>  - Put repeated properties under '$defs'.
>>  - Move reg property after compatible.
>> ---
>>  .../arm/altera/socfpga-clk-manager.yaml       | 129 +++++++++++++++++-
>>  .../bindings/clock/altr_socfpga.txt           |  30 ----
>>  2 files changed, 128 insertions(+), 31 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/clock/altr_socfpga.txt
>>
>> diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml b/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml
>> index 572381306681..6f09458f22a4 100644
>> --- a/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml
>> +++ b/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml
>> @@ -9,20 +9,147 @@ title: Altera SOCFPGA Clock Manager
>>  maintainers:
>>    - Dinh Nguyen <dinguyen@kernel.org>
>>
>> -description: test
>> +description:
>> +  This binding describes the Altera SOCFGPA Clock Manager and its associated
>> +  tree of clocks, pll's, and clock gates for the Cyclone5, Arria5 and Arria10
>> +  chip families.
>>
>>  properties:
>>    compatible:
>>      items:
>>        - const: altr,clk-mgr
>> +
>>    reg:
>>      maxItems: 1
>>
>> +  clocks:
>> +    type: object
>> +    additionalProperties: false
>> +
>> +    properties:
>> +      "#address-cells":
>> +        const: 1
>> +
>> +      "#size-cells":
>> +        const: 0
>> +
>> +    patternProperties:
>> +      "^osc[0-9]$":
>> +        type: object
>> +
>> +      "^[a-z0-9,_]+(clk|pll|clk_gate|clk_divided)(@[a-f0-9]+)?$":
>> +        type: object
>> +        additionalProperties: false
> 
> Add another level to $defs and move the reference here:
> 
>             $ref: '#/$defs/clock-props'
>             unevaluatedProperties: false
> 
> You can also move 'reg' and '#clock-cells' into $defs/clock-props.
> 
>> +
>> +        properties:
>> +
>> +          compatible:
>> +            enum:
>> +              - altr,socfpga-pll-clock
>> +              - altr,socfpga-perip-clk
>> +              - altr,socfpga-gate-clk
>> +              - altr,socfpga-a10-pll-clock
>> +              - altr,socfpga-a10-perip-clk
>> +              - altr,socfpga-a10-gate-clk
>> +              - fixed-clock
>> +
>> +          reg:
>> +            maxItems: 1
>> +
>> +          clocks:
>> +            description: one or more phandles to input clock
>> +            minItems: 1
>> +            maxItems: 5
>> +
>> +          "#address-cells":
>> +            const: 1
>> +
>> +          "#clock-cells":
>> +            const: 0
>> +
>> +          "#size-cells":
>> +            const: 0
>> +
> 
>> +          clk-gate:
>> +            $ref: '#/$defs/clk-gate'
>> +            unevaluatedProperties: false
>> +
>> +          div-reg:
>> +            $ref: '#/$defs/div-reg'
>> +            unevaluatedProperties: false
>> +
>> +          fixed-divider:
>> +            $ref: '#/$defs/fixed-divider'
>> +            unevaluatedProperties: false
> 
> And then drop all these. Same in the child node below.

Thank you for the great suggestion,
Matthew Gerlach

> 
>> +
>> +        patternProperties:
>> +          "^[a-z0-9,_]+(clk|pll)(@[a-f0-9]+)?$":
>> +            type: object
>> +            additionalProperties: false
>> +
>> +            properties:
>> +              compatible:
>> +                enum:
>> +                  - altr,socfpga-perip-clk
>> +                  - altr,socfpga-gate-clk
>> +                  - altr,socfpga-a10-perip-clk
>> +                  - altr,socfpga-a10-gate-clk
>> +
>> +              reg:
>> +                maxItems: 1
>> +
>> +              "#clock-cells":
>> +                const: 0
>> +
>> +              clocks:
>> +                description: one or more phandles to input clock
>> +                minItems: 1
>> +                maxItems: 4
>> +
>> +              clk-gate:
>> +                $ref: '#/$defs/clk-gate'
>> +                unevaluatedProperties: false
>> +
>> +              div-reg:
>> +                $ref: '#/$defs/div-reg'
>> +                unevaluatedProperties: false
>> +
>> +              fixed-divider:
>> +                $ref: '#/$defs/fixed-divider'
>> +                unevaluatedProperties: false
>> +
>> +            required:
>> +              - compatible
>> +              - clocks
>> +              - "#clock-cells"
>> +
>> +        required:
>> +          - compatible
>> +          - "#clock-cells"
>> +
>>  required:
>>    - compatible
>> +  - reg
>>
>>  additionalProperties: false
>>
>> +$defs:
>> +  clk-gate:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    items:
>> +      - description: gating register offset
>> +      - description: bit index
>> +
>> +  div-reg:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    items:
>> +      - description: divider register offset
>> +      - description: bit shift
>> +      - description: bit width
>> +
>> +  fixed-divider:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +
>>  examples:
>>    - |
>>      clkmgr@ffd04000 {

