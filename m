Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013021.outbound.protection.outlook.com [40.107.159.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5161E47B4;
	Wed,  9 Apr 2025 06:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744179299; cv=fail; b=Z5FldbhZnDcFU3Zotyt7aFcrEtSjJIaWyQwOjo91riyxWGA1+MvWxeaAgKGXjP681PFNMhVUgyz7i7UqTwr6oH0aI2Nqatb/VJSYBIHeQFtVwW225zxCQgjwPySOA8ZovSp9g3/6vGOmgl4M2ewvxcJwWqo9RskJKtRI2TyaJLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744179299; c=relaxed/simple;
	bh=b5EN1vvCgfqjlHT+5VH7c4yGnSmxvujde1lZ5PK9oOE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=owX3ytKmfVOyPdAKzC0nsx3S2oc4jeLDOJdNvIOd5WgIQDAl5dNn3D3mAdfx59GmXsmF2wWAcIFi4FbtAPq2jlcfHLgPp/H3k85M1RFT8HVQ0RFTE0k6ZHYDSNqcllJ8w20JQ+82NBS2V0Fpaz3HrZX60LTd6T4iDMGuOOUr4ec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=C1ZmlKYh; arc=fail smtp.client-ip=40.107.159.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="C1ZmlKYh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tRxckq2eHYv2czdYNV7egL7YMLRUX1gp+eqyjSb4E/oPsXwgJAC+uNREOhIxmSqtWlu3yMw/5kPDV9l3zz3dr7U1EbyqposSYr9m+vd60GNwiYVdIzhL/BCgCHPkeQs67Bhm/BcMdlvBka2RsfJf5ZuUFqAgPGJUS6D32sMMc9RvRrq2CmX3iIfbBVnW4AnigaJgKV6LsgFTp57GfYYAOE6jU44VsbdkMKXl7w6vGMom/3i4N/N5SsQ/6Jz2iGS5YRocNuRBumZMhCrhtdlaeaI6UvswHot22QFO08ghPzt08U9FqJY0NYHIJzDgX6KAuDAxYZkfsBlYdPC2ciq1Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fk6L7QqEvJ0JoNUKpQGTzYniBYcYpSIPGTAFXEe8lBQ=;
 b=xxdHvy93cfLBedEsrXGSA5Klagy6qk77gwi+KPHwkOQGIpI1gywa4aYejhV66H+sNtUJrf5hMEC8lxk3RUNfuvu4BCJfDIYHjzo8qdayjEsLeSNzZwtIYE1Ab7mDUlkenfWEXg/6K8eeitFmMY1ZwkVk1muZFcEujl7IAOA5n91Upbj7gzNvFr/Nx3Cjt8vIOKaYZzHVGt/HJHTRmaN8Y+c58u1uR9hvGIysKUlIx/ztWo2sKw0M57BaIGdEnlGl37Ac/S/62Mu9JzeBZd6TLwWaMnzQKmMVIZXDVZ+26UaJ3MMevm3K458FkROhSF2ja5J+v4sXdN7CIXOn19oeeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fk6L7QqEvJ0JoNUKpQGTzYniBYcYpSIPGTAFXEe8lBQ=;
 b=C1ZmlKYhOigHEPzKlq9U0CQTcr+voxXl53LfxS+KTN8NRY4PssAqgaPkEO8RA+NHkNhT6uOiT2g30G2bC7QEytT+6pAUgPGkDEgnuLfpVx3M+1m9X/xb/iYCehqwEANDnABRk7YYvKUngxOyjWjC/MLyaon0Yhjd42x8/ym+e2CbfLS73vzQ/SumNwSiyoVaWFOWW8KOwrHFzTstJdx92hoKr130cYrNCL0vkWHen8DZ1yyCHpAel/WJlYZPLCHJ4OLWuSl+KV4fL70aqtDa5+aAJ6mIPrN7caGg1fnOrmuGMyapix6FA+y/tNRaDXVMTLqdaCpW4HVF4YxDds2Rmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by VI1PR04MB6864.eurprd04.prod.outlook.com (2603:10a6:803:138::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 06:14:54 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%6]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 06:14:54 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Wed, 09 Apr 2025 17:07:47 +0530
Subject: [PATCH v16 6/7] arm64: dts: imx8ulp: add secure enclave node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-imx-se-if-v16-6-5394e5f3417e@nxp.com>
References: <20250409-imx-se-if-v16-0-5394e5f3417e@nxp.com>
In-Reply-To: <20250409-imx-se-if-v16-0-5394e5f3417e@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744198674; l=1416;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=b5EN1vvCgfqjlHT+5VH7c4yGnSmxvujde1lZ5PK9oOE=;
 b=2P+7DqE/b3BacRkIsPGPAA1k0N+dVswGYKKP6dBAEvuscYvrWJoAWEOHg4W+NszLw85YqvQ5v
 1oo8g+uwBsADKFBkMLV7rdHCzIM/hTI0QvcncO4jrVSCqOKuug2efH9
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2PR01CA0052.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::11) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|VI1PR04MB6864:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c5fe1cf-b055-4947-6f5b-08dd772dd874
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R29KS0FkeStCY00vNDl1bWVDYnAzdWM3OHV2aVZkNHhyY08rM2czVnlKUm11?=
 =?utf-8?B?T2x3Q2wyMis4cEljTHp3a093eEZ5UlZJb29Pb0VBTkRxQTJWaFYzMnZDQnh0?=
 =?utf-8?B?a2haNlo3MFJGQXFpajh5cXNhcWFtblEzNDM3V3N1UVpIN2tYaDgwK3JOUXNZ?=
 =?utf-8?B?cnpNak85aDI5cGVWQXhPTFBYY3loR1ArSXp1aG1ycEsveGxnK2FXTHJJV3oy?=
 =?utf-8?B?b2tJN0IvU0VNdDA1RFlJZCsxQ0tOblFJdUo3cWRVWjRqUTQrZFVCT0pTVWY3?=
 =?utf-8?B?OGJEK2QwWmoxT2sxSUFRVDkzVk9FZnI3bktaZE9xd0I1VkQrMlVuNTBLSHFP?=
 =?utf-8?B?TmR3OUpqcllIamN3bzlvL2NkSkRicHRLV0hxWnlWWXplTmJ5Yy8vTTA5UjI5?=
 =?utf-8?B?SG9kL3RLVW5mdWNPd3k3RWIxNGoxZmlJRFhnRFhNNEpJdFFycUxXTjEwRFE0?=
 =?utf-8?B?VlpieS9IVHV5Rm5INkJnT1V5TjFqeDJvNW1wai9zaGF3ZWR2c2RJNFc2QWlt?=
 =?utf-8?B?QnJEeERlTTRWdEcrcTNWOFpjVGxYbnI4eDAxMlFJZjJYNEliNFpTTS9zU2pR?=
 =?utf-8?B?NDJHQlRydi9pM0Rnb2toRStPVlM4dlNmb1FHeTVmTDYvTUh2TEJxMVZpZlo3?=
 =?utf-8?B?MkJJa0o4L3JiVCtXZlZDeFJpbFFZRE5XZ3hEZE51Nk9KTXFKVllkbHhSdkpw?=
 =?utf-8?B?RmR4anJJVVRVUzFDdzZYV3JBaktlSkRmYTNmOVFVNDVxY0ZKdFUxTjJSdnNT?=
 =?utf-8?B?WEQ0ekV0aG80TEltcmFYbDhuOGhLQ2RLZm9wVGJqdkppbGk3NlJQazhvdzFo?=
 =?utf-8?B?d29OVDl0UGtyRTRONmJVMXJNWlpxeDVkRU1Rejc2UStRTkozcVYyUzRFOExw?=
 =?utf-8?B?N2t6a1VmVmlHVTVpc3RvYnhmNGc1V1hXOU90VTkxMTBNZW9keFFINCtBVUFu?=
 =?utf-8?B?TWozaGQrcUUxUmVLaEh0bTNtb1Y1NXVjVDhpVENqKzJqanpjdWlOZzgwWDIv?=
 =?utf-8?B?NEh2dE41bnFUR0hTQThITFpub1BwVG1WTWordE9RM1pRb3E0OXRDWWlpQnJW?=
 =?utf-8?B?bWFrZ1lCaTU4MDlGd0JZOG9IOUFZc0YwMkxDVWs3bXg0WStKNHRwQjRYVEgw?=
 =?utf-8?B?RVpYb2haRWxDR0JXWG90dllpTjBtSU51VVJCMmkzVkxMVEgrQjdRcXc5NFdV?=
 =?utf-8?B?VXVWNCtaazkzREhKVDlQWWh5ZFdpbDhqdDlwVVV4enJFTHBQRHBhQjNYTVg1?=
 =?utf-8?B?eE4yMDFQbEx3QTd0b1gyVVM0L2JUbk5Vd3NGUGlVOE5nQWJzV3IwWVRDQTZB?=
 =?utf-8?B?VUpySWhaU1V5RkN6YS9tRDJ6dG0rYmwxNVdVQjRzZ3NyQjRFUU1CMGRwTTZi?=
 =?utf-8?B?dUJaSzZGRVpOQ2xJWHRLeUgvTE1BZkhOeFNlTXZXZWs0cnY5UnUrUFVxQWtW?=
 =?utf-8?B?MS8yVUZDMmxCc1lCR29Ua3lrNU9zR2taaW9zR2t6d2xYQkFzdnlLZGJtUUJs?=
 =?utf-8?B?NElOZER3di90SG5zcTNQNXpWc2x6bS9FSjE2Qmw3b1BZR2t3a3ZSWjd6dC9y?=
 =?utf-8?B?SEY2UU1Jc3lBVWJCYnA5L0hvdWtoVjh0UysvQjBXQWNEWkt3b0xQcDYzNlpU?=
 =?utf-8?B?d1U1ak8vaXRUSW9KWFgzTUszdWhWMDI2TUJrcWVrdnFraE9oMHhMR0dqTFpq?=
 =?utf-8?B?RTJMRTdrdkwxZHNqZk1pTWZoVXZLK2pEL0YwZ1NJaXRKamV1OUw3NHEvdTZV?=
 =?utf-8?B?Y2dBRG0vREFEa0hTTlRQMGhxZmhDTlZia204c0U2QXRwS210NXRqZ21wQlkr?=
 =?utf-8?B?d0tiZ0poSjdpYnZ6TTRuYTVCRk43VHJONnAybkpVcCtaWisvUlBEbVI0R3pj?=
 =?utf-8?B?ZEtBRUpHLzh6SFh6Z0NGZVVLa0Y5VkkwZzFoeXRackJZRi8vbUkreXR0VVBS?=
 =?utf-8?Q?SuoHYC3r4DLiwnepOdHaYsSj1XlfeGQi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zm5ZRVk4UnBVTy9pampZcFo2OUpDcUdhaEY0c0QvbitlRUh3aWJzMlU1WVhq?=
 =?utf-8?B?N2dnaFVCOTFtV2JMR0d1VVlQT0xCRXE0aWtHUHZ1eExHZ25BWnRQcm5sa3lu?=
 =?utf-8?B?bGZ6eElDeHVCZXA4NTVJOThPek1jVlcwTlBPUGdVSkxJeVRnelNnNjRiS1My?=
 =?utf-8?B?NWJmTm8wdmI0eDQyVHREamFYelY4ZDlhVGVYNEJGM1RCRkhZbFpqcmlKa3Aw?=
 =?utf-8?B?NW5zRU9TWkZMUjk2K0ltbncwb0NOdWx1Vkp4c3hOVWFwQWRrZ3VHQ0tPRGNv?=
 =?utf-8?B?eU1FWG1jaGVkVE14bll1dFN4bHkvSTRsdUsrdjEyR2pGb0pmZ09GRkVEQ0k4?=
 =?utf-8?B?elVNbUpSM0FadFVkZGlRdDZkejR5STZBOU9VZXVQZkJoa0RaaEp2SFloZDZH?=
 =?utf-8?B?R2RpK2MrU0tkSkRMR1NCdGw5Mng2aytMWTlOVU5OV0FDOHVVYXlNaW5keUxv?=
 =?utf-8?B?azhBWHlUQzA0ZmVWdGpvYXl4TkpuclN2ZSsyNkJlRkxZcG4ybUdmMlB0RDBW?=
 =?utf-8?B?UUgydkxyeng3QjFpQzhnd3UzeDhhZ3JMZUFIZ0gxOEtUL0xzbmVzSllqVnFq?=
 =?utf-8?B?U2VjdU9CWnVQT3hzemU4djNsaXVJbWY3TGJEbEtoajZwRm1BYnBhYTE3RUlC?=
 =?utf-8?B?RXVrakJhaFVlQnF5Y2ZDUVhyYnZZVXltY1RSWG5YZFBSUTRNTURmbWxOR0Qz?=
 =?utf-8?B?UzFmYzEyK2pIZjZkQ0N3VUJqcjVhUHRpS2ttM1Q1K280c3FpZ01BTnZHQXdq?=
 =?utf-8?B?UGVRRXliZUliZFhYQWIyY05CODZkRVNZS1ljZFFTbjlzbmYyWnBmdzNwQi81?=
 =?utf-8?B?UVNRd3hFeEpWTERIQUFSQTZpb29kNWpnRFVWaFo3ajZLOVE2bTdUMzU5ck1o?=
 =?utf-8?B?QkpqeE5GYWNkams0WDFkRStlaTNLRWwzV3VhdkpXMkh4c0N4eCtEdVJ3aVFh?=
 =?utf-8?B?dHg3aTVEaVlqWWRtNlNiRTNCZHQ0MEFHZzdNb0dmaTdCVkJVeTc1Rzg1NGZS?=
 =?utf-8?B?b21FVmtUc2gzUlY5bVBvdy8rNksvcnkwVFN3c2N5QUhJalZvSzUxRFBidWhK?=
 =?utf-8?B?V0ZIaWJBbkFqMVVmMEloU05OZkNIN1pxZWZKL00rdWQ5QXk4dDlYSHJzYkQv?=
 =?utf-8?B?TE52Q3gxOTIwcEx1alQwZjNTckNvUHc5T01aVUJBY05SSk11SG1xLzAxbjBO?=
 =?utf-8?B?RlEybnp1THJWNWp5cEZ6eThrM1FLOFFsb2tIaHF6NlF6N0FlVGI3YXhnUVM3?=
 =?utf-8?B?UWJNZERaY25qMURadXJ4RGJTT3NEVXFlUHBUL2FEM3BQVWszZmVEMnRMb1l1?=
 =?utf-8?B?aHZEWVJzNWVMTFFEbDNCcnpOTWlSQjM0TTA0SHp4NUNCeUdMUGZMcjB5TE1p?=
 =?utf-8?B?S0x2WXJ6WUYzaEdWYmdJa0QwSlpFU3dKTW9zeDlyRDIwUXpEczJldkxBMWtF?=
 =?utf-8?B?NHBuWW00aUFZOFB6V3d4dmREczVzbTFEbVRKNUJNbzV0ZmRWL2NFSVhpNUti?=
 =?utf-8?B?bGxYS2pOdkxsNG9PQit4SEROeG8zTm9GN3EyOUpsa0pLVm45MFoxVll2UGdH?=
 =?utf-8?B?M0wxRkFVdERCZnhjc3ZrejRaRWJvV0l4MnNCZGtUT3R3ajNTVFdZS0Q0Qmp0?=
 =?utf-8?B?Y3NPcG1lQTdCdjVRVEtxb1RWNFFZQWs4bkFibUVvTXNrV0c4eHVrNkVyT1hs?=
 =?utf-8?B?OENaeHBhdkt5Zkd2VXczQ3RjanVJbDc2QXE5R1g1VTZQWTh3NlJVaDQ0OW9Z?=
 =?utf-8?B?NExLTmpsRWh4WThyZ2FkQSthNnU2dFZxbXM1ZTE4UWZtd0U3LytHdXY3K25p?=
 =?utf-8?B?U0RQcS80Q0trbldFYzJjVFNrOFBnNU9lYUR0VzVKeGNFTG9tY0xUZWVDMVVw?=
 =?utf-8?B?REx4bUN3dG9lZStaRTBvU1pQSW5UUGlYYzVZK2h0UWpLR1M3RmpXam5GaTNh?=
 =?utf-8?B?NUt4N0N1RXEzNlBIeWlhL3FjcVU5SDd4Z0thRW5aMzlJK0laMkw0Yk9pU1hQ?=
 =?utf-8?B?d1VGY2hGendPNVh2YVZ2anFtOWEzY3hCbnkwRiszNjJJaGwydWZRYkV5eUNW?=
 =?utf-8?B?ckZPS09ZYVpUd2JFdWMwYUJkNVVPOXlxM0xleDFHb2pkUGlzMEE4RG9ydVRI?=
 =?utf-8?Q?p2DwH2OKZjNk/RfJkiiaRcgVX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c5fe1cf-b055-4947-6f5b-08dd772dd874
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 06:14:54.6398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y/nKyrEb7aY05V9eW9nC22BQcmVbJbYYXKsn6MyWns6g1SJboVLI70JfaKiDAnbd5YXZkRG0n5n6Wu9u+gv37Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6864

Add support for NXP secure enclave called EdgeLock Enclave firmware (se-fw)
for imx8ulp-evk.

Add label sram0 for sram@2201f000 and add secure-enclave node

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>

changes from v15 to v16
- commit message body is wrapped arround 75.

Note: copied the change logs for v14 to v15, to cover letter.
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 2562a35286c2..05db47668b7e 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 #include <dt-bindings/clock/imx8ulp-clock.h>
@@ -154,7 +154,7 @@ sosc: clock-sosc {
 		#clock-cells = <0>;
 	};
 
-	sram@2201f000 {
+	sram0: sram@2201f000 {
 		compatible = "mmio-sram";
 		reg = <0x0 0x2201f000 0x0 0x1000>;
 
@@ -186,6 +186,13 @@ scmi_sensor: protocol@15 {
 				#thermal-sensor-cells = <1>;
 			};
 		};
+
+		hsm0: secure-enclave {
+			 compatible = "fsl,imx8ulp-se-ele-hsm";
+			 mbox-names = "tx", "rx";
+			 mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			 sram = <&sram0>;
+		 };
 	};
 
 	cm33: remoteproc-cm33 {

-- 
2.43.0

