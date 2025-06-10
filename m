Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11olkn2099.outbound.protection.outlook.com [40.92.20.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375E7380
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 00:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.20.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749514241; cv=fail; b=GPJB25/VIHKp6YJlzWqDrXm+MdWGBuRe/nouekVv+2GrFtIU1TPNCfLRWUztRFsR7PvkjdQR59NX+4OAwnPgy9wDh74cOOq7I1kqkjvOQGp0YTkvg/3Ml8pdEg3AxHh6CNCNUIH7BfkzqnOw/jXnuNuAANf+1DGBwqWveZmsGAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749514241; c=relaxed/simple;
	bh=LTBHmD3TzbRIGRefKwtVnGqzDozvZ+iGlrVZv6ZsKss=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uN8kq8R8ygYjWbjzYlyumfXx3uVCku+faUs8a2UKuaChgZv++wkKbBvvGcpKXw3ci+VI5ltEkULdtepAvoLKEwTynMlT9/FULRbqQ5OhN4lzTGVq4DnDUEaAuW17hfKMHpVMrCvI4gCNRl7nw9jpBUP3g+qdgj3OLFymjMEZrB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Pp5KA82o; arc=fail smtp.client-ip=40.92.20.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Pp5KA82o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p4K1CiiUlxGlqiFmTdElmAlPC9Sm66N/83BThXWiDNWoMRTzpDt2+6BXUfMAcdtHp+0WixHwj/I1euURQzpRq9SJounMtd68zcaqMosTRR8RxOU5aa8Z52V3hLjzrzGA7plIk+nsns7dk/GmqfA5XR9XfXZYg55XAys0racrVS8kx2ebHszlauoJyJ51Dy531KozOEflTE6DME2s2aIrv2zKUx8I1XmPQGmHVbA3EKRA4X/3+pzW4IK+eQpUCzBuvAMATUIRIb4sUoSgJacYRX0IwxrZc719cEqw6DGjOQcgrKJwcIrvFEFp1nMwTZMFZZ8sbZAUoMgvlrwhm4J3Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRjece5dh7QYfNUUy3jXZAM2ese8GiLzrraJvIbJ2S8=;
 b=VhwIL4FBt47po4IL5xy7LSzYAKjQhcJ/m8oF2qOH647vml1lqBLBu0YLzvDrRTQ5FlUwoycLWaDvI4fGLyeEEW/grja+9FjVuhXBDILsJj7cLGTXjCGEGVhYoIiWXoy9cTMZVPzV9kDv47x5oTnYeOwGwnO/4GYT2ea+M2N6YkNqZDJwUjOfT9xi/nkaeyVir0VHpumkyKZt7L7nO4g+TntntZvxbw9Tt5opVwKk7pYgglzy8HVILYMZWhKRHWYkwR+yYUHwJdd9SmmsC08YTXXjhBtIYKDWJqj1hGbdyevLgVcgRiN62TshdimHaOBMgA3Us5T7aZqpW07RNGqX0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRjece5dh7QYfNUUy3jXZAM2ese8GiLzrraJvIbJ2S8=;
 b=Pp5KA82oEo54uQ66mWChbFKWLUrDm5Ob+PKolTZ9U7SKrydT1h4DfPyHPg2yPEZrEqlO1hKBTD+16Qm1HpRMCRzBzxQE5GruAZzdW3DhFK4nBOZf9qIlS/DsyZBaYMVXZlthzcgEcO+H+3pI7bJChWKOdL5kCGS6Pp6uU4jcDvQFND51n32EXhEEIcWEJFcvaides9iknGiwIO7g13qY+mcOcT3Za+nQ7YxIptpxkSYmEfjWTsYlc4ah6bmkh4/HfGflIO9/dbqeh24OqeYcnk2yuMd9rcGsxJW3+52QtrnkhuhtTTOfcdWsW0YP38iAVHAhxeM5UsRxvAZjRmBi2Q==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by PH0PR02MB9362.namprd02.prod.outlook.com (2603:10b6:510:285::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.23; Tue, 10 Jun
 2025 00:10:34 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%4]) with mapi id 15.20.8813.016; Tue, 10 Jun 2025
 00:10:33 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: John Ogness <john.ogness@linutronix.de>, Petr Mladek <pmladek@suse.com>
