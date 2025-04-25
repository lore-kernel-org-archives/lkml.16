Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2055.outbound.protection.outlook.com [40.107.20.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5579E253338;
	Fri, 25 Apr 2025 13:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745588321; cv=fail; b=ahzLl/TUPTISS9m8X3klIaC4+k53sUweRqv8lRS3qw77KoWBiTCPTbbwXZzbFwlLoa68WbsE++m5VXm+BwUwZImoiSVNgd8ZKKI9b2acZQeWcTGifT+XsqI8oA9piuuHDE/4jLpDcT4i+GoJiAvmXup025PcghpQ7kAty0xy0r4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745588321; c=relaxed/simple;
	bh=8QvSWd4rmn+G1ZEKi8f+TGc8yN5T+yIQA/mdWdtzwO0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=HjuVk9qeNtsMcwhu2X/ZMfWDynTQzcT1pInzt/4hZnMpkrA3YKXfjvPSfKi7YlGWn8a3IN+ImY2cATXMU6qkOCHUeIVaR34otwkRtTkWvTJippslsH1gk6gg9DJTlD8trjgZPM0bbdRyE6SN6ZfXN9AY1PyRsuluB1hESac4/IM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Bk/IPA/a; arc=fail smtp.client-ip=40.107.20.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Bk/IPA/a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jqlmKQXtiMVfwLTMtBXiTO1jShErj8V80vx7zWnyBLGCD2lPBNAz0O8mLnutja2tD0d7wB+05FOIXfzSqIdwr5N2H07wKMOhoE+mSVkehPd/4afpi8Qa27ySgoBszHTeTmh8GzviKyX++RCzgGqyRW3vP52ARr3gnL4eF3w3gjtOqVq5I1PV/jHYAMoAuPPAJAe9XVJ/pGEJxoXt/OBaCehZV0b58oDiaJ96ekAJ5fd5kd+FkqiPGFg8nncjyaObd3cpc6SsXKTQIayDi1dW0BGtp4PJuf2WHo8lwERa1SP8EL2L4Ef8SX61Jh3+EVacgxHoJLStW2yXzedMoD5waw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+o55FPMa7m6VVea9dp3slj5OALcBnoJzyUth39j3Gk=;
 b=U0XTjmc78ks29gRDPEryK06DVzYpr41zNfBIpoOVOoMG+bGqabUd4ifttd8tpsPT73AKoMNpwPEEIqVtSMZmSkI0xCLv5XceoG3na3DyKTJlyBAyWWqNV5XSusyly4qWxluiJ1APEC6Tj1zYTLnrQUfeb9oUio6+e8tsqQyv+YfJNPy3F3hbhkQqEpK0zyefOwSC593hOdsgR3TuXVnW4XuJeizVDsnm7EkU/LoNjG1+NjD2iE80WumhPJhQN0WHzRsOIUajbckBWFXThOj38w2arE80nFTViZ3grhbXXd46onvzh2kDxrSO/GDn9gRwwIMR0W0kec6TnWI8ppr8Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+o55FPMa7m6VVea9dp3slj5OALcBnoJzyUth39j3Gk=;
 b=Bk/IPA/ankNDKg6UP+Wm8Z/4jwGuToxTFB5tmS1ufY1pVGqx3VeWDvfeyOpVPxVfiRanJGlF93KOjBKvIooST2A/k2LA2ZS/eNnp0rGv+oAHut/fhATMQjds/z98P1WetGrozhv8MJptDEBGKp3aYGatHhM6uXNGZW8itjyzPFS+9DOexecFpTrKSrW/cu9XfDoQUBHkZhOINxOKDRNGkQekOx2WGYD9Aqnw2fxi9SUi346hKhpGqQRZ+JSQkKZFGYxzezs4zk91tv6GmH914rqWGYuMeSTerLGZnK+zucvcUisY7QOyeUrvkTOdolzrf7B7g38DOvDwSOZ1s5Va4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by GV1PR04MB10454.eurprd04.prod.outlook.com (2603:10a6:150:1cd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 13:38:35 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%7]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 13:38:35 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Sat, 26 Apr 2025 00:31:32 +0530
Subject: [PATCH v17 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250426-imx-se-if-v17-1-0c85155a50d1@nxp.com>
References: <20250426-imx-se-if-v17-0-0c85155a50d1@nxp.com>
In-Reply-To: <20250426-imx-se-if-v17-0-0c85155a50d1@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745607704; l=6679;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=8QvSWd4rmn+G1ZEKi8f+TGc8yN5T+yIQA/mdWdtzwO0=;
 b=s/utgLPhSq8XiKb6TRzI6/Mi9XJB2Rx6gKj8Va+c5aDjNFTTZEqNMBYhQ2WPG+tMzWIDh4Brc
 kCFweAJBqsHAqPUmvMSZt6PWpHeyV87PkpR6nPEHeYoHx9Z4vjFj4Dk
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SGXP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::23)
 To AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|GV1PR04MB10454:EE_
X-MS-Office365-Filtering-Correlation-Id: 8717aac8-e3d3-4653-63a4-08dd83fe7a7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aWF3RFV0a0xzMC9OMU4rUVc0TVdPcXZPMkQ3N1lyR1Q1eTFINkJDVXJYYmsx?=
 =?utf-8?B?TjZEamxBK3c2SWxHN2dnSWVkYzIrMnpJdmU5cFFHa0tobktZYUIzNUp2dlI2?=
 =?utf-8?B?NDUwTXRZMUc0WGtkNXVkd3VwNU1ncTQvYy9UUUJWRmFldzA2WHphdTYvVkxy?=
 =?utf-8?B?WGY4dERiZ3BZNWpwSHJ3WjVuKzZ0VkFYQjljQ1NyR1psSnR3YmlITmE3aGdF?=
 =?utf-8?B?Wjh0SXUwdmN2NlFaTFNGSlZHTlBadjdFN2tqenh4emNpVHBQSldCOGEycW0y?=
 =?utf-8?B?ajFjb2p5Z1lLakdVSmVybEVzaE5KbmNQQ3NpKzlabkZ2RkJGalJmZjFRV0FO?=
 =?utf-8?B?TkZuQStpWVhUblArYVE3dk9sQkVOWFpkd25ROHZaNHlOWlJKUUJBek5BL2lu?=
 =?utf-8?B?YWdqVTU2emYwUXNaR3FQNVdOT3gzY3FKNzVXWXJpbTdnRGFWMHpheS81dGxD?=
 =?utf-8?B?RTFVQUIvbDlsRzNFL095ZU9PWXNOVGt6YS9BQmVEWU1tTjdHc25Lc2RpaUpp?=
 =?utf-8?B?WDllVHJjMitNTHNrYWJwUG1GWWwyOWdvUmZNTVI1RjV2Z1NxN1VkaXJnUGpa?=
 =?utf-8?B?REFGNjR1ZldVNWtrV3ZBQlFoZEJkSEE3Vi8wVVRTSU9jUzBmR016MVlkN1Vq?=
 =?utf-8?B?UEVjaUhNQ3hmMkpYV0p1U3cyUFFTcnlaTjNSNHFSRjN1Nk5obGhzUlIvQjNI?=
 =?utf-8?B?ZTV4UUt3dTUrQzRDNlBDNVdzZWtTUFVHYmZUeUI1Umk2RkdCLy9GUUQvV0kr?=
 =?utf-8?B?NDB3UnlzaGVHK1UzM2x0L3JONnBZRm0zWmdoTlhOOXU1YUN3Zkd0RlZyazNu?=
 =?utf-8?B?ODdwSHhYK3orMDFxdWpDcjd1cEdLUFoyOTBEVTRwcm5nb1dhdHU0RTU1cmQ4?=
 =?utf-8?B?MXI1ckJMMW1XUTV0bU9mMmkzemxFRUFEQi82eDRCS1lITWhFMFB4RlhOK203?=
 =?utf-8?B?MFdOSjlBNnZGYSt5K0RuakFVbXVRTmpnMldqRm1xREJHc1B2MzBhQmRzMld0?=
 =?utf-8?B?dGtpZTBvWkFOKzNkNjBPTG56dDdnQ3VBYXdJYk5zbXliOGFKOGcvbW9DZmtT?=
 =?utf-8?B?QWtUa3N4VFRrMnZMQ1ZPVlBIK1c3clZ2OHdtUGtVZEl1K29KYm5PcFVyVVl0?=
 =?utf-8?B?cExvSU56UGl4OHZ3K3ltQkc4L1ljbk1JSzBQRXpKYW1zZ29NTmxuYmRtTkhS?=
 =?utf-8?B?a3R3cmZwT3BoZDV1ZkEyWTE5U0JwcUhlSld3T1JpQ0JyTWtsSUl5anlNUGgx?=
 =?utf-8?B?NmRZVGZDdkpISU1wWjRSVDA1NmtMblRPZ3RPN3c4S0hZWkdnb2NxSGxBZzRj?=
 =?utf-8?B?eVlzTk9yaDFtQTR2RnVCVXliNDF1S3ExcFRnSnBJL2s2WEFyd1BCcjBkWkVt?=
 =?utf-8?B?Y09CN2w1ekZ1QnpBZkErZngrR0lhazQrQ2ZRT05LaWlSdjh1aFpPbk1CNDN3?=
 =?utf-8?B?VVoyQkxRZWtpMDFuZmovV013NlJjRVBWYzRkOGViSEtCbDA1aE5RRWVCbDIw?=
 =?utf-8?B?RU9oSmE2a2RKVVYvUE5rUDhDU3hyazdsa2xZMmZZaSs3K3BYeTNWM0o1OGxv?=
 =?utf-8?B?bzVrV09jTnpZbVVJYWh4czBpektjRUQ1cDVaanYvakVaZFJDemdlWmJESlFy?=
 =?utf-8?B?NE5ZTmJuS20rN0dna3lsRmphQU9oZC9zaXNsbEovUmZzOFM0UmZKTU5hM1gr?=
 =?utf-8?B?V0xzOUZMZWxBYkZNVjVRYTBDTi9yQ2swQjZHb3R6T2U1QlBFUUlZYzN1cjMx?=
 =?utf-8?B?dHJGQUdrZ3NCdFBNc1F0VW4rd3h6dm5CaVdlSnMvbFRRODcvRTRoUUZVZjNp?=
 =?utf-8?B?RWVOYUpseGRnYUtEVWJPcmtwckFwUW5Pd0h3N0NUb1RDUEhNd0lMQUUwVlBQ?=
 =?utf-8?B?elRIQzJDVWxWV1l1WUhCQnZ4TEx6OUszdy9aZ0dGUjVkazBIOG1mcXJIUWhK?=
 =?utf-8?B?NXRZQ25NWUxOVFliRjRUNUtscW94N0pqdDNoS1lsMnUzVkkrRFpEMkw4VzBO?=
 =?utf-8?B?Mit1ZjJoRmNnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YytmRmF5YmJicTFVSC8zWUVXUG5rT0M1UnE4UDBSOXRPLzhZUy9nMWNTODJn?=
 =?utf-8?B?NkZxK0JvTHBxb1cwdlhXSjJIRERFdUN5UTlhRHFNMzFOb1hKTG5OQisvNHU1?=
 =?utf-8?B?NXBMNTRWMGQ2QUxMM0FPVmNkeGxwdFBJa21Fd0ZrVmpBUVM5TThtYWFlWmkx?=
 =?utf-8?B?VGhwcEhtdVdrakJIOGYrWHZhVFVJTWRRNWptaVQwc25ZdzdQQm9JdXFKbWRZ?=
 =?utf-8?B?dk93YU5taVR3YnVJbG4yUmsrSFlZVlRrS3Z1aldsRUkwVDQ4U0pxT1VSZU1X?=
 =?utf-8?B?MFJyS2VQQURLb1I4OTY5KzlxWEN5dDJsTXNRaEo2ZkJOeFE0ZzNQVE4wVEtj?=
 =?utf-8?B?SkM0cCtmMUJGdnVBbERSZjhsVmRkTDNCNjJXQzBVNDV3dTFJQjF5VS84RUFN?=
 =?utf-8?B?ak9BM3dEeUhmblRWSjZIMEx3WlFObk40V3lZUXAvRDFNNWtQTExydUJHNUVx?=
 =?utf-8?B?MThvQ2JuUmg4enpxRmg2U3JCWitoY1JXbTh6MlM0MTdvTVk3K0N4N1kxVjBa?=
 =?utf-8?B?b3E4V0t3Ym1HNHVRc3RPdS94WDVlMmhLK05ScVViVDZsWkhVd3k0TWdOeDhv?=
 =?utf-8?B?MHNpVHRiVmhjY05FanZsb0I1aTcwQkZBSnk0TG1UZ3FqUU02dEdQMStzd1Br?=
 =?utf-8?B?RFRDSGdTNllqalovTDlrMVRiUWRBTkhDMW9WL0FMWlNzamJlVlhrMS9vWVdE?=
 =?utf-8?B?eE1PNFMzNVZCeWZkS01oVnR4eTQyT3ZnbitmN3pYNi9UbFNvV1EzYUQ3MUpY?=
 =?utf-8?B?eXJNNHlDZjJSdXhzVTRQaHAwOXZtL28zb3RJalBqWGp0WmFPZ21XbXBOMjZC?=
 =?utf-8?B?K296ckZWdHV2NkhHbkZPV3VxcmYzUVJmRUZiNkpTVFIrV3F0aERWRkFWZHNq?=
 =?utf-8?B?clg3WVBzSEtYbk1sbFN2Mk54V05NM0s3cGFRVDNoQ1JOMCt6aFBESHM0MndP?=
 =?utf-8?B?NnNLK0c3MlVYUm81UWtDb0g5bmE0eHAvNDZ5SmlTUTE3T3VQYWgxZ2laVTQ2?=
 =?utf-8?B?RUNGblBSR3UrUWdQczBpY2VnOXBEd0IwV0RQdnBhdkdEMHNwN3NuL2tNNjJl?=
 =?utf-8?B?aEYxWmZjUlFJLytXcWZhbzBRN05JaTdUa055VTJNeDlaZXRWM2k1b2FyTjJD?=
 =?utf-8?B?MXRVejBSWnIzWEI1bmlUa2hPNHNJYmdZNkx4Wm4yS0EydVZYVVRnQVNyVXg3?=
 =?utf-8?B?THo4dE93dmlJQ0VrMDMyMTZZeERSWmJpVnYyUENaSmhEb1dpTHZ4RVRBbjN4?=
 =?utf-8?B?eUIwN05nRkZVdlBPQkpSNDhVVGh1YzluSG03NklERzNwMWdhcGxYaU1LeEor?=
 =?utf-8?B?VnJXcXNLRmpBbTdKd1FsVXJpUGJPOUVMS3lBVmU5RGxOMDV2ckljcmRFaHlL?=
 =?utf-8?B?UlNScVNsYWdiN2NLZGNTd3Y4ampBblJXSENKbnEwZEUrVTFtZFUyOXNOdkFt?=
 =?utf-8?B?bDZYV3hwOVkvbWFJcHVpUWRHSGNtQzdFZkJtWnFKTVAvQnFUOFY1VjN5dlYv?=
 =?utf-8?B?VWQ2ZDlFNVpSQnljOEJwNTNQa0JEMVVnaTNnSGhFZC9lY01QS1hURGVEcW5h?=
 =?utf-8?B?TU51ZmRjeHk1elRCYTl2c2F2TVpwOUJjZURyYXptZzErMXJ4dG1oNm93R1NU?=
 =?utf-8?B?Umt5ODYyVVJ3RENNTExZa2FHVFlnb2p0dHBwSVZSVGVqcW9qVitBM3g2Slhm?=
 =?utf-8?B?eG54UTFFVzRuUEllZVBZaDdSZGFvZkwzY1dWMXB4NmpVWGdaSjREUjlIRTFH?=
 =?utf-8?B?eXdvSGVKd0NSUWYrdVduOU0wWFJEQVgwdXkwWGZIczlreVBPbXR5NWRmNStv?=
 =?utf-8?B?dkRNWnVydGFOM05pM2JvRUtVR20zdXFsTFBNR0kxRWlvWlVBWHg1dzdtMWly?=
 =?utf-8?B?RWtidEFyaGlMRWZyZTc0NWl4ZXo1RnhJMTU1VmJJSHZvVkdkT01ROGZRY0tS?=
 =?utf-8?B?VUlyU0IzUEhlR3l4YnhpTk1BM2haM2k3U3ZheDIzRS9jUGpHS3BvUDZrS3pv?=
 =?utf-8?B?YXF6cmhVc1BuNkUwQ2N0L29CMnd6U0ZiTEt4V2ltditBWlhkcHlYZ0dKMmhi?=
 =?utf-8?B?K3ZJQWN6V09sdHFjNk9RSTFPa0xIZ0I2RVVMcnhaNnZBbC9lRzRMOEd4UlNX?=
 =?utf-8?Q?A+4eX9PBO+QYvLgavZJn8UlLD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8717aac8-e3d3-4653-63a4-08dd83fe7a7a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 13:38:35.7515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yL14HFv7JEOkgFKfCPzgIGNcJ9flusVSl1J3Owkv045E42DNb9flYTc1IyGKlizW7/Q/LH7PoXaRS7/in0S7AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10454

Documents i.MX SoC's Service layer and C_DEV driver for selected SoC(s)
that contains the NXP hardware IP(s) for Secure Enclaves(se) like:
- NXP EdgeLock Enclave on i.MX93 & i.MX8ULP

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 .../driver-api/firmware/other_interfaces.rst       | 121 +++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Documentation/driver-api/firmware/other_interfaces.rst
index 06ac89adaafb..a3a95b54a174 100644
--- a/Documentation/driver-api/firmware/other_interfaces.rst
+++ b/Documentation/driver-api/firmware/other_interfaces.rst
@@ -49,3 +49,124 @@ of the requests on to a secure monitor (EL3).
 
 .. kernel-doc:: drivers/firmware/stratix10-svc.c
    :export:
+
+NXP Secure Enclave Firmware Interface
+=====================================
+
+Introduction
+------------
+The NXP's i.MX HW IP like EdgeLock Enclave, V2X etc., creates an embedded secure
+enclave within the SoC boundary to enable features like
+ - Hardware Security Module (HSM)
+ - Security Hardware Extension (SHE)
+ - Vehicular to Anything (V2X)
+
+Each of the above feature is enabled through dedicated NXP H/W IP on the SoC.
+On a single SoC, multiple hardware IP (or can say more than one secure enclave)
+can exist.
+
+NXP SoCs enabled with the such secure enclaves(SEs) IPs are:
+i.MX93, i.MX8ULP
+
+To communicate with one or more co-existing SE(s) on SoC, there is/are dedicated
+messaging units(MU) per SE. Each co-existing SE can have one or multiple exclusive
+MUs, dedicated to itself. None of the MU is shared between two SEs.
+Communication of the MU is realized using the Linux mailbox driver.
+
+NXP Secure Enclave(SE) Interface
+--------------------------------
+Although MU(s) is/are not shared between SE(s). But for SoC like i.MX95 which has
+multiple SE(s) like HSM, V2X-HSM, V2X-SHE; all the SE(s) and their interfaces 'se-if'
+that is/are dedicated to a particular SE will be enumerated and provisioned using the
+single compatible node("fsl,imx95-se").
+
+Each 'se-if' comprise of twp layers:
+- (C_DEV Layer) User-Space software-access interface.
+- (Service Layer) OS-level software-access interface.
+
+   +--------------------------------------------+
+   |            Character Device(C_DEV)         |
+   |                                            |
+   |   +---------+ +---------+     +---------+  |
+   |   | misc #1 | | misc #2 | ... | misc #n |  |
+   |   |  dev    | |  dev    |     | dev     |  |
+   |   +---------+ +---------+     +---------+  |
+   |        +-------------------------+         |
+   |        | Misc. Dev Synchr. Logic |         |
+   |        +-------------------------+         |
+   |                                            |
+   +--------------------------------------------+
+
+   +--------------------------------------------+
+   |               Service Layer                |
+   |                                            |
+   |      +-----------------------------+       |
+   |      | Message Serialization Logic |       |
+   |      +-----------------------------+       |
+   |          +---------------+                 |
+   |          |  imx-mailbox  |                 |
+   |          |   mailbox.c   |                 |
+   |          +---------------+                 |
+   |                                            |
+   +--------------------------------------------+
+
+- service layer:
+  This layer is responsible for ensuring the communication protocol that is defined
+  for communication with firmware.
+
+  FW Communication protocol ensures two things:
+  - Serializing the messages to be sent over an MU.
+
+  - FW can handle one command message at a time.
+
+- c_dev:
+  This layer offers character device contexts, created as '/dev/<se>_mux_chx'.
+  Using these multiple device contexts that are getting multiplexed over a single MU,
+  userspace application(s) can call fops like write/read to send the command message,
+  and read back the command response message to/from Firmware.
+  fops like read & write use the above defined service layer API(s) to communicate with
+  Firmware.
+
+  Misc-device(/dev/<se>_mux_chn) synchronization protocol:
+
+                                Non-Secure               +   Secure
+                                                         |
+                                                         |
+                  +---------+      +-------------+       |
+                  | se_fw.c +<---->+imx-mailbox.c|       |
+                  |         |      |  mailbox.c  +<-->+------+    +------+
+                  +---+-----+      +-------------+    | MU X +<-->+ ELE |
+                      |                               +------+    +------+
+                      +----------------+                 |
+                      |                |                 |
+                      v                v                 |
+                  logical           logical              |
+                  receiver          waiter               |
+                     +                 +                 |
+                     |                 |                 |
+                     |                 |                 |
+                     |            +----+------+          |
+                     |            |           |          |
+                     |            |           |          |
+              device_ctx     device_ctx     device_ctx   |
+                                                         |
+                User 0        User 1       User Y        |
+                +------+      +------+     +------+      |
+                |misc.c|      |misc.c|     |misc.c|      |
+ kernel space   +------+      +------+     +------+      |
+                                                         |
+ +------------------------------------------------------ |
+                    |             |           |          |
+ userspace     /dev/ele_muXch0    |           |          |
+                          /dev/ele_muXch1     |          |
+                                        /dev/ele_muXchY  |
+                                                         |
+
+When a user sends a command to the firmware, it registers its device_ctx
+as waiter of a response from firmware.
+
+Enclave's Firmware owns the storage management, over Linux filesystem.
+For this c_dev provisions a dedicated slave device called "receiver".
+
+.. kernel-doc:: drivers/firmware/imx/se_fw.c
+   :export:

-- 
2.43.0

