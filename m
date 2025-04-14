Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC4E17A2FD
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 21:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744665645; cv=fail; b=a1BYQ17P6bDzx8mu67bFlpk8+yG5rHcX+wKi16t2LUDlHVWoXzBSaho05dfgqwNV4EDzRzDAO0WpLvzEYj8HdiaTpUiTyQH0recBKBKuAun4BjKGTEuTYJWZdL0EdzbBUa+TxL7T6Zwmuj38b0WpJTTw0pTyNGJhJ1ZDNlUD2+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744665645; c=relaxed/simple;
	bh=yaZTczximEsYNREmY/ha2OOgewXJI7eJKYhJKM7tKGE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q0BlE2wXcQSC0nh+1UY3IXh6ETKXZ8RKA5qP+KB2+s9tIKiZ9WfoLZOf1hAflCf8cMMxJgefnnPexbycQuMradU/vVv5VllAfbjDlI8WJFanmRCXDUGTVWMputLBtSntORWgAF1H2jrch1ExVb3y1e+a3Iw2o3Ccu4Epg2eT3Ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QL2xIseQ; arc=fail smtp.client-ip=40.107.243.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QL2xIseQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hYXDUL9d1hOUMAXT2wLq1yCD0JSxolUzY1eoFcYkY+Ravhu7yHs8iGR2om4jOmwEU+DbZ0X8l06ZYvhsFx8yuu8dTN4EQmAef5DEBNuEGte3ryTfYmyFhOe1RhxrkpbOB9DyOcAelJiBSG1+FEPbjfKn2GUvKwbkO/oVPRASkUMR58ju9xwHDkRA+ZU6nzofrDEE2A4xx/GdKZ0c2bw8OOyeEU5gsq79+rXrU5c01xdT9nmOZ49Fd4XVwcTRXuIG8pjC1Y9RVNm4jNaNP8usIzR0g/RRWR67Tu1Tf4BnofGofu0qKLDxDYVEw1BaOraie0HIiy1Jd3nYMlEh/PXGvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yaZTczximEsYNREmY/ha2OOgewXJI7eJKYhJKM7tKGE=;
 b=rW+AULbhkK0Ztwjcof/TwNJ3ohtpVUVW/mN130Cf2fQltsuUpGACV6L/y8UzGNeJH3/kQeFWZeccOkXUzT29vhDr7l0LVy+6XNiqqC1S0GwJJFSO092Tb8p2twoW/cEBO5zInusvbx2/1AGZEMhz51wo7P5u3Kp3YcWNTiVzskVT71wy7yCo3Pas5HMAwMV087zo2enQdBVLYLhf6mdwXWW2p8neFF+YrHWmDuwqXLCrk5FG2uTUFtwtLc7Qd20NREBTrZjzy3FH/5TmsMT23AcFeKEAzE6s9KgLo/OMc2PiQTh25FysgweYgip5NbFYf/oCnzomPFx9vZnC0b3dEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yaZTczximEsYNREmY/ha2OOgewXJI7eJKYhJKM7tKGE=;
 b=QL2xIseQP/EtNFpr3EeCVN1FylZYWTCq59Fsl7j7gmux/rST3OHM1zRxWGkW41ITCvx2mErwccQXMQ5z6/wSH9uoRMAEVNAC8ws0TPwGN/bFJKu/dndqkzbkogkc5up4wZvB/cm6eeD5nyutvIEhak+CI985GrJ0tVH5/fLByoo=
Received: from LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 by SJ2PR12MB8738.namprd12.prod.outlook.com (2603:10b6:a03:548::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 21:20:40 +0000
Received: from LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427]) by LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427%6]) with mapi id 15.20.8632.025; Mon, 14 Apr 2025
 21:20:40 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H .
 Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Brendan Jackman <jackmanb@google.com>, Derek
 Manwaring <derekmn@amazon.com>
Subject: RE: [PATCH v4 18/36] cpu: Define attack vectors
Thread-Topic: [PATCH v4 18/36] cpu: Define attack vectors
Thread-Index: AQHbqkQZER43NWhZ7EKeP4VmS/wRs7OjsYPw
Date: Mon, 14 Apr 2025 21:20:40 +0000
Message-ID:
 <LV3PR12MB926545F84D66CAC25FE73AF294B32@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250310164023.779191-1-david.kaplan@amd.com>
 <20250310164023.779191-19-david.kaplan@amd.com>
 <uhfexplln3n736m4yxdrfqg666x4hs5pokxqw6ycnaktastvko@zi2saqxeoidj>
