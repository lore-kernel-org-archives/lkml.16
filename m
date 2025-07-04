Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013041.outbound.protection.outlook.com [40.107.159.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4AE2DCF52;
	Fri,  4 Jul 2025 09:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751621901; cv=fail; b=Iei87jNfNNCb2k+CdgN75IEvaHOp+dVnJQNp2l0DGRJkqsTtuE8XOI5Zs1bJGjVpSnfEfeFXLOaJpf8/vEq555i5tsoUi8fx8We1axJVXVHlzlHIj3DjRAlUi3i8GDqQvwScNTi+/u1TZpjpjC+RXzOtXJtbNouLQXxr+hkAMNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751621901; c=relaxed/simple;
	bh=DWDey0pz95BwytSiVuvTmXBWSEoc1NHlFCBtEeTaJGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nIntifujjKN2PRXZTYqTH354JJwUHYHFvd2CObmLGRHVmnDxR1GcR+Hob9dM2ejB+zoBgsxYd2FF5x7aGri+vrvci/Fy2D6Ex53XRy07016TnF/zORNDQxikp2w1n3mCrD1ZbpUh4LbH++Vk9a6fF1zzGYquTJBmMStUEEfS554=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PHIeOFiZ; arc=fail smtp.client-ip=40.107.159.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PHIeOFiZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UG+J89FJhbBGj29XCiGDDlj1Xlh5XsmjGrVyHLJco0Ij281eBwzV3b5QfiIfsC3AXmJV7dLYFW8TEpqiKTtEfop+xw8h8dEgb4/7yY8Q/ASLbTfrmtrS8Q3FCdcsurEnduS+GOI0RdTf4PJz6bq3kR12owntg6mQpPJwMJhkGpbDHFvAemmS0BSR6B0vorQTmNuWkyRkwSK6O5hzxcpltS9YrOEgG4PREWXSZu1IwBj6ZvDvDgOy7LvAMARbgnsK7GQ5b3hV+e3+Tw0zvqwKsmmOVTCW0uMmcrElV+DmvDCqCZnb7C/LT7CIQCGjG+Bj4+CViWsQWTWQPBw35btb9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnbMNrzopMYJ/Nfm0fW9Bkk9U4C8445r3Izm4KJrsf4=;
 b=WYLglHTWXMqwo8olHsWLRxs+jWxAszlCYslXvbOtSIXdgh+9YxVl8DwdxzfBm/vC7vTXfEaAHj4lBIAusXjyM3akn0A41AmbN8y2WYD2ajS0mFX8LCEdYzC7rCjcaM9myAEUEeczuaXTyW1SloGgVKSzlNVWlVwAydxKxzUWMwdk6tuzrC/hs+7v7KXtuo6NUpeus4iB+Xtq0b1mJjWmo71kqzUtgf6e+tdeHw9AWCFH2L1FTYP0Bhlno7tUae0fsLsMryFIXLeN5m8sBNd4altdBi4TfvmQ1mt8vDOnt51C5MwGA2yHyUtrutnxhIsyDQ40fw6S5sQcceUCk0LjLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnbMNrzopMYJ/Nfm0fW9Bkk9U4C8445r3Izm4KJrsf4=;
 b=PHIeOFiZ1VFgwZt1B/A4LrxHwZiyFyXCUO1FJuUua14HhITrbL5dNW1PIHv5oa8Es7NpUbbUFDeXOX/Fx+vROGKQVHmbmt1S0VL3JjhKNrl2PjZ6mC1Ox9pVAJ3ad8L1+LdRjzMv1i1xDL7KgxISyTrqyC7bw1YobR3Y9RhZ92wU6/Hxf20zkV1cHkpaPfAByLvXtluBpfUI/kkq90IW2XBAXlvgMXyr3uPIALG46+GKtyniPw+yEe5QS4bSp0Gw/5n+SyZm5qbnM4RC3+k35uy9uJc9Qr9JM6DyUHtYg0p6qUq8eaT9HAECKKqfO6J67Sqx9NtPwR6vZUJtJJC7yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU7PR04MB11139.eurprd04.prod.outlook.com (2603:10a6:10:5b1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 09:38:14 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 09:38:14 +0000
Date: Fri, 4 Jul 2025 17:33:20 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Peter Chen <peter.chen@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, s32@nxp.com, linaro-s32@linaro.org, 
	Larisa Grigore <larisa.grigore@nxp.com>, Ionut Vicovan <Ionut.Vicovan@nxp.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: Re: [PATCH v3 2/4] usb: chipidea: s32g: Add usb support for s32g2
Message-ID: <kqifemyqnplj6kv3yq7xd6rvany4s2rkok676oifskkih2lytu@4vha63bzgovh>
References: <cover.1751591078.git.dan.carpenter@linaro.org>
 <abb2ed5d-f01a-48f6-b1ae-6f8f39ae40fa@sabinyo.mountain>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abb2ed5d-f01a-48f6-b1ae-6f8f39ae40fa@sabinyo.mountain>
X-ClientProxiedBy: MA0PR01CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::12) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DU7PR04MB11139:EE_
X-MS-Office365-Filtering-Correlation-Id: 9287ee54-d3a3-483e-b565-08ddbade7fa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WlNIZmlGQlJjMVoxUVdSWUJaTS85ck5MNWJ5UjhPQ0RzcnlubHdUTHlvcnFK?=
 =?utf-8?B?SjdyaDZyZjhYeHpxcVB2cEpvaWpPaGtxcGo0TnkrUzZHN3VYMmFTNEUxdVUw?=
 =?utf-8?B?aEkzME15RC9MS1p1MUUvZWgzK0c1UGVGRDhxemNPd1JVOEZkUS91Ri8wMWls?=
 =?utf-8?B?UW5rK3lCcXFLS0RsUWNZVkJEOE1PTWFlczN5cVFyTVJBWklsTW1VbXRFbXZ5?=
 =?utf-8?B?K21LejNxZzNPN1ZmK1JUeW5lYkp0T0NIbms3ZXVQWC9PTU9UUEYxZFVLZGU3?=
 =?utf-8?B?N3NMRjgvWm9rY05Cd3gwOU1CWVhseE9oR3dSenpFcm1qazllVnZld2llRHdW?=
 =?utf-8?B?VUxFa3lRV0tMNUtzZThYcFF4Rm1Zc2Z2RXA5MGRNajdYRWtCb0l1aUI2VWda?=
 =?utf-8?B?YXFkWmxsbW4wWEsxN2NJOEsxMGFicEhJOTRNREZEbnNIZXB6M08zK00rUW5w?=
 =?utf-8?B?dGZtTTZST3dNdjJ6OFlzNGJhOFpwdFJCZm9DRjNaWlJZaE5RZFlNaGVjdFRh?=
 =?utf-8?B?U2Vmc1g1YkJQeklHQ2NtT3NydnNHanRmV0FhQVMrQ2MyT0loTmRTTFJnNTdI?=
 =?utf-8?B?REdqQVZtbnRkOU5aS3VVcDF5S0NiQ3JuVXRNcnFhL2Y5ZHlmMnpiRG5vcEpU?=
 =?utf-8?B?L1FTU3JJWXZ5Tlc5LzJUZ3J6UnlGRU1KWG8yWFFkS0dCR3BKS3VtL0Q3N0V1?=
 =?utf-8?B?QjM5T1ZkWEs4WE9xUkRjUFlqU3kxcnFYMWIyMWx1ZXQwMkVsdjl0YjhmVGFp?=
 =?utf-8?B?OUsrV1ZtMDg1SnR2WjluN3RuSDZiemdDN2pQNyt4ZGtQcFBHaTE5ckdpWVhC?=
 =?utf-8?B?d29jTjRTSnRHVm11YlZtb2V3MmxqSEF6My95d3BUbHNmRXZyd3RuRWZ5bmxQ?=
 =?utf-8?B?MkRBZElDY0RVcUd5YjlJZVlxZ0E4NmQrZGtzaU5BN1dJd2oxMWtiak5zaDd1?=
 =?utf-8?B?V3VqNlV0K1p4cnloYSsxdml1cm4zSlBRYVdmRStHbGQzWS92YzhrUTVid3Zw?=
 =?utf-8?B?eWFQa2UvNmF5Ynk3R0tjUWF6QUVZWlk3dGd5UUs2dm42NnMyaWpRM3BDMUh1?=
 =?utf-8?B?YmpOTVdYbktFeGhEbm5xQ0p0UjhEaFNNT01tTlhPcTRoNUZFeXNNNTBTR3Jv?=
 =?utf-8?B?Q043ZlVZVERLVzNUd2oxckJBb3FvOVhqYjJDTjdJU0cwQStmOFJCQlZxUnMv?=
 =?utf-8?B?UExyRGVvNjhGdFBhL2paeHZLNW1zUStnWS9qMHR5anZ2Mk5TdTUwaEdtb2hy?=
 =?utf-8?B?Qk5FRklJUGNkOUN4RGFwOFRxYlUwQmV4VWpDS21tRlVHRkFjSm5LSlFadEx4?=
 =?utf-8?B?T2NDK0w2bUtlaFlNQlg1QW4zd0luSGZzYWJ4OWU2OGJXQzVtVTIzakgyQ0Mw?=
 =?utf-8?B?amJvdlJ4UW5EMkhPNXE5a255ME1BSzJRNDlBb29FdjBkY3pwQlVOVVE4SmFZ?=
 =?utf-8?B?RDU4UGdsWDBpUS9mU01oQ1c2Sk0zV0JneWtaSDFjOVQvaEpoVWZFSCtCb3hX?=
 =?utf-8?B?eXhlWDRMRENtcFo4SXR6QkZoNVdick5udlFjVjFrS2ZEc1hVaU9peXRnTHRD?=
 =?utf-8?B?c05SejBJKzdnL0dmQU93ajBhMG0xR0E0cUpCbkZ5QVdXWHR2dFlNZ1IrNHN3?=
 =?utf-8?B?QmxXK3l4clcrSlRjRm5ZR2laRHl5VFNtMVpxcDJjUU5GR2ZFSUhNM21BMlY1?=
 =?utf-8?B?S2pnM200WmFMcUw0M0xkQjJkU2JpSlQvT2ozWjVTbWxPYXdhMklGK0hNZS9a?=
 =?utf-8?B?b0FzUmlxdzZzaU5CKzg1b1I1ck94bHpaOFdNR0huY2tkbVVrR3grL1A3cjVi?=
 =?utf-8?B?NzJURnFJWXZpS0ZkaTNjaVBWc0h2ZTROVHhzdFR2SjNxNjBqQTlpazRuSVQx?=
 =?utf-8?B?aEp6NURqUTJFeW4zazF6VlAzL3ZkZmxMQVRScnAxTXRzNzhSdkNENE42Y3k5?=
 =?utf-8?B?ODhDbm9Va24ybXRhREFGeW9vOVh1Rm9MUWV2bkg4ZDJmRi9Xd1NJZUJpZWty?=
 =?utf-8?Q?NHghWVf3r7R55Yubj5ig8G2x9grj40=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nk41di9EcE4wNzVYNkRRQ25HN3VaUE9EWEpCejYxMlFpbUVmZ1E1eVBxMDd6?=
 =?utf-8?B?ZUU3NXNxcHBRaVZDRFhFTHB0bnB6ZnJRQ29GZGJlenRkSlcvYzYxcWtzcWRI?=
 =?utf-8?B?ZnNkU3FmdGpCQllneDZwRi9idklOVE9FZzFYSHhTWlNvclVBWDd3QUNrN1d0?=
 =?utf-8?B?TXFENlkxQVk1MTBZNktQY3V3UXRLa2p6Rkkrc2lCeWRJVllkZ2RQZjlYc2ZJ?=
 =?utf-8?B?T3p5d0lzOXphZEdWc3lhc1NiS3FiTEVVTkxGTjNHUytuZHZselJTSk9FaXlS?=
 =?utf-8?B?Y3ZwNDRQK0VZNEhtRU9pYTl6WmxrcWxVNGpwVjZvRFR0UjltYXdXNDVuYW5O?=
 =?utf-8?B?NGVLdFl0b0V0M3VUbTNoblE2eXVEdERNTFExbDdLcUVLMGNPblJDZUdpcTZp?=
 =?utf-8?B?bVBZSnl6RElvQzgzbm9BSUtVcXEyUnlEeDk1bmJsRGF6aHU1L0E3WWpnTWg4?=
 =?utf-8?B?d0ZyNnpuR3pNYis2N3MrLytwYWQ1cWxBd2RuUGpVU1ZiODNVQUFYWGFtaWhF?=
 =?utf-8?B?UzF5NjZZZXNWSURSYzNjbkFabytuUm5uVjRWRXdaRFk1bS9rWTJoMFRDRGNR?=
 =?utf-8?B?UTBXYlNvYmFlUmorYkpJQVdaN0w2NzNzbGplV1IvRERsam9pSUlrUXA2QU44?=
 =?utf-8?B?S0M4MHlNKzA1NkM5dHFCSnFXUHBYWkZxelVpTTNxc2l5WmJ1U0d0NHlwTmxS?=
 =?utf-8?B?SVVPTmJDTHJrcWVvM1kzUWRKTGFtdW1lbnYrN201YVhvYVFSTXp0VG9XYXow?=
 =?utf-8?B?Y1lZYkQrcFJLVHpGQXNQdkozRWNUeTJZWks1RDc3STRqZU9yM1dIYXMvNHVV?=
 =?utf-8?B?MlBKbG9iYzMxSDY1cnZaeEtoUlRIdWpEUlRNam1Id1YzcW5TVXhwcEFHYWhG?=
 =?utf-8?B?bDgwTTJVNTVxOFRFYzhLMEhrb3BrQ0ZHb0ZQSmprenRlWmdWSGNaaHhSM3Vm?=
 =?utf-8?B?eHpQMktsOURIUE14QWQra0RFN0xUSjc1VDcra3Zzbytwakx2RnpkeXlyaGYz?=
 =?utf-8?B?NzFEbkpGYnBiWjJUUmZucG5HYzhSUFpiKzBQTUFjVStObmhjSTduR05xTlND?=
 =?utf-8?B?dTRXa3JVT0RXTjcyVWhDdWVLaVJya05YNEMzV3ZmWlg2R0RyQjJ2VHZwZmcx?=
 =?utf-8?B?RlJjd2hEbDhpQkNEcjFCK3hFVGdsL2l1NlI3S1R4QXhSRzMyUm9iOXRSU2hz?=
 =?utf-8?B?WllsMU0xcmN4Y0w1MGZwL0NIcnAzanhNbkVUdHl1Wmp4bGZ5TVo3Q0NrRjFS?=
 =?utf-8?B?SlI5aWljK2xjL2h0STl3aEVpUkl4cjJyUHdjbWRBL2V0eXRMYWVhMkl0WDFX?=
 =?utf-8?B?Z2JZZlFzUWtyc1hPQm40YXV3dXJVcVB0VjFRQjVzRFkwcVlmazlOZ1B1ZGY0?=
 =?utf-8?B?VlQ4dlI3V0lyU0l5RXpvMElGeG1MRzlUTFkxQ2VrbTF4NlRkc3VOWkRPTGdK?=
 =?utf-8?B?STQ0N0ZzZ1JiR2pYNi9uRzhqUFBJTFVUcllFdVJCcVBCc0JxR28zNE1zbzhy?=
 =?utf-8?B?OHpkcU1aMGRJL3BoWktOVVc0ZzRUdGhmZVhkM2VEUGFsTVhZMTk4TnN0c2Zy?=
 =?utf-8?B?aEZBYU96dVZnckJHYXZkMXJ5SnBuK3V6UjVBSUdVc29MeE9vN25LZFZuSlFj?=
 =?utf-8?B?WUJlNEhTcVhmNDZzNWcwbHR5RXovSzRLZzg0ZEgvejRocVIraURHcEdTOFlx?=
 =?utf-8?B?Y2J4Ymt5S2lST0s5cGFpSTY0ZWF0b3NaNjBuMjNqSU4xUWdIM0YxNm5vZE9v?=
 =?utf-8?B?aUNlVjk4dVBMSGRzYzcvR0QzVUc5a3orNUZRSk5xM0pTN1FFMzhqUEErWTQ4?=
 =?utf-8?B?N2ovUWxlVUdVNVF5RW1nMVkxVVB6eU1ySnB3VEQwdXkwbll4a0R4Unc3dzRQ?=
 =?utf-8?B?TjdQUHFLKzBrZzhJNXU1ZjZkeStRYXJOWU15ZTA1UnhLU0Jva1RlY1FvNVU3?=
 =?utf-8?B?VFJvRnZMbHFvZm9NTlNkZllUZnd4Z0oxbDVJaUdZczFtbktkdmFzZHArQTIz?=
 =?utf-8?B?eDFXMXpnM0ZEUnBzNURTdUpaTDdxY2NHMWFoOHJ0UWdEOFN4azYyL3JhQU8x?=
 =?utf-8?B?aThYbEpQR0JiaGduNkw1N21KaUFkZ1lQODN5VUt2MU1IZUMycG9obDlmOWUv?=
 =?utf-8?Q?vxl+atQtyctCgnjoeS+PRoRRk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9287ee54-d3a3-483e-b565-08ddbade7fa5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:38:14.6787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ZgQfd46WLfBGKrsve0Cm/pvb7v6BcXi6sXKiDFFQtuWVnuxCi7n1YrquVYLsDrdYTePoeuJZ356sDqycKe6Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11139

Hi Dan Carpenter,

On Thu, Jul 03, 2025 at 08:20:33PM -0500, Dan Carpenter wrote:
> From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> 
> Enable USB driver for s32g2.  This chip has an errata ERR050474[1]
> so we need to set S32G_UCMALLBE to avoid some memory corruption.  I
> have include the description below:
> 
> ERR050474: USB : USB data may be corrupted if transaction size is
> non-multiple of 32bits
> 
> Description
> When USB issues narrow length transfers i.e. AHB transaction size is less
> than 4bytes, data for that transaction will get corrupted. Narrow length
> transactions can occur if the transaction size is non-multiple of four
> bytes, error scenarios terminate the transactions early or if the address
> offset programmed in QTD is 4 Byte unaligned.  This happens because the
> SoC NOC is not able to handle the byte strobes generated by USB controller
> and is dependent on its internally generates byte strobes.
> 
> Workaround
> Narrow transfers work properly on bypassing USB controller’s byte
> generation logic. This can be done by setting UCMALLBE (bit 15, USB Core
> Master All Byte Enable) bit of UOTGNC_CR.

./scripts/checkpatch.pl --strict report following issue:

CHECK: Please use a blank line after function/struct/union/enum declarations
#157: FILE: drivers/usb/chipidea/usbmisc_imx.c:1116:
 }