CC: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
	<rostedt@goodmis.org>, Toshiyuki Sato <fj6611ie@fujitsu.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH printk v1] printk: nbcon: Allow reacquire during panic
Thread-Topic: [PATCH printk v1] printk: nbcon: Allow reacquire during panic
Thread-Index: AQHb1xSho8nU9MLzwkSkmSrct6gEFLP7htqw
Date: Tue, 10 Jun 2025 00:10:33 +0000
Message-ID:
 <SN6PR02MB4157602D9A334023667C5DE9D46AA@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20250606185549.900611-1-john.ogness@linutronix.de>
In-Reply-To: <20250606185549.900611-1-john.ogness@linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|PH0PR02MB9362:EE_
x-ms-office365-filtering-correlation-id: b30ec281-30cc-4799-b5d7-08dda7b337b8
x-ms-exchange-slblob-mailprops:
 YfhX3sd/0TU8VVbw95g/H0W45Ait49GjLFsOoIedL4zwxvwQMmlJewDNCvN+580HAreisd2q3WriUE8UvdiOZPRcchrX6SHd3OT+CJHY+ihJO4lgoMjbQ2wpDMDcHYPT32VUKPCQHZmCmiJwoULC1lvv+gaqjbYNYrZBnGhMyavw7LnTr43jsUlxXoWoTEc7TLx6obf/riXtD3SfvQxlypPviidY5WqR0zxYjqQVPx7WlID4YMoxzgBbYPIDNxnCRbw9gLC7KhmPy6hVDQ7q33crmJ168gkAThvCJt+Z9dUOwY1i7rBgiqJlO5e8k9VhTwv1mFP6ASvuetjapcOUGVqQKjag4ToxpdDor+ahwAA9M8VZIdbPTU+VUyQdkb8bST16+wNz2p1qoqMI1uPdeGWMXamADcZT42Kzy3Tcs8BUD65J6wDoLyKlmSU2dwy9ASBOwMjbGcjiIG18f/DXZKHRX74bYwO562Ec+uB/bEj9Oj+6QbKHyevgbY/T6zuWRYZJO8ByZdOGNQukIrQ9t18L0kEN2l62yIynEZw8WRGeAk+4AMtHDTfquOUe48exqIjG2HTNrucjQ5y8poLX+YsaZHaYXd+2M/epRfhdCozPswoNoG5spt9Qs0W0hjGpSH1se+5CwRHX07D2Hq5/d6eguZ8sOMHgfx5ij9Je5dUBsZMnkD3gYikGWTll3P5sCDwsDVBoZH+Nn6T8fdh/sAfxNh58470SUdTKkeOJNVYfn1MXpiutEKg56y+D9fJlaceTmmutIRrHI0NHN1TCFmWbcQRcxFJ0Ea7c7u60iSs=
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799009|41001999006|19110799006|15080799009|8062599006|461199028|440099028|4302099013|3412199025|12091999003|102099032|10035399007|1602099012;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ws0Ccec7HKiRmELKDKmiWi2QYzTIkuIvQoqqoiASKVH3cl8gKf9PMHyHh53l?=
 =?us-ascii?Q?JVEvnJQ7K4MbAsS2DLAWar9ZC62pPs/u+yu9BxW5TMORVshfpj7pkywn/YSa?=
 =?us-ascii?Q?2JSrwpf1dcn7uwhf6gC4dpxkhuWg2+pL7tGExRGEQOn5jFWl1j5MbyP/afr/?=
 =?us-ascii?Q?3KNXMtj9OcFcI8D8QIlRaGpumH3zCLh74UEhxdEHssZDHCEqulprRCEFi0df?=
 =?us-ascii?Q?Dkkl5jcm1dfZZkAYiLffy4RJdWWYcHR/zVete422unVAGWyP6iv2RA6FypnS?=
 =?us-ascii?Q?mWQdxRgbA4SNps0t23T5LyDoaWu9VikZ2gyKIC3x4BeMIZBq/k98OSRgeSNy?=
 =?us-ascii?Q?cSDHVs54arAscN07iz8HqxUugTc48jUcVJXBByVqCS2Cx5DnMo6V9nzSV7Qt?=
 =?us-ascii?Q?FDXQD+qLoW76UZj/okm1jVV6XEVlC2jMysdJ/f1qeZPxhtxq5g6ek5ZWGMGf?=
 =?us-ascii?Q?kGc7XApK+OarYRoi50kclIC1KktRkTm8f1z2Wj0x/4r1AqX1jXf3wvq0p5wr?=
 =?us-ascii?Q?q/jtyoGeeCN0VgBRmQmAmxOLZwsXQcrLwFzfwequWVi3TZU76DwLgqhZM20Y?=
 =?us-ascii?Q?RKBjXEwZn1CJewcCGUaUGJkCQHjV1JzCw/eNZYqW2O7Yj7vq0jKtYrh6IKeH?=
 =?us-ascii?Q?XUBljJ1OavbZh/w2QnmsQK/RuXcAZKye5ABQ39PK23W+j9jA76Fw/GA1E6vp?=
 =?us-ascii?Q?bqhrEyS8C/QMRFNnvREYbubTEG2/4QIjXBp1R7s/U3qxKFw1GcgukU+nO5lJ?=
 =?us-ascii?Q?uuwoWABx9xxiBKlx5UwK0JRnH3IqRkWXaiKZzA1+MRUjGGvd5EpTLCr8k8C9?=
 =?us-ascii?Q?DpqD42M3HgffmSl4lLrkYlPiFHEQ/ZtPKcrePvsBZxgK2VGlhWqgBwllP+bI?=
 =?us-ascii?Q?G7z3wJOVpkGA1zY302CUp2qbFaZBknqzSuG8VYJwo/UtgGw/NOBnDjCRdiOM?=
 =?us-ascii?Q?wjS1I9sTTIhZR8pPMEUBUn+8jDzjMHG/lpfnAobVBo4qWsqF0CpvgsuV9JwT?=
 =?us-ascii?Q?vkjFGu3g2mmaMf+TZFuI1yZ3+lW66YKwUN6pHNV8gpZ8H2oFt4x/5QLPzQRE?=
 =?us-ascii?Q?Er9J+QjD5SgZO1f8Sry2ibyQhjWPEKZDAjoY4czTKo52YHANgO9SipsEgmOJ?=
 =?us-ascii?Q?deH7hJAPfg0PXfaPZbiF2QKDYrXHrBMCqoxBmVE5rRltSLq1LFmIeEmLQVN7?=
 =?us-ascii?Q?9/U9Fg8dVo7rowoyip5UNwa2RiJQnkxMsL9IpGTvuTB7eLNQQCq/NxRNlnzK?=
 =?us-ascii?Q?w3WW9HXztyBT2EyM4tAtc2oFugEFV0X/QTZRfdIr9Pj1eLjUFVtm50toWBcr?=
 =?us-ascii?Q?4QxLllyYazGTxKoR68AO1fgC?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?L7QCWQ53N+c5xNQoU+ViW/PzBQnBE3VSYmSDN9r03FLgSl1VDMSom85mnv/j?=
 =?us-ascii?Q?uMmZUmcI7+K9rSsOBbfd+NWkz8XXBcKnsbOJ4bR7tbJvIRvHy9JznVlbUky8?=
 =?us-ascii?Q?fT2N95z8P3BJLmKQDAJSmYNkWJPpqcDq3Ul7bw3SEZxHR61hIWtwJD9XRJUT?=
 =?us-ascii?Q?q+we4cuySxukE64mKHc0jo8rodnGe9lA5l21+Ot1vjo1IJITn/C4R6z+cjFK?=
 =?us-ascii?Q?R5gV/vCSAFFHMhet5aojqU9yOaWG8Qk4dSM9ePJQZVhbtilOmCjXUA+IoPDl?=
 =?us-ascii?Q?hcg2C/D2ERP810R179kt7e9SZLD/yCk7NI6DI6sO7+Fte864M9GzN2WutH3I?=
 =?us-ascii?Q?i2gitEaJBfB6MDkrdXBwKqCE0OYvyoyA0d9h3vPS+YYE5lwFFvXmdCYyvizA?=
 =?us-ascii?Q?AXV7LZ3ynHke7GMGmdbU7HJAK0nNgvwX2I5dHU0OISi/Fz6b+JRJaWH+yqh1?=
 =?us-ascii?Q?3Og2QTFxaCMp4HkHF45BUkQFYB88eIt50PeCLmx/8Pfx5WyAVhpPxvqc/Mr9?=
 =?us-ascii?Q?coQcrLa16BOu9gQGjaj08jDjVBpyb0OgQX3T33ydVzDIc6BIIlAwsHNsy4CL?=
 =?us-ascii?Q?IXzA4dds0TQM852uerW8LSsQHIPyyZFPa2xTXZiuvRTYT7MMM0HQqUcNbWLT?=
 =?us-ascii?Q?Pbqbj8plRkakfPsC7sTMdcIY0F7qmbIXmZgcW22DP/WiJBx5O07MJUlAmida?=
 =?us-ascii?Q?M5XoRavPcfJbpVS/vcNTAhjrKkBGkpNBGdsXisHodQyhPlG4IAXG0MtFhf7l?=
 =?us-ascii?Q?YMePy4zCvSEpZs8ozUx95+Y4JlSuk/YvC1HI8pCOROJrRW1P791OFJPRsgAK?=
 =?us-ascii?Q?Azv9UOS7ajD24Gvt7KihWrMJRplBcBKbgcHc4Xg2LNNp2xW9Zmx4tJt9wdCo?=
 =?us-ascii?Q?g6t/7dqA4aecIp9pVNjDwjYJlCYybdEAlaHdUaNc5Us44DwdeJVUUgMorUe4?=
 =?us-ascii?Q?i7zeGolrn8qpTV3ImWPgCPr8jIBDMf12DxJNrzRimXKrin2CRu6YyF6zBKp5?=
 =?us-ascii?Q?QokQNjJbzc/bCivwcFWIXH9vtrWbyoUVnIYeFLt96SF732pRoSfpIycYVjKA?=
 =?us-ascii?Q?gKZiQu8dul1zeHngFNjrQ6cjQNuLvzTeWO5gBicpNxPU7elUHneaznotOFiX?=
 =?us-ascii?Q?4YRNohw1OUp8ju+SK7I7V3YEtn4d2bBAomMEqDPrYEkcD0WgTDDnavgSYAIV?=
 =?us-ascii?Q?GwyoyLrDjmlUs5iBmO8CS5pbFAYNdpQC5esE5IUTDyYo9UfbQq+JopE7LQ8?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b30ec281-30cc-4799-b5d7-08dda7b337b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2025 00:10:33.1825
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB9362