In-Reply-To: <uhfexplln3n736m4yxdrfqg666x4hs5pokxqw6ycnaktastvko@zi2saqxeoidj>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=357f6c02-d7ca-4417-8441-2bf13c421a3a;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-14T21:20:18Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9265:EE_|SJ2PR12MB8738:EE_
x-ms-office365-filtering-correlation-id: 2408c191-bf41-406e-4648-08dd7b9a3541
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NFZFdnVRcXVURUpSV2xTbUZFQ1pIN3lrcmV1cG9iUlFCdmRhdXJSWW9TRUJq?=
 =?utf-8?B?dCt3ZlVDb0dMZjB2RTJNL0VKZ25pY1lxSTZLL2xWblI2a0g0OHFYb1oxRG0z?=
 =?utf-8?B?Ylh3V21RbDZkR3RxZU9RdHdXdXZuc25zR052VGJicW93TXJ6QmtpNWlHNXRt?=
 =?utf-8?B?MVZSYVk0MUdVd3Z3d0tzTGc1ZXd4S0NkMmI0Zm5vVUZzUzJZdmp2RUEvMDJ4?=
 =?utf-8?B?VzZ6NTRTS1ZYWDBYaHErRTBuYk5IVzJUeE1BS00yRU44QVhSU2pOZjR2Y1o5?=
 =?utf-8?B?RGxkdklrQ1BCNWlXV1JkZnkxL1dqS1l0M1dkS2dHSTlvS25DdEEwOGZMWlNs?=
 =?utf-8?B?akVncjBLZWV4Rm4xa3Z0aG52aFd1dmc0bjQrbjd2b0NjSEozdEdIZ210QmJ2?=
 =?utf-8?B?YlB2dGtRY0dQTk9CUWdjYk5xWXFKUjI0K0hldit3eGhoSEUyNy9oV0s0Mm0v?=
 =?utf-8?B?S3FWeXdSL05QZ3NtZDNOYmlDQVZFOGhjQWhzTmI0Tk1HRHhuOTBlMU5NODZ4?=
 =?utf-8?B?NGpoWW54L1R0dUhnR2NuM0JTNVJPc1JTclpvaW5lS3Z3UWx4VDE4WHlHbkdV?=
 =?utf-8?B?aHhHV0JKNWorM1pZdDk0aHZpL0ZKbzk5T29DdTdmOFB1WGNDem0yVVZmZ1k1?=
 =?utf-8?B?S3FXNDB6c2VjbnNETkhXVGRLNDVNWVJJbGtHMlVtVnlHcEdnRm9JeFh6U2J1?=
 =?utf-8?B?eGhsdnh1SWtsUXY4enpWdEhvdmNKUmwzZlQvYmM1ZVZlTG85Ri9NdDd4NHJX?=
 =?utf-8?B?d3dMQUF6SS9XclFNVk5ON2FIblBQcURaYU9SMjRzNmFWbkE1bFFQTWpIblJI?=
 =?utf-8?B?ck95MlU3N1NUMEFNMTMxL2JIcDk0bHZXcXVtQXNPR09vSGFPdksrSU5jbi9m?=
 =?utf-8?B?MlhEdDhmRm0raDZncDAzVndXUUU3OHRUNlRqU1p2K3Z6UEdiM3lrczlOeXRC?=
 =?utf-8?B?Yzdic3hCZHlySS9VZURVRVgwK3dOUmRybDQ4S0g3NDV3cE9ld0RFSHRmZkJr?=
 =?utf-8?B?ekc2TkZ3c0FFOGxhN1dvQ09GNjVYSGxGTkh1OFhxOFVINHZ3VHN3dzQzbFln?=
 =?utf-8?B?RjZCdTdLbkFBTW9FSGgzVS9MWVh4SGd1ZUJTZkRrckZ3ZHp1ZGoyOVhHMFF1?=
 =?utf-8?B?ZzJYeUVXQ2QvZTNITkhHVDcyTFNhbnhMdHZVV2dzc2NvRWVVdkRXVnlydFhy?=
 =?utf-8?B?MUU5amhBV1ZqNE10RVZNZ2hQNVRiWGFFTU1QTUZjWnRPUTFZOXNtWmJOb1l1?=
 =?utf-8?B?T1BoSW13VUdXTy9WRFVYV1kwTVN0dFV2MnV3NW5hTE5DNUI4UExzS2hBTm43?=
 =?utf-8?B?RlN6SUpxOHJnVi9pckJINWhESmxQVjlWN2x6YVJrbVp5b1RGdkQvNVQ4Tmdv?=
 =?utf-8?B?d2RiRTJKSktneUdQWE5rOU5sZXBZdVE1dFJtTnJKaVYvMTF3UWVyZWp2MWIz?=
 =?utf-8?B?Y2V5Mk8rUFFSRjdsM25sNkl6MnoycEVSTnZvWnBqV1FZS1o0d05hZitPb0cw?=
 =?utf-8?B?RlBOcjhhTmV1WnpCOGJhd0c1L3pRMFhLdXhDQTk5UEd3eTc3TTlQSHhKaW9Z?=
 =?utf-8?B?dXlYZUI2Z2h3eDRVM3lvaVJmSnIyckl5N05vTzRGVC9SOWkzK3MwL0Nabmt3?=
 =?utf-8?B?TmY2ckRpRmNwRWFEcjJnMkRRajB0SDBxWkNEZUdVMHVRZVpYbU5PMjhGUVNY?=
 =?utf-8?B?ZWhUS0dkQUdhWGZ1Z1ozV2RSKzl4N0Y3ZTZkdklReC9BbEpUSzJ0d0cvQ01j?=
 =?utf-8?B?cTF6V0R1OStXQ2g2OEtaUkJmY0JJcjFPaTc1cU9SdGpDN1p0VHpGcU9ydXJJ?=
 =?utf-8?B?cUJucmRUWjZFL0RFUm5FeWo3OEJpd1Z4d2lJTFRPN1hRZFF2ckkzSjA1eWc4?=
 =?utf-8?B?bDBMVktmK25NL0hpaTV4dTlYM2g0eEoweEJrNXp6djkvbGIvaExtL0thS2xm?=
 =?utf-8?B?TmNYZlVUSU9ibDd1SDRVSWhmSGRvWHdibHhkaFhHOXdSemlocWd1RUdNckZi?=
 =?utf-8?B?RHMxMEVNaUtBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cTFUUHFsaW5jN2wwcDRkbkhVdnhGQzNPTXgwTXlna0VKWjI4czgwYVJGTHRi?=
 =?utf-8?B?aXl4bVpySXJZZDBuYUVkaHFpYi83blJ4c3BWMTNHUmZob2xVaGwrZlN3U1ZH?=
 =?utf-8?B?eWlHWk1xSCtjOUNqQUE3dDlZWUlDdkJHZ2hXMndIV2VuQ01KQmZRZHo2aE1h?=
 =?utf-8?B?OTVIR0IwaHBMYjdYZkpQaFY1R2IyTTQyZmlxY3UwU3ZCM3F3RHdYTCtxaW54?=
 =?utf-8?B?V0dGSW1EaVJDQXFpWVVkVnAybWV5WDR1dU9WbFc0Yjh4TkZ2OTNMMzhjYVRx?=
 =?utf-8?B?YzM0L2RBMVNHamRXVTlzS2x5SXRtVUc0Y2tRbVBjbXA4K2RpQjZ0YzVlRFJU?=
 =?utf-8?B?UGpEMTE4UDZRcksvc3RNRHdXcWNtRmdRK2JjSjkwM1BUNkxMMEl0RCs5Z1pD?=
 =?utf-8?B?QUFSdDZPUzByOFpPT0RNRk02OGlnVU91M0JFTHRIblZDY3J6RSsvUHlFUkJH?=
 =?utf-8?B?UlVvVS9sVE9CU1R6czNuQ2RZdndFaE5qL1FpK1RGeEptQU12Znp6dERIbUxG?=
 =?utf-8?B?ODhlUEdZdzFoc1VJUHdXY1hmR0phQVNPK0pwbnMzYmNDTmRqR1BNMWhEL3NY?=
 =?utf-8?B?aGlCMENoSG1wRW9YUm03ZlU5MzYxcTdUWWhRVE1sOGhlV0ZyQkNtbzZyUjN1?=
 =?utf-8?B?dUxmUTVGYzJ4ZnpoRDB5VjM2aUd5V3Q1NkV1STFxbWYwUnVlN2pTYlIwNEhM?=
 =?utf-8?B?UkM5dFRnSGtvekM2cldiRnVEVlJNN2RvZlVjY1l5TTZvZGt1YWRjUjVVM3l4?=
 =?utf-8?B?VEhuUjVBK3lna0VXT2xYVEhEMkRPQ3NnQkRONmtlUEM1UWJleklJTjMxVkln?=
 =?utf-8?B?c2VnSEU0TDFEdDUwM3QzbTI5Y0hGM1NEUVdsVnFUSzMzUWZOMEp6bnVvZlNo?=
 =?utf-8?B?SXVKY1liVEh5dGdlNjdoYzc5V3VEdkZPN2VnVkJaL2p3bkovVUd6YWFjUXlw?=
 =?utf-8?B?ZkxSNzgwTmlmSXpVWGNmS091WDlaaktEMC95N1BxMng4NXhIV0tncitlTGdn?=
 =?utf-8?B?dkhYdG5DNXNXNk5iNVB5NTNDS2JybElvNXAvZzh0eW03WktkWnY1ZDhpNS9o?=
 =?utf-8?B?dmF2V0pnUXhQZ3ltUmdkYU1mVEkwamFHUWtQVUlHa05BK1Nic015TllvRmh3?=
 =?utf-8?B?QlgyUVp4bGVjMTB6VnBwTnBsUStNN2xHRWdqME5DdGphTVpBQ1ZHTjI5cVN1?=
 =?utf-8?B?ZjMrbXRpQ2tLSjhIZTV5VVJLc0VmeUJvNytNU2QwY2JvVG1IUkV5MS9GVEFG?=
 =?utf-8?B?dHl6bWdqOWh5L0Z2TXJ2ZGtMZktzNDhadUdoVUFESmIrVjI5Q09hTkR3Qkhq?=
 =?utf-8?B?dE51NHc2TkU4WUZMSDVQay9ySkFTNVRFYVFYUVFwZFFPK3J5M2djNzUrV3Qr?=
 =?utf-8?B?NHNBQW15dFVvbUtJN0tHeEp0TDYzaEMrbkZLUng3dnlRRHRMT2kzN0xvQWx4?=
 =?utf-8?B?VGZsekJTaFRDYzBEMjd4MTBYcko3eWpQOWUydGpOZ2t5ZjRDYmo0MzZMWEhj?=
 =?utf-8?B?YU1RS1hscThpNkt6OTBUZlFRRXFMOEdMZ21DYUpiS3lNK0tEVGcxSEFucjN3?=
 =?utf-8?B?bHcydE4wVno1N3JQa1BUaUlwZ0l6bDd0YThPelluRlA0amt3d3NCaDNRT2Va?=
 =?utf-8?B?RE93REpRejBpbDRaazNZU1d6b1QxaGlJTmUwREl5NExIaHFqWlJleEVWLzRE?=
 =?utf-8?B?MnJqVDlvTUpITGt3V0xMN2tYWVMwNGo3SGN6RWxXVE5WZ3lHSUpSWCtuRnhS?=
 =?utf-8?B?TU5IMFFJZ3ZDLy9kTzAzTkxOa0d6UDdwUFZZdUlOVUZMV3hHeHhtSGExNjFI?=
 =?utf-8?B?Q1l6SW5NUTUwRysxMERTTURDSTRYaWxsRHJtd05mc0ZrZll6bEVnZm8xRW03?=
 =?utf-8?B?enE5S3U2aHhhcG05ZG1YVXFTcmtVSVBzRk9EdDY4WE12Z0I3dE01QVN0aUZr?=
 =?utf-8?B?M3NaRkNYTm8vOW05eFZvUHlqekNtWmJHQkNhcVdMQW1aWEFtVWE4TzhYQTlS?=
 =?utf-8?B?M3BYUzNQeWZoZmpiOVRDTklJTUFoZ09LTnllR0k2Q2YvTk5YVVE0TnZzYzFi?=
 =?utf-8?B?di8raWJCeTc4ck01dkN1UjduRG9mNzVpbDVsTUFVLzBxZjJITFF3eXRuMlVM?=
 =?utf-8?Q?iNMA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9265.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2408c191-bf41-406e-4648-08dd7b9a3541
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 21:20:40.5013
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YOtlbvCXy85eq8JFhEsSemFRB2JOSpoW0ViFGDdGxvKIdOvfY0AviD6HXqHlejwc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8738

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb3NoIFBvaW1ib2V1ZiA8
anBvaW1ib2VAa2VybmVsLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIEFwcmlsIDEwLCAyMDI1IDE6
MTIgUE0NCj4gVG86IEthcGxhbiwgRGF2aWQgPERhdmlkLkthcGxhbkBhbWQuY29tPg0KPiBDYzog
VGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+OyBCb3Jpc2xhdiBQZXRrb3YgPGJw
QGFsaWVuOC5kZT47DQo+IFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz47IFBh
d2FuIEd1cHRhDQo+IDxwYXdhbi5rdW1hci5ndXB0YUBsaW51eC5pbnRlbC5jb20+OyBJbmdvIE1v
bG5hciA8bWluZ29AcmVkaGF0LmNvbT47IERhdmUNCj4gSGFuc2VuIDxkYXZlLmhhbnNlbkBsaW51
eC5pbnRlbC5jb20+OyB4ODZAa2VybmVsLm9yZzsgSCAuIFBldGVyIEFudmluDQo+IDxocGFAenl0
b3IuY29tPjsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgQnJlbmRhbiBKYWNrbWFuDQo+
IDxqYWNrbWFuYkBnb29nbGUuY29tPjsgRGVyZWsgTWFud2FyaW5nIDxkZXJla21uQGFtYXpvbi5j
b20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMTgvMzZdIGNwdTogRGVmaW5lIGF0dGFjayB2
ZWN0b3JzDQo+DQo+IENhdXRpb246IFRoaXMgbWVzc2FnZSBvcmlnaW5hdGVkIGZyb20gYW4gRXh0
ZXJuYWwgU291cmNlLiBVc2UgcHJvcGVyIGNhdXRpb24NCj4gd2hlbiBvcGVuaW5nIGF0dGFjaG1l
bnRzLCBjbGlja2luZyBsaW5rcywgb3IgcmVzcG9uZGluZy4NCj4NCj4NCj4gT24gTW9uLCBNYXIg
MTAsIDIwMjUgYXQgMTE6NDA6MDVBTSAtMDUwMCwgRGF2aWQgS2FwbGFuIHdyb3RlOg0KPiA+IEBA
IC0zMTc4LDggKzMxNzksMzggQEAgdm9pZCBfX2luaXQgYm9vdF9jcHVfaG90cGx1Z19pbml0KHZv
aWQpDQo+ID4NCj4gPiAgI2lmZGVmIENPTkZJR19DUFVfTUlUSUdBVElPTlMNCj4gPiAgLyoNCj4g
PiAtICogVGhlc2UgYXJlIHVzZWQgZm9yIGEgZ2xvYmFsICJtaXRpZ2F0aW9ucz0iIGNtZGxpbmUg
b3B0aW9uIGZvcg0KPiA+IHRvZ2dsaW5nDQo+ID4gLSAqIG9wdGlvbmFsIENQVSBtaXRpZ2F0aW9u
cy4NCj4gPiArICogQWxsIGV4Y2VwdCB0aGUgY3Jvc3MtdGhyZWFkIGF0dGFjayB2ZWN0b3IgYXJl
IG1pdGlnYXRlZCBieSBkZWZhdWx0Lg0KPiA+ICsgKiBDcm9zcy10aHJlYWQgbWl0aWdhdGlvbiBv
ZnRlbiByZXF1aXJlcyBkaXNhYmxpbmcgU01UIHdoaWNoIGlzIHRvbw0KPiA+ICsgZXhwZW5zaXZl
DQo+ID4gKyAqIHRvIGJlIGVuYWJsZWQgYnkgZGVmYXVsdC4NCj4NCj4gQ3Jvc3MtdGhyZWFkIGlz
ICpwYXJ0aWFsbHkqIG1pdGlnYXRlZCBieSBkZWZhdWx0IChldmVyeXRoaW5nIGV4Y2VwdCBkaXNh
YmxpbmcgU01UKS4NCj4NCg0KV2lsbCBmaXggY29tbWVudA0KDQo+ID4gK2Jvb2wgY3B1X21pdGln
YXRlX2F0dGFja192ZWN0b3IoZW51bSBjcHVfYXR0YWNrX3ZlY3RvcnMgdikgew0KPiA+ICsgICAg
IGlmICh2IDwgTlJfQ1BVX0FUVEFDS19WRUNUT1JTKQ0KPiA+ICsgICAgICAgICAgICAgcmV0dXJu
IGF0dGFja192ZWN0b3JzW3ZdOw0KPiA+ICsNCj4gPiArICAgICBXQVJOX09OX09OQ0UodiA+PSBO
Ul9DUFVfQVRUQUNLX1ZFQ1RPUlMpOw0KPg0KPiBUaGlzIGNhbiBiZSBhIFdBUk5fT05DRSgpLCB2
IGlzIGFscmVhZHkga25vd24gdG8gYmUgaW52YWxpZCBoZXJlLg0KDQpBY2sNCg0KPg0KPiA+ICBz
dGF0aWMgaW50IF9faW5pdCBtaXRpZ2F0aW9uc19wYXJzZV9jbWRsaW5lKGNoYXIgKmFyZykgIHsN
Cj4gPiAtICAgICBpZiAoIXN0cmNtcChhcmcsICJvZmYiKSkNCj4gPiAtICAgICAgICAgICAgIGNw
dV9taXRpZ2F0aW9ucyA9IENQVV9NSVRJR0FUSU9OU19PRkY7DQo+ID4gLSAgICAgZWxzZSBpZiAo
IXN0cmNtcChhcmcsICJhdXRvIikpDQo+ID4gLSAgICAgICAgICAgICBjcHVfbWl0aWdhdGlvbnMg
PSBDUFVfTUlUSUdBVElPTlNfQVVUTzsNCj4gPiAtICAgICBlbHNlIGlmICghc3RyY21wKGFyZywg
ImF1dG8sbm9zbXQiKSkNCj4gPiAtICAgICAgICAgICAgIGNwdV9taXRpZ2F0aW9ucyA9IENQVV9N
SVRJR0FUSU9OU19BVVRPX05PU01UOw0KPiA+IC0gICAgIGVsc2UNCj4gPiAtICAgICAgICAgICAg
IHByX2NyaXQoIlVuc3VwcG9ydGVkIG1pdGlnYXRpb25zPSVzLCBzeXN0ZW0gbWF5IHN0aWxsIGJl
IHZ1bG5lcmFibGVcbiIsDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgIGFyZyk7DQo+ID4gKyAg
ICAgY2hhciAqcywgKnA7DQo+ID4gKyAgICAgaW50IGxlbjsNCj4gPiArDQo+ID4gKyAgICAgbGVu
ID0gbWl0aWdhdGlvbnNfcGFyc2VfZ2xvYmFsX29wdChhcmcpOw0KPiA+ICsNCj4gPiArICAgICBp
ZiAoY3B1X21pdGlnYXRpb25zX29mZigpKSB7DQo+ID4gKyAgICAgICAgICAgICBtZW1zZXQoYXR0
YWNrX3ZlY3RvcnMsIDAsIHNpemVvZihhdHRhY2tfdmVjdG9ycykpOw0KPiA+ICsgICAgICAgICAg
ICAgc210X21pdGlnYXRpb25zID0gU01UX01JVElHQVRJT05TX09GRjsNCj4gPiArICAgICB9IGVs
c2UgaWYgKGNwdV9taXRpZ2F0aW9uc19hdXRvX25vc210KCkpDQo+ID4gKyAgICAgICAgICAgICBz
bXRfbWl0aWdhdGlvbnMgPSBTTVRfTUlUSUdBVElPTlNfT047DQo+DQo+IEtlcm5lbCBjb2Rpbmcg
c3R5bGUgd2FudHMgY29uc2lzdGVudCBicmFjZXMgZm9yIGlmLXRoZW4tZWxzZToNCj4NCj4gICAg
ICAgICBpZiAoY3B1X21pdGlnYXRpb25zX29mZigpKSB7DQo+ICAgICAgICAgICAgICAgICBtZW1z
ZXQoYXR0YWNrX3ZlY3RvcnMsIDAsIHNpemVvZihhdHRhY2tfdmVjdG9ycykpOw0KPiAgICAgICAg
ICAgICAgICAgc210X21pdGlnYXRpb25zID0gU01UX01JVElHQVRJT05TX09GRjsNCj4gICAgICAg
ICB9IGVsc2UgaWYgKGNwdV9taXRpZ2F0aW9uc19hdXRvX25vc210KCkpIHsNCj4gICAgICAgICAg
ICAgICAgIHNtdF9taXRpZ2F0aW9ucyA9IFNNVF9NSVRJR0FUSU9OU19PTjsNCj4gICAgICAgICB9
DQo+DQoNCkFjaw0KDQpUaGFua3MgLS1EYXZpZCBLYXBsYW4NCg==