+static int usbmisc_s32g_power_lost_check(struct imx_usbmisc_data *data)

total: 0 errors, 0 warnings, 1 checks, 133 lines checked

> 
> Link: https://www.nxp.com/webapp/Download?colCode=S32G2_1P77B
> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v3: Add the errata to the commit message
> 
>  drivers/usb/chipidea/ci_hdrc_imx.c |  6 +++
>  drivers/usb/chipidea/usbmisc_imx.c | 73 ++++++++++++++++++++++++++++++
>  2 files changed, 79 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 780f4d151345..e8c847eab8e3 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  /*
>   * Copyright 2012 Freescale Semiconductor, Inc.
> + * Copyright 2025 NXP
>   * Copyright (C) 2012 Marek Vasut <marex@denx.de>
>   * on behalf of DENX Software Engineering GmbH
>   */
> @@ -78,6 +79,10 @@ static const struct ci_hdrc_imx_platform_flag imx8ulp_usb_data = {
>  		CI_HDRC_HAS_PORTSC_PEC_MISSED,
>  };
>  
> +static const struct ci_hdrc_imx_platform_flag s32g_usb_data = {
> +	.flags = CI_HDRC_DISABLE_HOST_STREAMING,
> +};
> +
>  static const struct of_device_id ci_hdrc_imx_dt_ids[] = {
>  	{ .compatible = "fsl,imx23-usb", .data = &imx23_usb_data},
>  	{ .compatible = "fsl,imx28-usb", .data = &imx28_usb_data},
> @@ -89,6 +94,7 @@ static const struct of_device_id ci_hdrc_imx_dt_ids[] = {
>  	{ .compatible = "fsl,imx7d-usb", .data = &imx7d_usb_data},
>  	{ .compatible = "fsl,imx7ulp-usb", .data = &imx7ulp_usb_data},
>  	{ .compatible = "fsl,imx8ulp-usb", .data = &imx8ulp_usb_data},
> +	{ .compatible = "nxp,s32g2-usb", .data = &s32g_usb_data},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, ci_hdrc_imx_dt_ids);
> diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> index 118b9a68496b..27a3127db4f6 100644
> --- a/drivers/usb/chipidea/usbmisc_imx.c
> +++ b/drivers/usb/chipidea/usbmisc_imx.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  /*
>   * Copyright 2012 Freescale Semiconductor, Inc.
> + * Copyright 2025 NXP
>   */
>  
>  #include <linux/module.h>
> @@ -155,6 +156,18 @@
>  					 BLKCTL_OTG_VBUS_WAKEUP_EN | \
>  					 BLKCTL_OTG_DPDM_WAKEUP_EN)
>  
> +#define S32G_WAKEUP_IE		BIT(0)
> +#define S32G_CORE_IE		BIT(1)
> +#define S32G_PWRFLTEN		BIT(7)
> +#define S32G_WAKEUPCTRL		BIT(10)
> +#define S32G_WAKEUPEN		BIT(11)
> +
> +/* Workaround errata ERR050474 (handle packages that aren't 4 byte aligned) */
> +#define S32G_UCMALLBE		BIT(15)
> +
> +#define S32G_WAKEUP_BITS (S32G_WAKEUP_IE | S32G_CORE_IE | S32G_WAKEUPEN | \
> +			  S32G_WAKEUPCTRL)
> +
>  struct usbmisc_ops {
>  	/* It's called once when probe a usb device */
>  	int (*init)(struct imx_usbmisc_data *data);
> @@ -614,6 +627,52 @@ static int usbmisc_vf610_init(struct imx_usbmisc_data *data)
>  	return 0;
>  }
>  
> +static int usbmisc_s32g_set_wakeup(struct imx_usbmisc_data *data, bool enabled)
> +{
> +	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
> +	unsigned long flags;
> +	u32 reg;
> +
> +	spin_lock_irqsave(&usbmisc->lock, flags);
> +
> +	reg = readl(usbmisc->base);
> +	if (enabled)
> +		reg |= S32G_WAKEUP_BITS;
> +	else
> +		reg &= ~S32G_WAKEUP_BITS;
> +
> +	writel(reg, usbmisc->base);
> +	spin_unlock_irqrestore(&usbmisc->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int usbmisc_s32g_init(struct imx_usbmisc_data *data, u32 extra_flags)
> +{
> +	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
> +	unsigned long flags;
> +	u32 reg;
> +
> +	spin_lock_irqsave(&usbmisc->lock, flags);
> +
> +	reg = readl(usbmisc->base);
> +
> +	reg |= S32G_PWRFLTEN;
> +	reg |= extra_flags;
> +
> +	writel(reg, usbmisc->base);
> +
> +	spin_unlock_irqrestore(&usbmisc->lock, flags);
> +	usbmisc_s32g_set_wakeup(data, false);
> +
> +	return 0;
> +}
> +
> +static int usbmisc_s32g2_init(struct imx_usbmisc_data *data)
> +{
> +	return usbmisc_s32g_init(data, S32G_UCMALLBE);
> +}
> +
>  static int usbmisc_imx7d_set_wakeup
>  	(struct imx_usbmisc_data *data, bool enabled)
>  {
> @@ -1032,6 +1091,10 @@ static int usbmisc_imx6sx_power_lost_check(struct imx_usbmisc_data *data)
>  	else
>  		return 0;
>  }
> +static int usbmisc_s32g_power_lost_check(struct imx_usbmisc_data *data)
> +{
> +	return 1;
> +}
>  
>  static u32 usbmisc_blkctl_wakeup_setting(struct imx_usbmisc_data *data)
>  {
> @@ -1131,6 +1194,12 @@ static const struct usbmisc_ops imx95_usbmisc_ops = {
>  	.vbus_comparator_on = usbmisc_imx7d_vbus_comparator_on,
>  };
>  
> +static const struct usbmisc_ops s32g2_usbmisc_ops = {
> +	.init = usbmisc_s32g2_init,
> +	.set_wakeup = usbmisc_s32g_set_wakeup,
> +	.power_lost_check = usbmisc_s32g_power_lost_check,
> +};
> +
>  static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *data)
>  {
>  	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
> @@ -1356,6 +1425,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
>  		.compatible = "fsl,imx95-usbmisc",
>  		.data = &imx95_usbmisc_ops,
>  	},
> +	{
> +		.compatible = "nxp,s32g2-usbmisc",
> +		.data = &s32g2_usbmisc_ops,
> +	},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
> -- 
> 2.47.2
> 
