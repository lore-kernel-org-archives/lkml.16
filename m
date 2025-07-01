Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011006.outbound.protection.outlook.com [52.101.70.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0F7271A9D;
	Tue,  1 Jul 2025 10:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751367147; cv=fail; b=rMFGttP3rMg8gbFznS6AtzgUv5H/050414IJEfQsh0XQ6sMnqg3b46mhnr3Kc+4HFWohx+IyP/tu8ZUcBqJPtfzzbja4sicNkKaqCkyHkd/aec8rSTKU5Rj9HqwwPsl7fB6gwVq3NDjFskqqD0wrGB/uVCk1ygZ5Zeoe3RMGnDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751367147; c=relaxed/simple;
	bh=qM5fZr4mQR4KsGXwebaNKgT0UyQ2R441UIihS7rF+n4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=Kf90eLQ++p3hieWLO39rSFxZdVn7zKb7VDYuYm/zLkquiNf6d0MacocB3zswoBrNkaTlkwxBrZEmiupeuMipU14YG6S+KjM21KYSDLAJVFav/M9544/BlD8S4/R9fAqiwxnGs1jPsEUO8g6tWdQFAtyDjN6pnoG0R4dvyfl6Gyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prevas.dk; spf=pass smtp.mailfrom=prevas.dk; dkim=pass (1024-bit key) header.d=prevas.dk header.i=@prevas.dk header.b=QWph13HG; arc=fail smtp.client-ip=52.101.70.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prevas.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prevas.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=prevas.dk header.i=@prevas.dk header.b="QWph13HG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BOs04zM8NrsYpxys/SlhTDbus2BLNN5pUHLFQvqtv4YMnvxpcHeARed6ZFW5zdmT5RI/RsPrqLW7xdOsNxnOaBcsIuir0uWl5OMdUizm8I5ldfDolX1GwBLzTfFRCNjOuAOnZBam7ClUlhNCG8pZveLQXHd4OuConYRiqoR+s6CKqU+eYgu6sWLPPD5dkND2QOuIuU+FhVrNrM5TM74hMvGv8Ks+LME8m9RUK1scxb301QhtUZx63EBUMqpo4imu+f27UL25l7TpOd2RIEAtZLJRht+YlSJQH1zLi/WeMpZ9cNQvgdYME5BA1YeXUASxHiXhF13aqUtXB9Db21Ub+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MLl6cmZLuW6ihjZAjcWJJZJrQo1CgdPusl41nqwB3CM=;
 b=Yo7B1rWU13eP1fGu+FQBuyau8xTXyQcgbZllh+dWrNIWasCBlgKiMSA6gML9SEIMxoX8HNp59FlydyqqjnwbArqw2sqN9lFtFwjxaakoi6XrCZk7wYvuTZ1x51nEgwdXMzTdvDU4UGIhVrCbtm4xD2BKVOwosgxZg/dHNOX41YkwRXos5TjqCsyjGH8le1G+BYhrG3s/hW1GKESkya5/ZJuy0HphUMQBM4j2uwhyV+tJNAWYOxmyLyDnQbZHgj1TVVzSPQ4jkDn6tkfuZFJdvdKkPnnRqUPl8kG/OB43K3Z61TLd1WiyxbE/4z2VhMySKvIMNovIgbqIJy6W9GH0jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLl6cmZLuW6ihjZAjcWJJZJrQo1CgdPusl41nqwB3CM=;
 b=QWph13HGbNqfI39F6dEG7E844RPeeeSvNYwv/0VmQv9vgY7tMphqINAOnSoq3pwanX28mKI5EmY7bZaBmHK0Wnj5Lgx3N90WHhghIJg03qw0MI3Mkk8quw3BKhXurhV+f1vAc+Xyc1ZbsUJggHNWRetUnJiQEan/w03mOk97aGE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by PAVPR10MB7442.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:300::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.28; Tue, 1 Jul
 2025 10:52:16 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c2c9:6363:c7c2:fad5]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c2c9:6363:c7c2:fad5%5]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 10:52:16 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: Lee Jones <lee@kernel.org>,  linux-kernel@vger.kernel.org,
  devicetree@vger.kernel.org,  Felix Blix Everberg <felix.blix@prevas.dk>