From: John Ogness <john.ogness@linutronix.de> Sent: Friday, June 6, 2025 11=
:56 AM
>=20
> If a console printer is interrupted during panic, it will never
> be able to reacquire ownership in order to perform and cleanup.
> That in itself is not a problem, since the non-panic CPU will
> simply quiesce in an endless loop within nbcon_reacquire_nobuf().
>=20
> However, in this state, platforms that do not support a true NMI
> to interrupt the quiesced CPU will not be able to shutdown that
> CPU from within panic(). This then causes problems for such as
> being unable to load and run a kdump kernel.
>=20
> Fix this by allowing non-panic CPUs to reacquire ownership using
> a direct acquire. Then the non-panic CPUs can successfullyl exit

s/successfullyl/successfully/

> the nbcon_reacquire_nobuf() loop and the console driver can
> perform any necessary cleanup. But more importantly, the CPU is
> no longer quiesced and is free to process any interrupts
> necessary for panic() to shutdown the CPU.
>=20
> All other forms of acquire are still not allowed for non-panic
> CPUs since it is safer to have them avoid gaining console
> ownership that is not strictly necessary.
>=20
> Reported-by: Michael Kelley <mhklinux@outlook.com>
> Closes: https://lore.kernel.org/all/SN6PR02MB4157A4C5E8CB219A75263A17D46D=
A@SN6PR02MB4157.namprd02.prod.outlook.com/
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> ---
>  kernel/printk/nbcon.c | 63 ++++++++++++++++++++++++++++---------------
>  1 file changed, 41 insertions(+), 22 deletions(-)
>=20
> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> index fd12efcc4aed..e7a3af81b173 100644
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -214,8 +214,9 @@ static void nbcon_seq_try_update(struct nbcon_context=
 *ctxt, u64 new_seq)
