Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013037.outbound.protection.outlook.com [52.101.72.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E87253356;
	Mon,  2 Jun 2025 22:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748901688; cv=fail; b=Hh6v4Qga5LmHHIvppucn1roJeJKl3+6y6PipYAdMgPg+tL+2tuwc1IHvN1tJ6QMv4KJnK8vFXGOLW/Y27wHtQIyb7z+xNrKw3vi9gNy8BB5oGYqZnMNCRv86B6Q1nqqTp0q0tBghOpuLTxs/CQ7YYv1ZhRr1uBGNV62Rv+AkGPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748901688; c=relaxed/simple;
	bh=p/TYGjKPOM1fZxZWK5t8ri5jqN9WJSlj88fsDNAkO9k=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DtW6QS7UXmPEiBsDyothyjYmKm1ezilSSWUlSAHVRfQqUBFsQezUA0UeBi15EMYKPFaa4Bv8ZDrKzz0YIrOqucsq0SQwKY9xBG1qmrj0ANkXPBSRrdTqGpOZ5FIXc99IuI+rpck40qWnFuKJ/iWg3tQ6E92BM/snbKb2WKuZZd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=P6gRx8On; arc=fail smtp.client-ip=52.101.72.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="P6gRx8On"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MD+3SCjPkt5NeDEghb7fczIisRDK9BVE5ji3YyGxkjYMPY3qa9wIojl7X71iJACXb0GauDh0He8uFrM5qCNWotB9wVYC/CVUimRB9ViSBgwytWHdvFUYHNHi1qN57E7WZdi8sGHRvwwG1mJS1eX+V0fn69eIgJ97+RulDkbfTHkQPyfNpX8Mt1Sz2jA207gcWqyRASjV/hRd40+v6nkHi4j20zWm4rkeRDe+CDnYyd7t4VNtdYUJfjgayNLeSCA07F8RRAgCjZ/I7DXpE3aDhT8fpVpCIUt6UZQRq0z/cjKErEdQrxZJ2giL2tQuP1E/o/zT/tw2/IFi3BG7OiAKKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/PuCiKcUMBH3IAQEeTInjIB7Yq68IPm5dRw7XbOFXA=;
 b=gIINtLiQnVU4/TYo8KeY3hVf75sl6Zv79roPkZyur8n5EiWtFE9g3/6qD2ulHUcC+ogA6AkhreEkcwZ922zlonc3/uCaBTOyDnE1VqFNMYM81rsEJw1ucyxVr3qYv2koKYjbudcSDU8RoTGUAPwQUtgBOjjRdnfv68VKDZ5J4fDlgzHOtHIvEJ8+aiO6mZz97T1szl0ByXEic2BV7J9UuhSg/pX29AP/L9e6ZGrue+Mt2Gmt1K/UDz1xGbPWu2NdDoR9+31gn9sL7VKOmxaCBc90vk7YKaB4I5jghtoJjBygcRtzrKbKV5fqjll5/hQmZHQnb+rfoLtLGTNP5BBnEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/PuCiKcUMBH3IAQEeTInjIB7Yq68IPm5dRw7XbOFXA=;
 b=P6gRx8OnRhWtjJalAioKvw1Gbg480oKaUW3jlddI8yNTcGqp6hrNfqTqKbQxdnEKSJbNYewDS5YqSkdFm2Qaga+KzNQfv3kVHZqOcJzZ10I/OSIq2fwpVhYsUsnJyOn6ajzssC+uEDHx9GIW1h4YXw4j2oQ55dD2Hl3KDAyF16NMSI36Duhshj0ZLb3bPPf/PgNz6dnC08CHed6ONGa+vwluvuK3A+QsHiQCA1GvaPVC6xybk4HBEx81deW5L1EkLv0PPNqvHsls2aOYHaEX7MJCSC79+Ott2AoBi+n2SKnKiJ7IoIaqfxE1cdNwVfq6ryzkvtH0Nr69C5ql3T9jTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB9756.eurprd04.prod.outlook.com (2603:10a6:20b:677::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 22:01:23 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 22:01:23 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 02 Jun 2025 18:01:02 -0400
Subject: [PATCH 2/3] usb: dwc3: add layerscape dwc3 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-ls_dma_coherence-v1-2-c67484d6ab64@nxp.com>
References: <20250602-ls_dma_coherence-v1-0-c67484d6ab64@nxp.com>
In-Reply-To: <20250602-ls_dma_coherence-v1-0-c67484d6ab64@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Shawn Guo <shawnguo@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 bjorn.andersson@oss.qualcomm.com, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748901674; l=4078;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=p/TYGjKPOM1fZxZWK5t8ri5jqN9WJSlj88fsDNAkO9k=;
 b=8Owc5tS64K87EitolBKEK9us3ZJ0rjkAW09TfcFlfV+RPdJKelnRjRmPhQ1WMyoeCjQsiyiQC
 XWJOL72ZPWTCEkzD0HlGr6mxEe/aFJ0IijwcLg/WoDM4BY2bU4C8ow+
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P221CA0055.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::27) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS5PR04MB9756:EE_
X-MS-Office365-Filtering-Correlation-Id: 1513d413-a634-44d7-1544-08dda2210358
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y2dtd1RkbytnaG5qTEEyNXJiTlBxSEM3RTA5YzlKU2NCREpwRlY0QTZCalkz?=
 =?utf-8?B?SVo2bEF5aDhFUTA2aFpQL05lU2hEeCt3WkZVUDJNeTlMaUp0ODJaZGhWWEMz?=
 =?utf-8?B?OUtleEJkYVRhZFh0S2l6TTdGb2pVZnhCUG9adlJ0aEg0OW5OSVpoMmVHWGU1?=
 =?utf-8?B?eVNJVVlvVTBFazM2WVBNRjFvWEt6S0JURm9SUHhZNlZrVFoveUsyeE9jWUMv?=
 =?utf-8?B?NHkwUGFHZVZpVUNEVUxlR0Jlc3Z2UWtGcVVNRkxNOVM2VXRDTWtONlNFd25C?=
 =?utf-8?B?Y1JibEd1RzhLbFlaTTIvTGVkTGZ2VUdzRXE4QVJQQVVmS3g3UkJzVjkyRWZ4?=
 =?utf-8?B?NTh5TmhYS240Q3dlMVRnRzM3Y2FlTlhJbXhRU01aak5xSW1FZlNxem5xMXBO?=
 =?utf-8?B?TDhNbTI1TkJRZk9RdVBCR21JWkEvQVJ0Qk53S2pSckZic1c0Y0pvWnRHa01o?=
 =?utf-8?B?ZFpUTEg2ZWdGcUpQdUJWZWQ2RytEdTkwL0NzdXVSb1pNOTlVSUE5cGZTRFZ4?=
 =?utf-8?B?d3piZkRkU1BIeGFTYkFqbnkrZXBSZkl6VmNnWDNHTVR3aHAzamFjSFRoZ3Fl?=
 =?utf-8?B?N1BlNDNlTnNDekhIUjNad2tSOHRIVTZiT3MvWFlUOEZXd0ZldXAzTllhVy94?=
 =?utf-8?B?aXpkWGNaOTZWK2tLR0Z5RHRZTGVrd2hqQnc5TGdxckhDNjZRRjlhRGhLVVZp?=
 =?utf-8?B?eHRMWmdmNFJaS0wvb21raTB2OEdlSk1iYVovVFZoZjc5TGx1bmthMEJHYzc2?=
 =?utf-8?B?eDlXQ0E1dTZVMUNFNVBidGN4V2xXdUNzc1RNU0laVDZ4TEZWVFdBWW4wZjQx?=
 =?utf-8?B?azhTZWNVWkhIMUl2UW5WNDI0UjBGNWdFblBzeldaeUEyQkM3UXI3M2JkUlRP?=
 =?utf-8?B?dXoxZHQwb3JKM0xjR0tsbG9pQVRNQUF0MW0rNlFFWTBlS05Qd1RmT3IzZzUx?=
 =?utf-8?B?RkRVY3Nrd1d1eWk5dUhYcnBhMUhhckE0WWxPMGNlbStIZlA1WTBPTzFCYzhn?=
 =?utf-8?B?TDR6K3prUjU4cFR3RzFXOTVJejNVZTdaYW9TSjZaSkZ4SEpiaUhPdGJWdnk2?=
 =?utf-8?B?QUtYMHhiRG1WNDhWOGd0bTVsSVNYV0lieHVyZzBFN2x6Z3V0eGYvNkoxNzhH?=
 =?utf-8?B?WHpjMXhtOUxiVHc5OWNxMFRWNzdCdjBOODdHa3dkK050WDBBODJlN0h4dzYz?=
 =?utf-8?B?VVRTMFpOdTcvVHhFbjNUSVZWampqbGlWL25rMWwzblNoTzJ6VUR5SGhSVlpj?=
 =?utf-8?B?YThxZVV1UW5XL0J2K0N1TXhycHZNcTc1Q1FyWTVQazZyb0xQVVhLZEZwbGp2?=
 =?utf-8?B?N3h5Qm9UNnFyQmlVQkhHUFdOWTZ4c3FYMGUydTJ1ZmN4VEtlbEMxUkhpZU1U?=
 =?utf-8?B?bEdOd05hTnk1YUZNTUN5ZEQrSmwwYWJSQldNNnVlRFpBanFZUlc5RVFteVI1?=
 =?utf-8?B?YXRQQUNKelVITzljQ2JGdVl3YTU1bjN1V0FGSDJHaEtwcWIyeTZ5aW1UVWlX?=
 =?utf-8?B?WVlSamZJb2VKODJTeEJiTmd0OEVFWGtZMDVRRHA1UUM5c21CUHRsZVRhQUpx?=
 =?utf-8?B?WWNQSVVrWjRRNWtTM2tpVUo3MnIyRGRidWgwbDFmblJLem5YZlFOYzVmSlMx?=
 =?utf-8?B?ZWFxdmcyMnlnYnpYQncxeDhRdlArT1BGbEZ2dEw3NVRGQ1RQOUJ2WEtCcVdl?=
 =?utf-8?B?Mm8yd1pZM0swOERDQStyeDhnUUc2a0dDWTVtT3dWUGtVODR3RDFreFJUTEc0?=
 =?utf-8?B?ZmVRTmpUWnZnMXlJU2xZQm4vSWxhZVhuNXU3TzhCMGFOcVNQQjJwY2svazQ0?=
 =?utf-8?B?d2ZWcEVlTEJJQ2g4YmdsRU9sWmluZVVnUXpLUEF3NCswNnpTVFBVblB5NTdE?=
 =?utf-8?B?Y0V3T0I0Nk1ucUJTSmtGclczbHczTlV4K0FrOGl0OWdqMGZXbk5sVmNmQ1hy?=
 =?utf-8?B?ZFR4MjJScGRtRHJmSytjQncrOXgyV085cWxGMkgxaGZINkt3Y0dHbVlmYkVv?=
 =?utf-8?Q?nr+bt/VZJKFckf9nqq88fL0TxjAomA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFdIbytQcFB5bXBoTW1xMzRCbk5rR1NKYnY1S0tZKzVabnVsdjF3SGR2ZUcx?=
 =?utf-8?B?bXdzNXJxanlxMVlaczNBWjJweVBaZTFoRVJ2QWwxVHJvWGI4YjFtMWIyeFpE?=
 =?utf-8?B?WXZ0V0MwL1RrQ0NmbXFYZSs5dVh2dnYzUlZhSkJNbDh5eHJmOHhlMldwSE14?=
 =?utf-8?B?d080QkYrenBQaThvY2NKRWhvT3owZ1p2a1dvcDhrQ2ROZXFScWV5TmZEMGlm?=
 =?utf-8?B?OVpRRWcwd3FJVnpiL09EWWsxMFVJVk00cml5a1VzaURlRlhOWTdwU2VBSEdE?=
 =?utf-8?B?eVRwYmJab3UyZjliMDVCaHpvRGs0NHlkMjhkK1Y5bnpXUm1Hd2NHWEo4YWlm?=
 =?utf-8?B?UG9sMXl3Z1gyNDJwRlVMYkIvRXBLNkM0MU1sS0doOGZPMmhwUTZPcFFpZGRU?=
 =?utf-8?B?blg4Q3JkeU5HOVJKOEpSR0hOdWxMU0hxQXRlRVZOaVlKbjgzQUJxdVduSmdL?=
 =?utf-8?B?UldSQ1I0aDlkbHQ2RlZEUkZMN21tb1gyOENwbHN1U0NOTFRKWW9NdEUzTFFR?=
 =?utf-8?B?djIrYTFhMDFjaFh0TzBvVXhMNFg1MDF3amtON1h5TUdGMFBnbXpVLzJXVWRG?=
 =?utf-8?B?cC9yY0pPZHE3c1pXczFuOWRZUGhvVGJCM0o3TkZaVzFpaW15bDFoVkFPam9R?=
 =?utf-8?B?L1FjcVlpU09jVzZ3SUNRQWJ3Y3V1TDJ0T3UvelRLbnBHalphM3NmRzFGUHhE?=
 =?utf-8?B?UTArNXI4YzdFWU9kT1BQSzVZVW8rQTFIUGx2d21TcTk4akJabEtIaEhkWUJN?=
 =?utf-8?B?Z1A4VS9ob3B2NFVzUzBWM2VKWUl0d2MxdHVHY0FOZHNxWXcvUEhXVjJGVHlx?=
 =?utf-8?B?eEFicmdvQ0VFWXJ0ZXBnMnRuSk9SRVVISzhIaWdrdlAyc2ZKbzNPbTk5MlE5?=
 =?utf-8?B?aUJDV3ZxUXpaTFgveVdGVWE0K0pqY2lkN2hYTHIwVWh3KzBkT0c5RWU3dVMv?=
 =?utf-8?B?WGc3WEhQK3pZaUtmUlg4NkptUThBaHdDRGQyTURFZHZKeFpvTFZLdU95dTRF?=
 =?utf-8?B?TGVDTnRWUytKOE92S213Wm1ibVFiZ3drUXlFb2pEWUFTODg5SHYyN01oVlVN?=
 =?utf-8?B?ZGc1Vm5zb0thVEZQQ1M4RmdVS3Y2UkZnUDl5R1pnUXBObmhzTlFDOVNvQTRY?=
 =?utf-8?B?SU1FVUdTMzBrM3UzL0trM0xlTDBzWHpoRmR0ZW1KNnNIR0I2UCtHUUZkZlBU?=
 =?utf-8?B?VCszbGFVZGE3ZkRtNnJ3VXBqNDZRaFU0Yldja1hLZFRFS3k2UjgwcTEzRnpl?=
 =?utf-8?B?d1pZcnNDY0dFbVUvRTdDMkZnOXVraHBmRlRRMDcvWlBqWEVVaXpldFZVdUlE?=
 =?utf-8?B?Ull5N1ZHMmhtbDZDemoveXNSRXZ0dThud0M3V0o1ZnJmc2tFUkIzTWh1UVcy?=
 =?utf-8?B?VjUzVlZrL0trTm4ya1VPaVY0YWEyUFBZaGwxRW95NytUTjFoeTFkUmhVMjhW?=
 =?utf-8?B?RHh5czFqQXExbXRQZit6UzBmV3hBOXFCV09RV01mWjlHMG9WR3FaSmsvT0RQ?=
 =?utf-8?B?aXhtSWErZi8ycFQrUVFuWjBuYTlNbTMwVVpKaExuVmFla2JtQ2hhWjJPRzNj?=
 =?utf-8?B?VENxTkwrZ3JNTzVEOG9Ld0NPY0JGNGY3MkFBWjg0YkFKZnZqNnlmMHpwVW9w?=
 =?utf-8?B?ZmhxQnZoQTA1NUIzZEd2dEh1czRsaFFtblg0MmZ0SGlSenlBbUJUcUl5M2pr?=
 =?utf-8?B?aFBGQkJFbUorVDUvM0dFZVZLTnhoOXBsMC9mT042TStqWUQyNWdnM1F1YjNS?=
 =?utf-8?B?YkpjTHkySDVVdjhlRlAvMUFyd1ZwRVZzcXdWRkxSWjRIU2V5cDA4N2xyZzEr?=
 =?utf-8?B?WG1nMWwwVlFWSTlrajdIcDVKc2h0bGx3eWp3aEY0Ukd3TWhrN0N0Q1BlZ0Vj?=
 =?utf-8?B?UDhlSmtDVERSbTFZYzhkS0E2Y0VlcUFYYnlCN3lCYXZWT0RYc0VlZUZETS9z?=
 =?utf-8?B?a3R2NWcwNjMzMkU5aTZEcVluMmtyTGtsbW9ickxCUWdXRE9CZ2tzUGRzb3p2?=
 =?utf-8?B?MXFIaFZaT0gyYXVrdlNmeTJUSnRlenZEb1ZhVkxBOGpOQWJFaEF2elpJc3Mx?=
 =?utf-8?B?cGN2WllRSzJPeFVncnQ5UVEvZVl4NGNtQ3Fzd0NwUXdkejJkSFZtSS9yU051?=
 =?utf-8?Q?T8h9trz6oxlJ4pBqDc7SyX3iZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1513d413-a634-44d7-1544-08dda2210358
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 22:01:23.2269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DEjSkK1H6ILvAZwbwUQxYg0AtsZ8JBaArRDic85ET0NpS8D+NH8ej6SWcv13VDKR8RB/Rtv1PopqNC3hgPBjtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9756

Add layerscape dwc3 support by using flatten dwc3 core library. Layerscape
dwc3 need set software managed property snps,gsbuscfg0-reqinfo as 0x2222
when dma-coherence set.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/usb/dwc3/Kconfig           | 10 +++++
 drivers/usb/dwc3/Makefile          |  1 +
 drivers/usb/dwc3/dwc3-layerscape.c | 88 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 99 insertions(+)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 310d182e10b50..13a86cf03b94b 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -150,6 +150,16 @@ config USB_DWC3_IMX8MP
 	  functionality.
 	  Say 'Y' or 'M' if you have one such device.
 
+config USB_DWC3_LAYERSCAPE
+	tristate "NXP Layerscape Platform"
+	depends on OF && COMMON_CLK
+	depends on ARCH_LAYERSCAPE || COMPILE_TEST
+	default USB_DWC3
+	help
+	  NXP LAYERSCAPE SoC use DesignWare Core IP for USB2/3
+	  functionality.
+	  Say 'Y' or 'M' if you have one such device.
+
 config USB_DWC3_XILINX
 	tristate "Xilinx Platforms"
 	depends on (ARCH_ZYNQMP || COMPILE_TEST) && OF
diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
index 830e6c9e5fe07..cd635b77902fb 100644
--- a/drivers/usb/dwc3/Makefile
+++ b/drivers/usb/dwc3/Makefile
@@ -54,6 +54,7 @@ obj-$(CONFIG_USB_DWC3_ST)		+= dwc3-st.o
 obj-$(CONFIG_USB_DWC3_QCOM)		+= dwc3-qcom.o
 obj-$(CONFIG_USB_DWC3_QCOM)		+= dwc3-qcom-legacy.o
 obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
+obj-$(CONFIG_USB_DWC3_LAYERSCAPE)	+= dwc3-layerscape.o
 obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
 obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
 obj-$(CONFIG_USB_DWC3_RTK)		+= dwc3-rtk.o
diff --git a/drivers/usb/dwc3/dwc3-layerscape.c b/drivers/usb/dwc3/dwc3-layerscape.c
new file mode 100644
index 0000000000000..d093f178e1e35
--- /dev/null
+++ b/drivers/usb/dwc3/dwc3-layerscape.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 NXP
+ */
+
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/usb/of.h>
+
+#include "core.h"
+#include "glue.h"
+
+struct dwc3_ls {
+	struct device *dev;
+	struct dwc3 dwc;
+};
+
+static int dwc3_ls_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct dwc3_probe_data probe_data = {};
+	struct property_entry props[2] = {};
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	struct dwc3_ls *ls;
+	int prop_idx = 0;
+	int ret = 0;
+
+	ls = devm_kzalloc(&pdev->dev, sizeof(*ls), GFP_KERNEL);
+	if (!ls)
+		return -ENOMEM;
+
+	ls->dev = &pdev->dev;
+
+	ls->dwc.dev = dev;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		dev_err_probe(&pdev->dev, -ENODEV, "missing memory resource\n");
+
+	if (of_dma_is_coherent(np))
+		props[prop_idx++] = PROPERTY_ENTRY_U16("snps,gsbuscfg0-reqinfo", 0x2222);
+
+	if (prop_idx)
+		ret = device_create_managed_software_node(dev, props, NULL);
+
+	if (ret)
+		return dev_err_probe(dev, ret, "fail create software managed property node\n");
+
+	probe_data.dwc = &ls->dwc;
+	probe_data.res = res;
+	ret = dwc3_core_probe(&probe_data);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register DWC3 Core\n");
+
+	return 0;
+}
+
+static void dwc3_ls_remove(struct platform_device *pdev)
+{
+	struct dwc3 *dwc = platform_get_drvdata(pdev);
+
+	dwc3_core_remove(dwc);
+}
+
+static const struct of_device_id of_dwc3_ls_match[] = {
+	{
+		.compatible = "fsl,ls1028a-dwc3"
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, of_dwc3_ls_match);
+
+static struct platform_driver dwc3_ls_driver = {
+	.probe	  = dwc3_ls_probe,
+	.remove	 = dwc3_ls_remove,
+	.driver	 = {
+		.name   = "ls-dwc3",
+		.of_match_table = of_dwc3_ls_match,
+	},
+};
+
+module_platform_driver(dwc3_ls_driver);
+
+MODULE_AUTHOR("Frank Li <frank.li@nxp.com>");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Freescale Layerscape USB3 Controller Driver");

-- 
2.34.1