Subject: Re: [PATCH 0/8] mfd: ocelot: add support for MDIO managed switch
In-Reply-To: <aGKpyh-5FQN3rKZ2@colin-ia-desktop> (Colin Foster's message of
	"Mon, 30 Jun 2025 10:14:18 -0500")
References: <20250319123058.452202-1-ravi@prevas.dk>
	<aGKpyh-5FQN3rKZ2@colin-ia-desktop>
Date: Tue, 01 Jul 2025 12:52:13 +0200
Message-ID: <87v7ocw5cy.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0008.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::30) To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:681::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|PAVPR10MB7442:EE_
X-MS-Office365-Filtering-Correlation-Id: f6ab1d3d-ef97-43d0-49ce-08ddb88d57ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CzhoFwuHgpatb+jo7sbR/Supv+YFXlW1NqEHIQ36bdDV/dJD84ixzMkBn/qr?=
 =?us-ascii?Q?FKBq1m1gQ8mtuF1JW+J4YykBS4p1r21s45FW22CNZLruxIgIU8GloQoeWo/B?=
 =?us-ascii?Q?ZLbDd6b7wyLL/+NFIBQDcqRSudT9HH4jPshFk+OgD9x+KNEOigad3TdYBmSg?=
 =?us-ascii?Q?uXlhIjcrHlMSwbMiTG6PHPzAiL2dB+QaEusB8xjUGWMspyilOzhANsGjBm6B?=
 =?us-ascii?Q?/uBfLqGCRrMTUDA4K1c+HvXT6ySUwitp/i3ikZV9zSQz8KR69VdPUoKh1kOO?=
 =?us-ascii?Q?D9T/q2dSLpg5s2jVCk13MJFAmTEVh7wgjN1MxoSAir8QAHkfBVZRKmRaYaIp?=
 =?us-ascii?Q?6EXWWBPDk9mgCya8MUsJJwgdPxyzTmfeIpj6TY5YHmkHZQ5A72KaH6PKFF4B?=
 =?us-ascii?Q?ER1cds8UnDt+iCuD9SCRn8+ETXADD8WCUn6/tZFBKOYyzqqBpHyaX11TDE6L?=
 =?us-ascii?Q?o8QOiw8pC6GENXIqCatCZ5a3k98tmLaXlxcifUHXLzQqtrvnigN4vnSlvSYP?=
 =?us-ascii?Q?ZwBvYIUUuRigv6aRYQSQe6G/xvbihZzIlRW7XpZBmsZ8WdXa8T36wa7KhD/R?=
 =?us-ascii?Q?1G6gUgsSR8OdcnaY1iJ3yP3kQtbzqMJjQOHZVPmf2nrKz8+uOXZkVzb6P/QB?=
 =?us-ascii?Q?/dJZk1vLdjCPKZ0Iu6DwKz/8/Z3Q7yyPl0yOM4ugtjGekf56j5tGTbMdZ6E0?=
 =?us-ascii?Q?IFxTHcfxMULW1giTWA1QvZY95zSW5r/gbICk4sPsGp//u3ubzw+8OKjTeiOn?=
 =?us-ascii?Q?89Jm3+EIP7dUUqYFGS60DmDeOE8fB3XXkD5WwwbZK9wjI7diIseu3UVhi4QB?=
 =?us-ascii?Q?/opHzDDm2OCBmO/9vAYFORgkNxZ17dSpf2Qi8UpwNBWVBruAe+kwKsT7UxZG?=
 =?us-ascii?Q?YoCT/UmdHD/IBad8Qv9jdVWTFtZ+yS9mEk+/TVoxQptL5lT0RdTpaSc4ibz2?=
 =?us-ascii?Q?Da//2LRWbCpiLoGDW6kxBE0Us5Ok3RQBiCy08+j6izSTeOsEsJMvECv+NMvf?=
 =?us-ascii?Q?hXJrR/EjdVFx2ZChPHnA9vVPuQVxhbBCMk/yATXJ6h+wYu8VFxpm6DmdhNwo?=
 =?us-ascii?Q?l31mx2tMXz41b/UhLxU0HAbQkKtmEA6AUolfmSh8kMBt36aQ+YjgJKP4HxnK?=
 =?us-ascii?Q?ymKD3EVx70N2ejhGfrsPB8U6oW43oBC99qbwvW2vfmCtGAX98m94ov/E9NvV?=
 =?us-ascii?Q?9avQtZ7Sdv8iBBvZlduUhyP/qjctwEe76dDwlClGu9arcgqtSCiQdtV8BNqU?=
 =?us-ascii?Q?MzZ005Vf/C5QfBhmI3Fb/A6gENH3vOFlQ+HA7ZiF7ZZmXZQDmB/hzUbuQylG?=
 =?us-ascii?Q?Zn3y5n+TfCFvAMU6940uznPxTNWMbjUvKhzkB4758kXGGT42yzgDF2AHtkhB?=
 =?us-ascii?Q?34SWcISO6HryB8SMGZnzpqmdsR/5ufm1CUnqh4guVlxswtL2NfRdrGi9MNMo?=
 =?us-ascii?Q?0igry8Jx9a6ghdzvSEit8L2m7Ma98nyHA7T80Sb6VarKsBLK0La5SQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GYPWU+G2gwBYc0yG9VHEQ70GsgahxFZ6hTm/xA6oSXlAyYHXWHRQVItGtXO+?=
 =?us-ascii?Q?/jVX08IfYgkAOoQdU7V1qQzJyPfs785v8iarnH7pZetFaAl9PaNpE5rbH43g?=
 =?us-ascii?Q?Xk2OwT2RmwPrXeQA9bwE6wKDKh9HzqAzTotQmWJz6Yd9k6Oyop+7DHTUTIi4?=
 =?us-ascii?Q?RTgKJAGscU2nvYIWM3GWoWoGYvOKCPtSW5LUhrrLhAf/FyTvnYCbpSkTMrY7?=
 =?us-ascii?Q?ubob4z2/21qxjOrikzZ6eePnKzhmKKuU78f2dUp4VCU9QvgFTX9thImXD7VI?=
 =?us-ascii?Q?u5C2nH9OzmPk7EkYvbDe/DPn537zQirDUdAKkWvb4PTnEo8kAt4uuhgN2z1C?=
 =?us-ascii?Q?U7vdzeBzKzbJg32eVi3vEZY1/kAt30hu1XhDKe9jcXqSDuy8hqOkswBG5ojQ?=
 =?us-ascii?Q?TmS1CMVL/dhbs5e5Uw6QCFgQBfJWeD/Oi3jRNn/ziRMEiylG/m9ovvQij52p?=
 =?us-ascii?Q?jr2CaQuggD+Rr1a5RHNQiANwpfpOBwhIZgpGkWyqemQHOnk5mk9J4dXEPuFI?=
 =?us-ascii?Q?W0xFD8BL21EkVliPPt5hLXrNSk+6/C4WcWlbT6fbUUP+mJoDzLq8258bGWs3?=
 =?us-ascii?Q?HQiRqZXT7KhdRxY35orEvA2CEP5da+FZoZ9qajedBFZ30oaFUQi0olweFrBQ?=
 =?us-ascii?Q?u2IlqJ+iSvM6+AQKJS2mVI9kKva9Ii2Jgpog8RBlX96aFvsgOB8DBXCMPLJ9?=
 =?us-ascii?Q?P23u6Y7nnfapxOfDi5gWheZY7n39mj2OXvie1BAeau5cIJXXkb+JbjCxol5k?=
 =?us-ascii?Q?qOsu0td+1VTRM0PMnKAe16AYylpe7+qJhYYZ7Dtm2mi7G5im9dlW68Y5lx0j?=
 =?us-ascii?Q?W1i9opIroz+ZY0b6+mRTaMhP2NR0D7mGZhT49/HUQQ0LjbwEFNJNmfbRVNov?=
 =?us-ascii?Q?uhzas6Fm2SWdLQh0V82Lw8dcl+RLsc0EFEdcigRkd9ZHKYBM7VEu7385X+qm?=
 =?us-ascii?Q?eofn3yUbSmXQ2N/7EZoO4J21ZqA86I1hv/uaWDj7M0X59uPHYedx01Yj6AVl?=
 =?us-ascii?Q?CE1qeKwGdKcjsnKS+9mzIbLiHc4Jd9YXJ6gBD20DloZPTdXV3lvA3wJJyyVp?=
 =?us-ascii?Q?jFRQ2UcO7K7Mc5iSEOGopSTpHOm80FGeDNj3EXtb5vo3Ema0Kx2EYByJYFVw?=
 =?us-ascii?Q?28PKSy7jsjF9tmyBczvwjAblpD+QvC0BBvgAC3HJTlop3mIdoNbP03bV8yKT?=
 =?us-ascii?Q?A/dc13rqUS/7IF/oRnaYcll83eW64c8rTd+Cxpfv9udO4LrxIWRaFN695tWY?=
 =?us-ascii?Q?8hjeeWq4g67u3s/NpDtI2y09kBO+bteLSn9zUOAH9UculAxmKIG0x/XnZNiu?=
 =?us-ascii?Q?6eGbsP2aNPyfq/QmAWIC+Xjcg2N0Kj4MAOeOVkkn0iIGWI0Tt9BY9kocfEZI?=
 =?us-ascii?Q?urKLtKLyXQpxWvC5IpWRFZ/Foiu5PhhkTf0pSAvU3/63bt6zidGbCdIZhECa?=
 =?us-ascii?Q?Cw0CeLQVLjje5IUEduimpQL+Muce/PDZTZZ3mO5/VNgkDkX/+2jm2NGG3zwj?=
 =?us-ascii?Q?+OLXGinKjWIrDBRZy3+8NvhCO0X1P2uoq76Wx5joLOduzeuivpAjE8Q3x+C6?=
 =?us-ascii?Q?tDbNAPyR/ZQTgshc8S7/Of01d5KTBeNpK4rA0dnAAkJRFeBdhyhf7dk3mw1a?=
 =?us-ascii?Q?mw=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: f6ab1d3d-ef97-43d0-49ce-08ddb88d57ad
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 10:52:16.2270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gcK60rw3miqt/jcJXGr5Ftg1jUJ+WjggVC8hWzlLHxZUQXXwUScUpnKUHhXfbkt4e+YkJfldDbyd2K5fwpVEHhu7+5yO/4eGSBG4RlWxaUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7442

