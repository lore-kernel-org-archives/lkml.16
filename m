Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2096.outbound.protection.outlook.com [40.107.105.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0631BD4F7
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739175679; cv=fail; b=d33MNNCavcosRCfjX1dBDKvfVniySBmRiDQ/c2okbwyM03IoQZEmbDG2SoZu/qcrSXsKMIMpoziAHTzUVLV5Na/SyDA6nNRk9meZiQMUPgYhX4ZzE+v5OYvy7b462j+9xhItRdchUumSb7TBklRBdNsY5sm/vOzxk/OFxOhMJFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739175679; c=relaxed/simple;
	bh=zIzFLgrLOiABkDYsZgydRBvEIYpFwrOOvFafecS+PNw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=cAsQgHURK+RHWRXoc8w99sVAs/jH9Hsns4TPCWY8OtonGecSZPBTcEMTpn+BjqGvTETB0rbA2JNL4NfR8FzgqrDlschCr3feo6pPO92H8bSjMeqFjigQagDNTgNyaFESHv8HNzB7CJBjC4VflePO5icUNWrk7/RbeFbHEgVHPmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=OAD8yZ9Z; arc=fail smtp.client-ip=40.107.105.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="OAD8yZ9Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HpdfwBdSU8sln8EG27vaz/rdCYMvO3VuSd3sOQOmvGoLBduZ9QU2o5kMPpZ2yH74XIgBSY+xQ0BLP+EzjI7pHlVjYNfdZrzH97bbkp/YRyWr8oeey6WpRLZ8NWprf1sAtFe4n//ChUSHU6t86pwaREnlBIOnF996L53zb4+n7eL++0mXM8v2mtLal8o+0mvAkQmpclLO8moOP0/i2m2RFKKsoFPVUfIZS4IE3JqHTpGU8gmgd/bjD/TrrC+70vlAGINDUY7Ta4PGm6KI/T1efXi61bI3zEm6tRr0MsvvT2caEoelYOsZMqvp0s1UDvtG3ipJUbDzS+NyipDNdG5ECg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=av4EX47gqGMmwfwapOhYiODLeyE9FSHWVA5SghahdPY=;
 b=BX38IGt5AgtUWokCy4NAY/Xe9XhRjpRGk52LNWMqAecI/w/6xjjqlLLYLteQoAvRCgqO3m7qN7YlZCPUMrBFdYaYu3kP5Ni2pUCv4xuOunbLYgnT320uI2EwIFNmbUmlV8YrrbhyBLdDTmHUTiLzji85HcH49pl2wOcPqPhMhXUxjFpvt67vo9ZXD6VhS8s4/JQTvak8eHVLBfGZcMHgY7toVeHZF0ZLLBXfrZbrNV45mL6G8G5ntp/GPxPEESqFRWtarCwDFN/qykbjP+cezaThMqVR0cwn8JGzIo3HBJPpZ83XKDsMySA05HalWNk6drKWl09fuCh3qF9RP0HvNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=av4EX47gqGMmwfwapOhYiODLeyE9FSHWVA5SghahdPY=;
 b=OAD8yZ9Zg5L9ivL8goj3A+vGFgbuK2Y2jQmTJe1SKTJDARj9kzCcZ/vr8fijhNYoGU3M5hyPoyXYLyoGtUKkpBTDZ+ETH8Xyrho1UKVmwLibufrFg/Lw5W5pfaTySzjmavgc5+cVcayTvTnmpXmoKgmMqdZqgzLL2FCiIBkYmkA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AS8PR08MB7306.eurprd08.prod.outlook.com (2603:10a6:20b:441::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 08:21:13 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 08:21:13 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Mon, 10 Feb 2025 09:21:00 +0100
Subject: [PATCH 1/2] clang-format: do not allow short enums on a single
 line
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-clang-format-fixes-v1-1-9bcf43a4b4b2@wolfvision.net>
References: <20250210-clang-format-fixes-v1-0-9bcf43a4b4b2@wolfvision.net>
In-Reply-To: <20250210-clang-format-fixes-v1-0-9bcf43a4b4b2@wolfvision.net>
To: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Michael Riesch <michael.riesch@wolfvision.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739175670; l=988;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=zIzFLgrLOiABkDYsZgydRBvEIYpFwrOOvFafecS+PNw=;
 b=F6SuWptxyctWAve8g4Zf8XUiS0jL18c0WMvfp/LQogrWDaXQryFvrd7E/fQRZ0tYLJnspqH+K
 3fM1Mkzq4khCyGAbgPE9+10V9hdTAEioXLjxEwHf6cnpjSARVOICXv6
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=cSJmgKSH3B6kdCIDCl+IYDW1Pw/Ybc6g9rmnUd/G7Ck=
X-ClientProxiedBy: VI1PR0102CA0055.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::32) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AS8PR08MB7306:EE_
X-MS-Office365-Filtering-Correlation-Id: 40a16a72-9689-42bc-71ec-08dd49abe103
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cnhkdmJ4QkN4UnJiK1JOMUhUR09EdC9rRURQdDFRYXc5TEZQQVdsQndQUDVT?=
 =?utf-8?B?TWlhQXNKcmkzb0xHOWdjN25yOUExNWFmQ1ZxQjNYQXM2czJvZUpOc2VqTEtu?=
 =?utf-8?B?S2t5QnVpYkRWYkc3aDBxT3N6WE1EWDBPOHZPSEIwU3RYUWhPR2NmUnF5YXNw?=
 =?utf-8?B?NFY3UzhTcmFOY0IvSGU0RVhNSEdzdDduR01hNElPRVk0bHgrTHFuNDJtait0?=
 =?utf-8?B?RkJGOHNRM25xTkpyWmRuWVZZS0gzRTVzNXpRM3M4bEc3S2c3aC9BVlJIeVZa?=
 =?utf-8?B?dXhPSFV0RldkUVNpS2NWQU56UTRaaXUzdktOQXd6Tm9aQ0VPNnV4QkdXOWJ4?=
 =?utf-8?B?TnNuaHlPWUM4dUZ6a2lOQ0h3SjhCT3M0bFdDdEdIQzVsQ2hXY1IwRnN6ZGVU?=
 =?utf-8?B?TDhJdU9pdmZNLzQyRjVaaWJpZWtadmpsN3JwRkJDS1NiQWJSY3NwSzUwZXF0?=
 =?utf-8?B?c2UrY0xQcHIyT2E0ODZoZHlKbXQ3SXJDcmhUSGV3azAwR2RBOVZ2aWIvVHg5?=
 =?utf-8?B?ZkVTT3pVYzhxb2o4dWRIQjZ5Q3NGbWxkeGtESFJPbUF3ei84RmRRVnhXWjJS?=
 =?utf-8?B?NDhyTlo5dE4rdyt4eDgxRE1pYldGbzBQbmtTVVh6QWhxMFd2MGdpTGY4cEFK?=
 =?utf-8?B?YVBVeXdSNjNjcHpwbEpNVllrVzJwaXdnb2JhaXhBaTBRUzZFTEVnNUw3R05h?=
 =?utf-8?B?T3VndjYzSGQ1eWxlcmtqQnU3U3F0YzFsd3dLb3J2T3g1UFM0eW5KV0c4U2hN?=
 =?utf-8?B?NTNEa2ZEdHpDWTVXMk00T29EY1lVQlNRODdQM0pQNDQwUDB4cDNjU014L0ZH?=
 =?utf-8?B?ZXdTUk9lOG5WMmNRV0M1S3U2VEJKRkdPU3A2bGlFVEM0ZDNTSXFVODl1RTdC?=
 =?utf-8?B?MlRIdGJiYnh4d1FxR1g1UVhzaEVEWStETFFXQXNUbHpvU2ZmaGxodEFaSy8r?=
 =?utf-8?B?aUZtcFluUnRqN28zRlliZUJIdDIxSEcwMHBVVVRoRHpWTzB2SDZkWmtjaWRV?=
 =?utf-8?B?NXA3cDRwWlVIUVdTWFd4SjVNdXlrWm1iUzc5bW11Z3BNUTY0ZzdRLzY3MEYz?=
 =?utf-8?B?MjI1aW9iUkpOemszS1BNb2VFZGplQXdnbE9Fc1VLaDdTTVowQlRvOHNEaFR1?=
 =?utf-8?B?OW5tSnhzVDBvMUtJWFZhaFpIcThKNTNmQ05hbnVaVHhvMHBCZnRzeFdLM2cy?=
 =?utf-8?B?VlcxRktYR1F3ajlTcjVyMGdiaEdKYU5xd0VHeDdUWTRjWVlmUEMvbC9iQ01G?=
 =?utf-8?B?bTR2Njl4K3gvUHRzZ2pyaDduMmhURmRPejV4T0prL1pudTVQVTc3bkxuYUVa?=
 =?utf-8?B?R1lPL0VHQmF2M1pxUHhjb2xPSnMydnQwYmttbHc0NEErZDFWKytMcHBMRDM2?=
 =?utf-8?B?ZmN0STZ4N3pkbXhaQTF6OUsxTUZwOG9BazJsek5LNGl1WnZ6b29HbXNzVVg5?=
 =?utf-8?B?OGpVQkRybm1TaDk3dmh1YmNPelFmdjlzYjV5RmxWdTRTam1Kdk1CNnp5QzJj?=
 =?utf-8?B?aGVqeE5EV1d1YkphTUw5YnBnNmRLMlhld3ZMSDJnUzhHa2l6Z0dJNDk2QXJp?=
 =?utf-8?B?eWMrcmkra29mYXgwTm1LaGxJZUlRbCtlUmtGV1VxVGFzc3JiemJZSHlPUnRk?=
 =?utf-8?B?Q1k3aHBxMnJIRk5pYzhGNFdwUmh5SlBjYWtvMXZPNlFBSTR1ZTJtYTArU0RN?=
 =?utf-8?B?NzRId0RxUWdrVGtJVjA1ZlAyVVczNGlJM3JaMXlJNU1KMDAwKzY4SVRLRVdv?=
 =?utf-8?B?eVRsRlBjcDFKSDBGTXd3QVpuVDBtN1JtVysyZUZicFd2OWhXOUJ1SklMSmll?=
 =?utf-8?B?WU02TnVjRTh3YTZueU9GQ2hxVEFub2ZlYTJEM3RjUlBnRE1YV0pPL29sY29B?=
 =?utf-8?B?amhXWTVaSmlqQ0ZyRnRXV3NORHFuaFNhRHF6RktOMmlYZWNHQTMycDFybWxQ?=
 =?utf-8?Q?g6v4YaYBG+OS4lEe8EybfFs+SzMCTNuR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YW94MjJPd3NXSUZUU3FPSXEzN3Y5ZllQQW81d2Rob1pxeWQrdVhlNVVKNXFV?=
 =?utf-8?B?TDFpc1J1SXlkOFh6bkxhVzRpVC9OcWpiTmVaVlp6aWJnZzY3d2JTUndyZEps?=
 =?utf-8?B?Qi9zY2RwS0p6SEJjTW1DSW9UTjd3NnZjS1pqdnlqbkx0RGgzNTNOMkp5R1Vr?=
 =?utf-8?B?SlJzdFRrNG10cmpQSGJ1SmF6OUdDeXMzbmJjLzBnZjEzRGwxSGg4VFB0V3Ar?=
 =?utf-8?B?akFSNmV0Nk16TnZBcWZPUU9JVnN5YVhaUkhXdjlWYkpqVkVFWURxUTlBbndM?=
 =?utf-8?B?K3N3S212Mk1rcTJmTlhBUitHbDBmdHVnaVJwaDNpRFlsazRWSExoRmZyeXVP?=
 =?utf-8?B?Yzd4czVodzRWdU5nZW5lQWNSNVlNVGEzTDZNMUpiWlYxK3Nyd2xnV211dEt5?=
 =?utf-8?B?Y1A4VzVNcVVvYldIWUFHUjFlRFhGL2ZxL0ZIUkU4TUNQWjBjemdqekVJamFF?=
 =?utf-8?B?Yk9UN0ZLYnFWRC9PMjdQRjJuOVNNNmlSZHZ2Lzd5eEx4STA4c1VWMmdhME5U?=
 =?utf-8?B?YWYrWlhzTWRhZERNODVmdVB2OElnSTE4OENXdk5RclR0UGVKR0JhbHNYQ09a?=
 =?utf-8?B?cFgyWEYzeThpcDFTQ0FJVUcyWDFkVFA4WEVSTjdhSDJLWUhuNHN3cE5uelB1?=
 =?utf-8?B?YnJGWEllWDRBWmk1WFhuWFIxOWx5bFo2WGk4THNlRFVBeWIzS2JlWlZoZ2Nv?=
 =?utf-8?B?UE9wRjM3VkFYdkszOFN4QW15NUVaOXdkTWFrcUVxSlRFcmtiWk5ycStYd3Q1?=
 =?utf-8?B?MXIrd3JpMVNRV1VsOW1Kajk5Y3JqNk5DKzNPd2FDZ0FkWmdHbUFUSjUxeG5q?=
 =?utf-8?B?N09qZVAxVkVNdTdQUkd3Kys2aTZKcUUzZjdid3g5WFc5ZlZnM211VDZiQXB0?=
 =?utf-8?B?b3A5Z1hGZFdGU1JmQ0VXTFE3SXJGWHk3cTB2cTJOc3JPR0hmRERhZCtwcGJ3?=
 =?utf-8?B?MlhoUmYra2FLakJiOGRTRzREdFBhbURtdVQ4cUQrVjZsZUdmVTFGRGJLenpr?=
 =?utf-8?B?M0oyNFo2aWhUNWNSTlo3SnRDSUMycWVxc1pURTBPRW1MdThJWlZIRnY1ZS84?=
 =?utf-8?B?emRlSVBPb2gvYmhqeGlzM2xLSWZPZkhPTm02azBzdzRET21aMnBJNjlqVUZZ?=
 =?utf-8?B?U3dYdG5PeG9hczhyS0ZuNExRUXdDNWViOTRlMnlaaEo1dXdqZ3kyOHJiWm1n?=
 =?utf-8?B?V2hzVzkxc1h1N2c5TG0yNGoyMjdhSjhDOHhjNHRpWHU2TzdHQ05HMnkzS3lN?=
 =?utf-8?B?NnBGRllFWnRVVnVMcmtJdHBrZ1RYK04wSWkxL3NaSlVQWjFGa01hWEw2MS9q?=
 =?utf-8?B?dGpQY1pGVnFMT2tIUlJzUW9zclF4b1RWd0MzcWs5OVZyaCtmc2dOQkYySWNu?=
 =?utf-8?B?azVTL1hXRFRoYTQvZ2tXbFV0bmJtNWkxWmU2Y0VnNTlWT2NpUm4ycDhISjRz?=
 =?utf-8?B?ZmFScmFDSnF4VHd5MHNka2R2ZndtaVI5dEJJdW1yTmRLYnROSnN5RTliUmMx?=
 =?utf-8?B?RSsrSFN1QldhOVlLT0dCWEJaaDVkNklCalozTFZlWUpUajlPTkZELzVIdjFU?=
 =?utf-8?B?RmVTOTh3Y3FPakdBNm5za2hJYnRKcWNON3hScWl2aHQvVFNuTjVmbVpYMlVB?=
 =?utf-8?B?VWozaHoyQXY3cHVrQnlBM1lJN1NvUE1nSDVRajZscTJVYnlQd1NlOWhhQ0hB?=
 =?utf-8?B?SEkxZElnK1pXNHlHaWtGSnNqSmFpeEJWem5PaUc4Uit1SzR6aTlRc3BXTllF?=
 =?utf-8?B?RUxHdWVLZjVCTlNxbkt3b3NPTyt5ajBkemZSNnplVndudlhPa25HdkFBblg3?=
 =?utf-8?B?c1VpS3QzR3NLcWZaVkdUT0hXSDVtS0h6RzJKR1pWUDRCUThQMmNhaHg0R05C?=
 =?utf-8?B?cEQyZElnaWpnK3lpbGNpanNERk11UW9xU0J2REpJSGh5WmEzNGx0MUUreFNi?=
 =?utf-8?B?MTZ5TnBSNWt2VDRyQ2pXL1FMWUt4c2NBUmd6Y05XeUExSTJLRlFEUVpYcDNs?=
 =?utf-8?B?WUQxWWRJQWlSUDdRa2JZd1pXMFRJWVAzNEpEVU1rUWVaNVppSWc2aG9vZ2Y3?=
 =?utf-8?B?TW9kcU5MMlk5M3JWN2t5US9QRkJBazliOTc4a1V4L2xZYWhBMlFMY2Y0V0R6?=
 =?utf-8?B?QlI5Sno1OVJWOFJleXJDbjd1NGRsZGFFMlc1ZjlHaUtoNCt0Unp4RXNiemhi?=
 =?utf-8?B?ZXc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 40a16a72-9689-42bc-71ec-08dd49abe103
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 08:21:12.3322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MZSNNrauYnsxOEI3ZelbZPnFs6pl7k9VJ+XZ4RBcdwsyk4gAfjYgn1n1H58v/ZfhYbzJV9rvUhT1hiNONUhjMaAXxfono2wdjoxK26rp6CQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7306

clang-format 11 introduced the option "AllowShortEnumsOnASingleLine".
Set it to "false" in order to avoid short enums of the form:

    enum my_short_num { green, red };

With the option set to "false", they will be converted to

    enum my_short_num {
            green,
            red
    };

which is consistent with the definition of enums with more items.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 .clang-format | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.clang-format b/.clang-format
index fe1aa1a30d40..8040b516185b 100644
--- a/.clang-format
+++ b/.clang-format
@@ -19,6 +19,7 @@ AlignTrailingComments: false
 AllowAllParametersOfDeclarationOnNextLine: false
 AllowShortBlocksOnASingleLine: false
 AllowShortCaseLabelsOnASingleLine: false
+AllowShortEnumsOnASingleLine: false
 AllowShortFunctionsOnASingleLine: None
 AllowShortIfStatementsOnASingleLine: false
 AllowShortLoopsOnASingleLine: false

-- 
2.34.1

