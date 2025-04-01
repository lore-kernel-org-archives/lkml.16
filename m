Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013011.outbound.protection.outlook.com [40.107.162.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A142AF00;
	Tue,  1 Apr 2025 13:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743515125; cv=fail; b=gsIg3dZkjVSLBgtIE5hGN8wGDuJ24991Q63ZgcMSy293OeIZCdlDoB9HaFlfao37zQcVBwYygumkebZhwt/zPemjVtXtji09xvydNylS6n4OIB0Q6YOOiBxmG/KuANorMW+h17Qewz5cvvwpmxkBJfkb1JFHpeO7NtCFYOKPpJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743515125; c=relaxed/simple;
	bh=JfBwt+YFeLTLSowSf+MGyNdNWtpNrZkQJ4OPTn8El34=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WmEkWjzRuReoFIPA7SfPd09mMFk1Qp8JVlgsmr2qZTmYxHISg2li2xJ0WHNBFwQZQ1sUkXrAWY6F37kOtUC6q7O7TsRjHnxXO2y3TuG9fUKb1dJGLWyEU7j/g6VmW6i35fArTHmOfGttlgVkC1bA0o0lpp5egW/Mmkchl9u7yFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arri.de; spf=pass smtp.mailfrom=arri.de; dkim=pass (1024-bit key) header.d=arri.de header.i=@arri.de header.b=swKMPhpL; arc=fail smtp.client-ip=40.107.162.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arri.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arri.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arri.de header.i=@arri.de header.b="swKMPhpL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UQ5MC2QlNALH4dUg5qo3Dz+QQPPJMRt1Nw6vNA8ZIwKe0feMXZf7csUI3LVrai1rYvnRNudXSVEr5S5YZaHXZMFYMH+/VnXfLjiv5vgw1XbQ2CXRuDE0zGS3KRkmQirTswVsn07wdjtAFxLfMvhm7Ix7ObDMXnv9tG7zzcSjPrM3BEyc2jtlVhb5m7eqs0vqyLLkR9aOMbhC/MkP1n/uhwTIhcjl5EkhqKldCF5fXfl5YbvxXvtUIaAIvNBhMBadbHIfK1Gp9hdKsDvcfPFpe5FGgzuWxK8sI9KoQc3+plvu3KrabHzX3WnG6eoNFX5xgxOAhHYYTSWDVDg6OtnDLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKseY4LmRe0ts5dd3i47X+7Kky4h/VpDZYlxh83jiyc=;
 b=FZpTAH3sItnjGZEZFrZTTCy+CkXq0fbfHdcihozLrknUiFzvlslFMDUbXsJbOOd2WApeMEXp0HylGp1BGafsMLEKvb+zcp7ix0rB38ayxgbAl4riH/VPxcO6QVpMmdEjTFAELxwzWLpjqgDzFrt6GP1arT2H5UsNDhjuj8oI12ppo/OZ5psi60v6PrBO1L5J04fuVE25ObCOhGRVERErw6kQyt+3yEzLqYPZDfs0yzGUGDe8gztYhRBQYnqUW1iO/vSUODH0mBQheyR0iIjyysY1sMU0nkof54uUnXTIB3+a0Khr3ngfVeB4qk/7ms/6ilr0m9L36V0j0xTkMd8VnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=arndb.de smtp.mailfrom=arri.de; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=arri.de; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKseY4LmRe0ts5dd3i47X+7Kky4h/VpDZYlxh83jiyc=;
 b=swKMPhpLJmdZIKqbeohIjsUJ+DiRig8RpuBrxKVCA+WslI4JbX3La+jkrW6+fd/zOYtBNbAQwTeWrY6mmwz/5SRC1pS7mRWdIMz5p/Pgv0dCwAXfRCuxCEIWFZbSLXlHgATVakjhALnnVBQ0k5LX18v4rkw5Lm3c9m0jSffgqM8=
Received: from DB8PR09CA0008.eurprd09.prod.outlook.com (2603:10a6:10:a0::21)
 by DU0PR03MB9684.eurprd03.prod.outlook.com (2603:10a6:10:44f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Tue, 1 Apr
 2025 13:45:16 +0000
Received: from DU2PEPF00028D03.eurprd03.prod.outlook.com
 (2603:10a6:10:a0:cafe::dd) by DB8PR09CA0008.outlook.office365.com
 (2603:10a6:10:a0::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Tue,
 1 Apr 2025 13:45:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 DU2PEPF00028D03.mail.protection.outlook.com (10.167.242.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.22 via Frontend Transport; Tue, 1 Apr 2025 13:45:15 +0000
Received: from n9w6sw14.localnet (10.30.5.38) by mta.arri.de (10.10.18.5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.38; Tue, 1 Apr
 2025 15:45:15 +0200
From: Christian Eggers <ceggers@arri.de>
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Markus
 Heidelberg <m.heidelberg@cab.de>
CC: Markus Heidelberg <m.heidelberg@cab.de>, Jiri Prchal
	<jiri.prchal@aksignal.cz>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: Re: [RFC PATCH 0/2] eeprom: at25: support Cypress FRAMs without device ID
Date: Tue, 1 Apr 2025 15:45:14 +0200
Message-ID: <2759958.vuYhMxLoTh@n9w6sw14>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <20250401133148.38330-1-m.heidelberg@cab.de>
References: <20250401133148.38330-1-m.heidelberg@cab.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D03:EE_|DU0PR03MB9684:EE_
X-MS-Office365-Filtering-Correlation-Id: 66cd0fd9-f327-4df8-2463-08dd71236f06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?djZSalVHNUphVytQWnV0d2k3b3JMTGdwdm91ZlZBUXEvQWFVQ1ZhUThHSUpJ?=
 =?utf-8?B?RVFQaXBKVEdIT0xtTkx6Tkg4cFZpVTllUzhKQnh4UGlXVHF5aVFEeTc0ZEdS?=
 =?utf-8?B?UkZGYjZVczI1eW55WU41RGRPcWVFdnV6OUQxWjdrTVd6YmdiTDFEWlJ2LzZO?=
 =?utf-8?B?T3FUeWZIRmFqakhiYjdnaHJIVTlvcFNyT3VBLzVFYU9rejcvK2l5b212enlr?=
 =?utf-8?B?TWExSTgzRUN5TGNEa3BUQmZLTG5PM3dySEN5S05nVkMxRGpIdjNmanFaSDVE?=
 =?utf-8?B?eEZrQzN0SDd0R0NXMi9MbmdOZ0VJNGtoQTZFSCtKT2FuNDY0YU9RazFYSlhu?=
 =?utf-8?B?dkg2a0FIbXFzZW5EcUZSUWNCNkxlQ21SWFg1b0Y5Nld1OWx5bENteCtXdFZL?=
 =?utf-8?B?bDdCVGRkVC82dVFyR3RZSHJvRG56MWVXRzBWdmlIaWVnSVpzZmtIKzIvYVAy?=
 =?utf-8?B?UWU2RGJxeERqTGdoQ0UyRXZuR3BFWVBaVVRNMzFvOUZvQUludXZObVBENWMy?=
 =?utf-8?B?ZVo1TXowRXNXNFRRYlB3WEpuMVlVN1RjVGxtYi9FVmRDQzMrR1dGYnN5cmU1?=
 =?utf-8?B?RUZ2MVRPa1VwVmpwQlhuUVRHek84ZmJlOEFPdWVIUlQveFZYWUJ3cFRpandC?=
 =?utf-8?B?VFZ0QkdCZWQxaEVQWFk4NnJiaTBYQ2toL3BxRjVnRmdDZW1LUG12NmhRL2Ex?=
 =?utf-8?B?NVY1OXBTWDI3WGMvY1pkV1dwVjJrSnRkc0NhSGoycEwrc295TklrcUYwQ3JF?=
 =?utf-8?B?dDcxbElvV3FVdjliNHF5V0FRWGhHR3l2TlJkVUp2QmE4aVYvOW9sR2N6YU5J?=
 =?utf-8?B?b3dUeXdXak13QWZYS05sQy9CTEFPRHNzYTBPVXBzbXljSTV0T04zU0lZOEww?=
 =?utf-8?B?bmJyOE9mOFRuNlpuS3dXMGNFcE42RkR5YXd5eEd2V0ZmQmMyVUllRVZENWps?=
 =?utf-8?B?cFE3VnJ4K1ljWTcrOGNIeWx1Nm1oRDRObUMwNEl0WXFaaGNKSVUwelNTVGZE?=
 =?utf-8?B?MWxJUmdMYmRPeUhpUUpLdTYvMXlnRGF4alFORjRqUHN5Y2dqQlVQOUFaNDZo?=
 =?utf-8?B?SnVvYmFwUzZnaEFwTUlwd3dNanBNV2J0cEZvblJqMGJza1FEVklJRU12RnVs?=
 =?utf-8?B?bDZkWWUrQW0yRlAzTG1ubkNVUndCcDA5MjVWa1lGRE01WEJONjlUN1lYOXN3?=
 =?utf-8?B?bWNOZytYaExqN2d0Qm9TZUxOMEkvcHVnbDl5VG0xZFBhNU9jUXQwOE1HcjNj?=
 =?utf-8?B?WHJvWjliaVZWaUQwL0gyUWNJZjZyVDJ5end1NlVUL2hMaTRCWWdOc1RRVXpL?=
 =?utf-8?B?WlE3cnNiODlmSk5XTWVZNzQzS0FPTFBjNnlWZEV4ZlMyY1BHRmZuMlhXU2JY?=
 =?utf-8?B?aGl3TGxqSDI1WkRxZ2p5TFk2WWVXSGZUTDArQStoUFV6ZjByZHYwUHZtd0J2?=
 =?utf-8?B?QlNxbzNrWDVEbGFnS0V6OWJZbUJmVjUySDhsdVp3Ty9NSkNNaWg4WEVMSXU3?=
 =?utf-8?B?T0wveDJtcEJsUnFHNmkwaSt0MzNaTjhtb3NtejBGTzZ6eHExSks1WjVqL2xQ?=
 =?utf-8?B?anpBbzNjeC9XaG1OUHBZS0dMN3IrY3oyN0tmeXZUWFN1dWV6cUxHUTBpa1Ry?=
 =?utf-8?B?eW9BOW1scGtMRU5nNlB1NUhJemNzWlVDVG16M1ZxbnptbzFob0RNTDBqeXIz?=
 =?utf-8?B?T1NwL29lbk1tV3lmT3M1ZnJZUmtSNURSVTZ0emtnazYxQUVCeGVmQ3RLMkow?=
 =?utf-8?B?WTVMcFM5SEVpZ20vYU05bVBYL2R5b0VqQ2tuN213VlBhUDhhR3pXOWVpWGVQ?=
 =?utf-8?B?M1JsOUVGMzlMdzVQVmE4WWxpbEV0WjFHUko1WG1mc1pEeGFsaWhrU1plUURT?=
 =?utf-8?B?NGk2N2NzWGxzbnJqMEp3WUxNYTY1QW5RMWxucmoxNjRsMFQ5OU0vSEJhQWpT?=
 =?utf-8?B?ck5ZQnYrU25TelA4T2JEVm0zd1Q1cjNUL25jeWhRb1lPdW51Q2twV01wOWlq?=
 =?utf-8?Q?o1Rb0vKRP5DvJzW8T/srjXdv5Of9as=3D?=
X-Forefront-Antispam-Report:
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 13:45:15.6321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66cd0fd9-f327-4df8-2463-08dd71236f06
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D03.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9684

Hi Markus,

I use the following FRAM device: Fujitsu mb85rs1mt.=20

This FRAM is also not able to report its size (at least I didn't
try). I can use this FRAM with the following (Eeeprom) settings:

		compatible =3D "fujitsu,mb85rs1mt", "atmel,at25";
		reg =3D <0>;
		spi-max-frequency =3D <30000000>;
		/* mode0, uncomment for mode3 */
		/*spi-cpha;
		spi-cpol;*/

		/* from the datasheet it seems that there is no page size for FRAM */
		pagesize =3D <131072>;
		size =3D <131072>;
		address-width =3D <24>;

Is this what you are looking for? Of course, the "type" attribute=20
reports "EEPROM" with this configuration, but my application don't care
about this.

regards,
Christian

On Tuesday, 1 April 2025, 15:30:46 CEST, Markus Heidelberg wrote:
> Hello,
>=20
> this patch series is marked as RFC because I'm unsure if it
> should rather be implemented with an adaption in this binding:
>=20
>   Documentation/devicetree/bindings/eeprom/at25.yaml
>=20
> Currently supported FRAMs use compatible=3D"cypress,fm25","atmel,at25" in
> Devicetree, the memory size is read from its device ID.
> For FRAMs without device ID this is not possible, so the "size" property
> has to be set manually as it is done for EEPROMs.
>=20
> I had a few solutions for implementation in mind, but opted for the
> simplest one as base for discussion:
>=20
> - Use the existing "compatible" string and additionally set "size". Only
>   read the device ID if "size" is not set.
>=20
>   But this way there is already the problem that "size" is required for
>   FRAMs without device ID, but I cannot specify that in the binding
>   because of the reused "compatible" string.
>=20
> Other ideas that came to mind:
>=20
> - Add "cypress,fm25l16b" (chip is named FM25L16B) and define "size" as
>   required property. Use that instead of "cypress,fm25".
>=20
>   According to Documentation/devicetree/bindings/writing-bindings.rst
>   this might even be necessary regarding this statement:
>=20
>     "DO add new compatibles in case there are new features or bugs."
>=20
>   The existing "cypress,fm25" ("FM25" is not the real name of a chip,
>   but the common prefix) also doesn't seem chosen right regarding this
>   statement:
>=20
>     "DO make =E2=80=98compatible=E2=80=99 properties specific. DON'T use =
wildcards in
>     compatible strings."
>=20
> - Add a boolean property "no-device-id" to the existing "compatible"
>   string and in case this boolean is set, define "size" as required.
>=20
>   This seems a bit awkward at first sight. Also, would this really solve
>   the above mentioned problem with specification of the binding?
>=20
> Bye!
>=20
> Markus Heidelberg (2):
>   eeprom: at25: support Cypress FRAMs without device ID
>   eeprom: at25: make FRAM device ID error message more precise
>=20
>  drivers/misc/eeprom/at25.c | 42 ++++++++++++++++++++++----------------
>  1 file changed, 24 insertions(+), 18 deletions(-)
>=20
>=20