On Mon, Jun 30 2025, Colin Foster <colin.foster@in-advantage.com> wrote:

> Hi Rasmus,
>
> On Wed, Mar 19, 2025 at 01:30:50PM +0100, Rasmus Villemoes wrote:
>> The primary purpose of this series is to add support for vsc751x
>> switches that are wired up to be managed via MDIO. The current MFD
>> driver only has support for management over SPI.
>
> Are you still intending to work on this?

Sorry for dropping the ball, but the customer didn't want to fund
finishing the upstreaming, and I was assigned to other
projects/customers. I also no longer have their hardware, so couldn't
test a new version myself. So no, I don't expect to work on this
anymore.

> I understand if not, but maybe the bugfix / documentation patches
> could be broken out, as I think they'd be accepted pretty easily.

>>   mfd: ocelot: rework SPI (re-)initialization after chip reset
>>   mfd: ocelot: correct Kconfig dependency
>>   dt-bindings: mfd: ocelot: mention MDIO management and add example

Probably the first two, but I'm not sure the last one makes sense
without the actual support landing. And the first one, AFAIR, would need
to be reworked as it relied on the "mfd: ocelot: refactor bus-specific
regmap initialization" which Lee rejected.

There's also "mfd: ocelot: move SPI specific macros to ocelot-spi.c"
which is just a trivial cleanup.

Rasmus
