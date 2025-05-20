Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011054.outbound.protection.outlook.com [52.101.125.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C657F1373;
	Tue, 20 May 2025 00:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747701529; cv=fail; b=KirxGsXQgZQ+Zo46zY+9WXsnKs2QpZKvtwdDjMxfHi5MAC7rbF7840ty6Noa584D5YS4oxTKJZ7qkOz39fvYsvDEik1uRZn4JJX6J2zKl9SC9AOpDkVuarmQ1eUdbHx3BzwMR7AIk1fUcdF+pHk27DCMxewrf6GOzUcOmKpxRQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747701529; c=relaxed/simple;
	bh=aVszThGqxDauU4GpCKp3g+Y7xuIcPgqj/++F93Zdyb4=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=uI5d3dwYxrzK2fCVHu1FDWP7LSSIlmqaoJcqbeSZL4Qd0/jV4j5oN7smVHZ0xxtMHkWgb3MXjo6IVSLLKHNk4KCljeWqIYXan307iIzmxZIi+9zB2WhLD5l5LK1pYqQNMATJyVXW4O5XL7qLM/lVLIjgdVGNPd4FA/Ae5tZtc/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=A7nnhs4X; arc=fail smtp.client-ip=52.101.125.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="A7nnhs4X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xZfesds2zhOR2rQCWTcCSUtWetB1K6V/hRd9woLjwPRwFkGeJZXbBkI4cK5cIx1TOGiF9s3vGP+nyE3n5V2UlrJOOIAERUogQzP4zIVzBXbQL5NC3eWCn3TLLShlnl6UbbPelbT5ZiECKVZNBGfPVIoiM8eeLyBcsbMRFjbkUvIlM8movOp3aFCVfHF1Qe9GL2HOrNPzLdDdVx5u+npPpKRiiGIIJ0plO9TXFuqT0TY/pabi034eB9VZSoJG6SQ1yJG6FRyMYFyeM16m6cWJQ32YLmbov3z7VKVifqlj7mGddL+/8iiU4oKHIm0V3x7ttdsDbbQoe9ZIMnFZGT85fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wq2zv7MgXylzdmZqGUUol7iTj9WbICGwpAUf72IhlG0=;
 b=X6HJSTu/E885Nuja28GImkxqdQL4gp0zJ0VDL7Gq1eLqeBkLiR/W8ebVXLa9e7xpyOAoaRITkEtOmFGe+KqaF71Fd135kkvuu06+12LQx0njuH4NCApnMiTFqbyA8UekcRbM4yHqJ6438OKlb7HZSIrNTdWYlnHtsR9ezGhOypVTo/EiLS2rUOFmqPvtDp7POHwXiDNqVqQENYcTimoqzlnvH2ljw3Uq8g7i/WD2h8DypgXPnSqBNkax2o4Rf6lhRDrkhpF/2duzDsZIaswNHKjfcBqVU5f/LnPHI06YuzrofBQIpixpa7eIfHb+MFqv4+AtsjMrvTHcw1Yc1dzcCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wq2zv7MgXylzdmZqGUUol7iTj9WbICGwpAUf72IhlG0=;
 b=A7nnhs4XCZNq7ASXqb0BnhBNfJLuyXhjaHnUC/pwOJjM8hNpFqZsBOiypIk3gWWUDUxS8e/s2RA0dy5bwnfGEmBNviKLf6m+ZFMb2m1VehOJdP/61qhQAN8ioCgZNjyxVQGl8eanwOX2GVEng7awunwuuPYgK3GYoPW1hnDEdFs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15507.jpnprd01.prod.outlook.com
 (2603:1096:405:286::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 00:38:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 00:38:44 +0000
Message-ID: <87o6vonmjw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mihalcea Laurentiu <laurentiumihalcea111@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH RFC 2/3] ASoC: audio-graph-card2: support explicitly disabled links
In-Reply-To: <e6d88cbc-accb-4423-80e4-3972766047f4@gmail.com>
References: <20250515153128.147457-1-laurentiumihalcea111@gmail.com>
	<20250515153128.147457-3-laurentiumihalcea111@gmail.com>
	<874ixltjzw.wl-kuninori.morimoto.gx@renesas.com>
	<0aa11ef6-4166-41d8-98bc-6c7687d10b11@gmail.com>
	<871psls8nw.wl-kuninori.morimoto.gx@renesas.com>
	<e6d88cbc-accb-4423-80e4-3972766047f4@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 May 2025 00:38:43 +0000
X-ClientProxiedBy: TYWP286CA0015.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15507:EE_
X-MS-Office365-Filtering-Correlation-Id: cf655128-3cde-4e68-fb4a-08dd9736ace0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yu0NJqD6Gj/gaKNS00nGczI/ZItlJuBy7bUMCnW6JZ5Jq8SyD6TGcpihAPAL?=
 =?us-ascii?Q?MLemeKfnJlnIeF5qpNm0IKp2e95D8AxVQFOm5M3xUUKk5XIAs+QpdISiCsni?=
 =?us-ascii?Q?2ceK9mYYBnZoQTXsNCNTHokdK75NpOg8oDyQ1j3CrFTYFOWeovFbluJABjmF?=
 =?us-ascii?Q?4tVhEkdVLpsmIl3NZBY9IlZS6ahid2KtyJ3wgA915zD+fUEVac2ZHwjhN799?=
 =?us-ascii?Q?5lyTsgoVuwCP7zu2EWm4hBSkWmE7DhTQg8GCvi3uCD+i5wb8gcK85OqGbxVc?=
 =?us-ascii?Q?9I1IaRAl3SLF2CIDdLBG3dD77lngLFk53gGVKPKVvutMzWwNlqrbslj1D/VM?=
 =?us-ascii?Q?Ng2kNXvfAeJmTiBfmP269xLysjzE4lMvJl3wEuEpFXbtGK/VzT24ov1G8Bpp?=
 =?us-ascii?Q?GNbV37EnuD2ZZqxlMuacYveQOZ+OSB5dOxf3GkNUcDUnn1dyE8qMpU4zLH7v?=
 =?us-ascii?Q?QE9EwrFtTBMlqPeM8Ea8lRexIgmAeBOf+llZoHT7Nb4kIT/GkgQJWFxEn6nZ?=
 =?us-ascii?Q?3RDI3Uj3ElVHSLej8ekmnre42nNlKkxjNRnyAUyc54OuwOn/7E9dUUSUZNrZ?=
 =?us-ascii?Q?hcZttXWcwtkPnPq91IMdskMLJGCB1Aizsd76Lser/0ESSgG0Wx2gVML3+7x4?=
 =?us-ascii?Q?mVRmbU+1k0YQa5LWMdGA0XZBAhONRt1lvwljbkHRiZ+RaxawCMFA/XDaFPCk?=
 =?us-ascii?Q?IFKWd7APLIVfMZr/TSICS7PNMg6ThSuYhXtaStkcsy/J7oFvB+xWsQCoh/Tn?=
 =?us-ascii?Q?CilJIOwkhwFtEggPHx88wRYc3UOySMBVteGCNgQpSXcS0UIpU3khZqyaHNbs?=
 =?us-ascii?Q?MUtR7td3cPcXSrBAJlA4JhS0Gy/6KscvushSAXYLB74jOZ5FpOEhe41/LLwU?=
 =?us-ascii?Q?fdQFfNkja2V/xjF8BX2CTqymBdX38stcp+hk7FE0LdeV3iYQokuKw+UMpjY+?=
 =?us-ascii?Q?0AgN9ny/8eEtkwaOoHrqITNodBHoFdr3aHyg4Z6L+s3wkmCEJvCgDCQuRUmp?=
 =?us-ascii?Q?VwamqThBSXH+MhWxrnLcmLCC9PgcsiPJR6mbgVww3rILPqVEQ55+HbKFbEnz?=
 =?us-ascii?Q?q+mV9qu0pvQFqX7R0gVxgtG42Q2Py7pBQbjrGyKhbxENPZUgXfb5HT7mJGz6?=
 =?us-ascii?Q?gDmDiUlLztJAwRtHu9CLPEKaS7pvPb2ndH8kdMvMGRyYK61UOxH5Xyu/iL8m?=
 =?us-ascii?Q?XAN+oUnlLGj8awjuohVPawsRpCJS8wyAoKFxUtVSP2YbNeX07ft1GykjtgfA?=
 =?us-ascii?Q?LT8c5KJGe0744PzPJaQG2hZb8DfOHpqGEKtZQejcHJBznOKhXCGpvEqDAH6V?=
 =?us-ascii?Q?a6W+K7hou8Rp0f9mXTeEgjcoTXchogX6aIicygIb5XugqlILl9nzZqDBOz1H?=
 =?us-ascii?Q?jW8u6hF3+8a24AuOE0hcfEEXpeQh/eFShRTm4VTCnKxunDYvVAWzYmryqtG0?=
 =?us-ascii?Q?+MQSjmtPc1FxHaYFib8/rhQOhLHd1c11YkQqwfStnSlv9pFQe6pl8w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yMP2JvAGlw+hOwZ7SfcUoqemLfr0oq7ICeMRaQw6ewWLSU6yMHd1HRe7sFvm?=
 =?us-ascii?Q?h+erUrjdRtlCdMBFTJ+pxz9HqYYBJAbkYfZBUr/ppEU+zzf2aDKIc7oc5DUy?=
 =?us-ascii?Q?PbgQy1md90Ty5O5Oz4nY3+ZKwFaDxOYxd+yd7J/lLMtsdZrtrCwGoYqzITr0?=
 =?us-ascii?Q?ihrHEUgh8cJO0cYNuuh53XFzE67veFNdJ1bGEc1RUP55IrJqlXoHKTXbvo0o?=
 =?us-ascii?Q?2Z3kinHV8d6x8lgXicN8XloNgk3zFtvcPS116oKIvW6EcIESJ9/1CPQ2Tv8B?=
 =?us-ascii?Q?SUiZ1m+29B6770mW+4J/vTbc2MLTmOoX8tKDfjNCxc5vyEa6i1g5Yz6UGpJN?=
 =?us-ascii?Q?VRrZ1kGxj1kBgNQX+R39U2Cqq2GWvPdUFNgXn0DaU/7DnU1PGcMVzEURF0vV?=
 =?us-ascii?Q?9qTSZZ3hBJ+moenDHmHcmaeaK/RqCv4zaMiNdISu3IJgPd34OYO0mNrpkcIG?=
 =?us-ascii?Q?A3Ic/VFGiPsTX2eNCV62xpOcLUknYabPNJUqrGOC1EMsqpbyAm2JdnGqSClK?=
 =?us-ascii?Q?iS4RlYF8vg6OHTyGMmgVYXZ57WW8QYWqGsH/sRDvm4u9/kZeNr4t8iacoN2L?=
 =?us-ascii?Q?1wiIYWFFvCePWbB46OW5Pb/m5k70DjKse+K9wR+PT9TniQBOl7yc8azFFj4N?=
 =?us-ascii?Q?txdyihtP6Ct3a4HtaZF5FhLsd5DHXjUxJiE3nWpAiVW1orC6CLrrQ5fqFz1j?=
 =?us-ascii?Q?Kn495iEREsCHkqZEox740TptN3O0CQtpcW4GN6aR/HzGxds6SdcLi88MsJOQ?=
 =?us-ascii?Q?1nQ5T08xQo+eyqHfILn16HH3NODx7RaY03dG8BpnkCCE/tpsE9sMcHRVtGq7?=
 =?us-ascii?Q?eqbmyOy7XJ1ut0XDHEAPe5cfh+G+MF8QtLqKGa9JMcDe5HFURjwqskm47jpm?=
 =?us-ascii?Q?rQcN0Cdu30E6v9+i61X6f5vywPsgONH0ncclujCD76hVJOBfPUpVqn59PN+/?=
 =?us-ascii?Q?+sGLHV1HVEHUNch3Zn/eVvR//UjisSYEe/5gO7ABFO544MKICyOa5z1/ZXA8?=
 =?us-ascii?Q?03heFRdIZ6xDPWcyt2Y1+cIkVe6L06ixpgKD5oZsJnl62eu9Lr+y5iT4lwqW?=
 =?us-ascii?Q?FyBEQwhvGvADiFwZTHuoPZyO6b0EvzZtl4pLLZU4I6QOHvDLJhqSVov7fHnd?=
 =?us-ascii?Q?W1NeVTZGLuOo/rr+Qsb7e0uZ2YJx9fCo1tqG2dCJjWl/89y1FLd0JILps6Fb?=
 =?us-ascii?Q?nvBcjcZUfOPVzuPriZl1kwZwR4aMykxgAZB1d6AKbM0rZoXc8+IbBX6xr6o9?=
 =?us-ascii?Q?Dm/3tZ3qj0nrnGdW9jYCOdIa8+w3nCfqBhyDjd3TsJZQ1h1lydRyFcUKQGcM?=
 =?us-ascii?Q?x2Ye1ZRB+eClE0PHM4LD5f6H0KaD4ritl5bbrmMRf7lIKJAtMBRVGNomglfx?=
 =?us-ascii?Q?OPtBksmGdKlWLs/wgn2PB2Tp1i9yOyfEFkL24utKECCDH5CRLgOhTR0QMuDe?=
 =?us-ascii?Q?3YCnvkcOGTNQ2eLf3CduU8dNzWOiQR2tx8OBq61DQutYwSn2S9zpxTvPCaRR?=
 =?us-ascii?Q?I9oJQ+WhYnCQNS07Eq8JdZHhsVR0DJDpofKu0S/sJi5W8xXkLhhRiMmHkysG?=
 =?us-ascii?Q?FfN6jqWSjyfKhs33UVvA3YvK3EiyqPVTFC7pgZTfma7ammlZtEK4AnGUBbc1?=
 =?us-ascii?Q?/Hl2ZGR5oeA1TOhdLZTyLuk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf655128-3cde-4e68-fb4a-08dd9736ace0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 00:38:44.2258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +PNTxynaNgaq7M/6Q0Ui7T7sk63OT8Pu6unUTxtfGtIB9gklptVT/WEl7jJ1Ai/eRNvocSQAlt8CCScmoOLGm3mEAafLZVGaYvF5uwp0/6PVocahOHLop9yOzOZjSgdS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15507


Hi Laurentiu

> so, the problem with this is the fact that (assuming you've used a DT overlay
> for the PLUGIN) you won't be able to use the DT overlay on other boards because
> you've also added the "Headphone0", "Codec0" route which is specific to BASE's
> Codec0. We have multiple boards so our system would look like this:
> 
> 	BASE0			  PLUGIN
> 	+-----------------+
> 	| CPU0 <-> Codec0 |     +--------+
> 	| CPU1		  | <-> | Codec1 |
> 	+-----------------+     +--------+
> 
> 
> 	BASE1			  PLUGIN
> 	+-----------------+
> 	| CPU0 <-> Codec3 |     +--------+
> 	| CPU1		  | <-> | Codec1 |
> 	+-----------------+     +--------+
> 
> 
> The plugin is the same. The only difference between BASE1 and BASE0 is the fact that CPU0
> is connected to Codec0 on BASE0, while, on BASE1, CPU0 is connected to a different codec: Codec3.

Ah, OK, that it the reason why you added the route on BASE side...

Hmm... I think my previous suggested idea (new flag) is reasonable, but you
mentioned that you want to check whether it was "disabled" or not.
So, how about to add "plugin-route" and "plugin-links" instead ?

BASE
	my_card: card {
		links = <&cpu0>;
		routing = "Headphone0", "Codec0"; /* for CPU0-Codec0 */
	};

PLUGIN
	&my_card {
		plugin-links = <&cpu1>, <&cpu2>
		plugin-routing = "Headphone1", "Codec1", /* for CPU1-Codec1 */
		^^^^^^		 "Headphone2", "Codec2"; /* for CPU2-Codec2 */
	};

Audio Card2 parses "links" + "plugin-links", and
"routing" + "plugin-routing". It is more intuitive ?

> > 	BASE			  PLUGIN
> > 	+-----------------+			^
> > 	| CPU0 <-> Codec0 |			| Card1
> > 	|		  |			v
> > 	|		  |     +--------+	^
> > 	| CPU1		  | <-> | Codec1 |	| Card2
> > 	| CPU2		  | <-> | Codec2 |	|
> > 	+-----------------+     +--------+	v
> 
> one important thing to note here is the fact that we can only
> have 1 sound card because all DAIs (CPU0, CPU1, CPU2) belong
> to the same component.

Indeed it depens on the CPU side driver style.
I have updated my driver to allow to be multi components by checking DT.

I'm not sure which one (= use plugin-xxx flag or use multi Cards) is
more intuitive, but supporting both is not bad idea ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