>=20
>  /**
>   * nbcon_context_try_acquire_direct - Try to acquire directly
> - * @ctxt:	The context of the caller
> - * @cur:	The current console state
> + * @ctxt:		The context of the caller
> + * @cur:		The current console state
> + * @is_reacquire:	This acquire is a reacquire
>   *
>   * Acquire the console when it is released. Also acquire the console whe=
n
>   * the current owner has a lower priority and the console is in a safe s=
tate.
> @@ -225,17 +226,17 @@ static void nbcon_seq_try_update(struct nbcon_conte=
xt *ctxt, u64 new_seq)
>   *
>   * Errors:
>   *
> - *	-EPERM:		A panic is in progress and this is not the panic CPU.
> - *			Or the current owner or waiter has the same or higher
> - *			priority. No acquire method can be successful in
> - *			this case.
> + *	-EPERM:		A panic is in progress and this is neither the panic
> + *			CPU nor is this a reacquire. Or the current owner or
> + *			waiter has the same or higher priority. No acquire
> + *			method can be successful in these cases.
>   *
>   *	-EBUSY:		The current owner has a lower priority but the console
>   *			in an unsafe state. The caller should try using
>   *			the handover acquire method.
>   */
>  static int nbcon_context_try_acquire_direct(struct nbcon_context *ctxt,
> -					    struct nbcon_state *cur)
> +					    struct nbcon_state *cur, bool is_reacquire)
>  {
>  	unsigned int cpu =3D smp_processor_id();
>  	struct console *con =3D ctxt->console;
> @@ -243,14 +244,20 @@ static int nbcon_context_try_acquire_direct(struct =
nbcon_context *ctxt,
>=20
>  	do {
>  		/*
> -		 * Panic does not imply that the console is owned. However, it
> -		 * is critical that non-panic CPUs during panic are unable to
> -		 * acquire ownership in order to satisfy the assumptions of
> -		 * nbcon_waiter_matches(). In particular, the assumption that
> -		 * lower priorities are ignored during panic.
> +		 * Panic does not imply that the console is owned. However,
> +		 * since all non-panic CPUs are stopped during panic(), it
> +		 * is safer to have them avoid gaining console ownership.
> +		 *
> +		 * If this acquire is a reacquire (and an unsafe takeover
> +		 * has not previously occurred) then it is allowed to attempt
> +		 * a direct acquire in panic. This gives console drivers an
> +		 * opportunity to perform any necessary cleanup if they were
> +		 * interrupted by the panic CPU while printing.
>  		 */
> -		if (other_cpu_in_panic())
> +		if (other_cpu_in_panic() &&
> +		    (!is_reacquire || cur->unsafe_takeover)) {
>  			return -EPERM;
> +		}
>=20
>  		if (ctxt->prio <=3D cur->prio || ctxt->prio <=3D cur->req_prio)
>  			return -EPERM;
> @@ -301,8 +308,9 @@ static bool nbcon_waiter_matches(struct nbcon_state *=
cur, int expected_prio)
>  	 * Event #1 implies this context is EMERGENCY.
>  	 * Event #2 implies the new context is PANIC.
>  	 * Event #3 occurs when panic() has flushed the console.
> -	 * Events #4 and #5 are not possible due to the other_cpu_in_panic()
> -	 * check in nbcon_context_try_acquire_direct().
> +	 * Event #4 occurs when a non-panic CPU reacquires.
> +	 * Event #5 is not possible due to the other_cpu_in_panic() check
> +	 *          in nbcon_context_try_acquire_handover().
>  	 */
>=20
>  	return (cur->req_prio =3D=3D expected_prio);
> @@ -431,6 +439,16 @@ static int nbcon_context_try_acquire_handover(struct=
 nbcon_context *ctxt,
>  	WARN_ON_ONCE(ctxt->prio <=3D cur->prio || ctxt->prio <=3D cur->req_prio=
);
>  	WARN_ON_ONCE(!cur->unsafe);
>=20
> +	/*
> +	 * Panic does not imply that the console is owned. However, it
> +	 * is critical that non-panic CPUs during panic are unable to
> +	 * wait for a handover in order to satisfy the assumptions of
> +	 * nbcon_waiter_matches(). In particular, the assumption that
> +	 * lower priorities are ignored during panic.
> +	 */
> +	if (other_cpu_in_panic())
> +		return -EPERM;
> +
>  	/* Handover is not possible on the same CPU. */
>  	if (cur->cpu =3D=3D cpu)
>  		return -EBUSY;
> @@ -558,7 +576,8 @@ static struct printk_buffers panic_nbcon_pbufs;
>=20
>  /**
>   * nbcon_context_try_acquire - Try to acquire nbcon console
> - * @ctxt:	The context of the caller
> + * @ctxt:		The context of the caller
> + * @is_reacquire:	This acquire is a reacquire
>   *
>   * Context:	Under @ctxt->con->device_lock() or local_irq_save().
>   * Return:	True if the console was acquired. False otherwise.
> @@ -568,7 +587,7 @@ static struct printk_buffers panic_nbcon_pbufs;
>   * in an unsafe state. Otherwise, on success the caller may assume
>   * the console is not in an unsafe state.
>   */
> -static bool nbcon_context_try_acquire(struct nbcon_context *ctxt)
> +static bool nbcon_context_try_acquire(struct nbcon_context *ctxt, bool i=
s_reacquire)
>  {
>  	unsigned int cpu =3D smp_processor_id();
>  	struct console *con =3D ctxt->console;
> @@ -577,7 +596,7 @@ static bool nbcon_context_try_acquire(struct nbcon_co=
ntext *ctxt)
>=20
>  	nbcon_state_read(con, &cur);
>  try_again:
> -	err =3D nbcon_context_try_acquire_direct(ctxt, &cur);
> +	err =3D nbcon_context_try_acquire_direct(ctxt, &cur, is_reacquire);
>  	if (err !=3D -EBUSY)
>  		goto out;
>=20
> @@ -913,7 +932,7 @@ void nbcon_reacquire_nobuf(struct nbcon_write_context=
 *wctxt)
>  {
>  	struct nbcon_context *ctxt =3D &ACCESS_PRIVATE(wctxt, ctxt);
>=20
> -	while (!nbcon_context_try_acquire(ctxt))
> +	while (!nbcon_context_try_acquire(ctxt, true))
>  		cpu_relax();
>=20
>  	nbcon_write_context_set_buf(wctxt, NULL, 0);
> @@ -1101,7 +1120,7 @@ static bool nbcon_emit_one(struct nbcon_write_conte=
xt *wctxt, bool use_atomic)
>  		cant_migrate();
>  	}
>=20
> -	if (!nbcon_context_try_acquire(ctxt))
> +	if (!nbcon_context_try_acquire(ctxt, false))
>  		goto out;
>=20
>  	/*
> @@ -1486,7 +1505,7 @@ static int __nbcon_atomic_flush_pending_con(struct =
console *con, u64 stop_seq,
>  	ctxt->prio			=3D nbcon_get_default_prio();
>  	ctxt->allow_unsafe_takeover	=3D allow_unsafe_takeover;
>=20
> -	if (!nbcon_context_try_acquire(ctxt))
> +	if (!nbcon_context_try_acquire(ctxt, false))
>  		return -EPERM;
>=20
>  	while (nbcon_seq_read(con) < stop_seq) {
> @@ -1762,7 +1781,7 @@ bool nbcon_device_try_acquire(struct console *con)
>  	ctxt->console	=3D con;
>  	ctxt->prio	=3D NBCON_PRIO_NORMAL;
>=20
> -	if (!nbcon_context_try_acquire(ctxt))
> +	if (!nbcon_context_try_acquire(ctxt, false))
>  		return false;
>=20
>  	if (!nbcon_context_enter_unsafe(ctxt))
>=20

Tested this patch in a Dpv6-series ARM64 VM in the Azure cloud, and did not
see any occurrences of failing to stop a CPU like I originally reported. Cu=
stom
logging shows that the original problem scenario is still happening, and th=
e
patch allows recovery. So the good result is not just due to a timing chang=
e
that avoids the original problem.

The looping behavior of the "pr/ttyAMA0" task in nbcon_kthread_func() is
the same as it was with Toshiyuki's original test patch.

Tested-by: Michael Kelley <mhklinux@outlook.com>
