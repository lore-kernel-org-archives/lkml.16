Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC45AD2C;
	Thu,  8 May 2025 14:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714530; cv=none; b=abgtSQJFa1z+jWLfO0KvrTLOdDtt6tfFEMp8Kvr0uqVqwLskuJmDDPj5d3xsE6pO9AbRHMVOcyKJ+S8TjOD5yAOg2ZruJ4ovFRUTLUAbGaKS1VImn5DlwPgJpUBx9BUUSHqfuSNOi8nrFAWeXUtTt18qAKzWpL0gWJt7CCnsdGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714530; c=relaxed/simple;
	bh=oUevKpGyl/bu1Ez3AKPuoXhFJO0Wa5cjchcuUOe0Tnw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=E/Twfl7JbeWMOoPYFyzdIaMcfoW+5r9q1/ZkZeXRDt92m8u+E3u9L4ToL5j6CcN0YAUxUiqUsQACToJt5gUmBLqT6DsaGQtIi6dO5IWg4FqpulHvZUW6X7oT92qiRVptMG8DwJPzPt4RjGDlDj+QuK92eOZfF4qT3iAeUrZPCic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=i4rSzw0Y; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=STPkeAE+; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="i4rSzw0Y";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="STPkeAE+"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5382A11400C4;
	Thu,  8 May 2025 10:28:47 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-12.internal (MEProxy); Thu, 08 May 2025 10:28:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1746714527;
	 x=1746800927; bh=xOaFwawQMziTPg9wQ4vcKv9MzhcDJIeOZNOeITnoaf0=; b=
	i4rSzw0YvHWJiU6f0AFwSVryA3sXnyFbpUkUWykF1efGVUxwFpM506fJd3PMrq2c
	yAiz2XHNSKJ1g/OseHrjVfcGKf+Q7bvKEkEE/uBffNZj/55KHblCEbroohLwOT4d
	URpTsqwr68+Sh/eBa4qbEEGTxowquFXcK/SBFgaPBF9mZW+oc8ddr66XX3Ro241u
	VeaAFeaAgOONZj16xFChi2Y91OJGOSTSoBHSMtaAM3aygDSk2dDBEBXJrT3q+tyc
	X8zXk0deJ3XvjfflB1xca6MHawUZAZu/N75Ki2DDxarwtvG/+A5E9R0y+o4LREB4
	gP95cqTOvIc/BNo6qi1jgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746714527; x=
	1746800927; bh=xOaFwawQMziTPg9wQ4vcKv9MzhcDJIeOZNOeITnoaf0=; b=S
	TPkeAE+ZrLX6imXSrksuuLDxU1ReczKmZdVtEhe51EWoeIec7OSBtgEXqYZOOPRu
	na/a2p9q2OQN/hKYOZFNlOU8MCvjf312R7u8bzyq44uhrdTOnB33I5Itwdi2tKT8
	t5eLpZ2dQd371TBtk8TqdtHXTqaSlz33sJhJWUvZOWx5k2NyxsuQhgHACDqXSW6p
	2mCMQa9bVR0nB4uvZxUH82AT/9mxqcQTDZZaVi6Y1Eg73EanOckqSt01nOueralW
	BehU0M3oPTZQ6wmsY7ndbZe12R8fqyRCFQfIRM7AjyMdjMJ/af6KsyYUJo5xSRDn
	rPX/t5whl4cFakCr7VGUw==
X-ME-Sender: <xms:nr8caDlNVBMmHrunLCVm-zQApT2geFm4Y7kxHgNcw4DtFPTPyKp29A>
    <xme:nr8caG0zyN5dMXrz6-rKxJ2zetBHiUpQDj_iA5PlMOi6HJWTSzdUqhvQV5n9smUtl
    ZWvmrRlsDxwAvbcvwI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeelleekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedfofgrrhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlh
    gvnhhovhhosehsqhhuvggssgdrtggrqeenucggtffrrghtthgvrhhnpefhveekjeeuueek
    fefhleeljeehuedugfetffdvteekffejudelffdvjeekfeehvdenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhho
    vhhosehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehikhgvphgrnhhhtgesghhmrghilhdrtghomhdprhgtphhtthho
    peifpggrrhhmihhnsehgmhigrdguvgdprhgtphhtthhopegrnhgurhhihidrshhhvghvtg
    hhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepihhlphhordhj
    rghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehisghmqd
    grtghpihdquggvvhgvlheslhhishhtshdrshhouhhrtggvfhhorhhgvgdrnhgvthdprhgt
    phhtthhopehhuggvghhovgguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinh
    hugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphhl
    rghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:nr8caJorTp9M0OBHlfIrDxX89JFOzNWqUa2WZfgRV4yxfsDuzivsUA>
    <xmx:nr8caLlYUBLSYXDVNtp1UgRRWxIHylkU2MkUH4NoV6IepX4Gg9DnCw>
    <xmx:nr8caB3Bu3CDUB_lkgehWHuG1j_aZ9UpOPUU76K_lGWrWYtvSq_ZTw>
    <xmx:nr8caKvjE11Qm4k2nSCZQJO_2g0ERCC0GF-eXmoLzKFfZUzRbt2fQQ>
    <xmx:n78caKov3FfwzfHdQSl7Vu6dnD3UzRpZTdYW3hpWx-gQYL-sKzqLK9_s>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CEB2E3C0068; Thu,  8 May 2025 10:28:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T747cf12b99a35bad
Date: Thu, 08 May 2025 10:28:26 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Hans de Goede" <hdegoede@redhat.com>, ikepanhc@gmail.com,
 "Armin Wolf" <W_Armin@gmx.de>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net
Message-Id: <c8ad9e6d-772d-4954-a3b9-ecafe7e3bdc7@app.fastmail.com>
In-Reply-To: <6feeae5a-3928-8198-7ed6-2080c929d7c5@linux.intel.com>
References: <mpearson-lenovo@squebb.ca>
 <20250507190456.3004367-1-mpearson-lenovo@squebb.ca>
 <20250507190456.3004367-2-mpearson-lenovo@squebb.ca>
 <6feeae5a-3928-8198-7ed6-2080c929d7c5@linux.intel.com>
Subject: Re: [PATCH 2/2] platform/x86: export thinkpad_acpi handles
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

On Thu, May 8, 2025, at 10:03 AM, Ilpo J=C3=A4rvinen wrote:
> On Wed, 7 May 2025, Mark Pearson wrote:
>
>> Add API to be able to get the thinkpad_acpi various handles.
>>=20
>> Will use this to start pulling some of the thinkpad_acpi functionality
>> into separate modules in the future.
>>=20
>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> ---
>>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 18 ++++++++++++++++++
>>  include/linux/thinkpad_acpi.h               | 17 +++++++++++++++++
>>  2 files changed, 35 insertions(+)
>>  create mode 100644 include/linux/thinkpad_acpi.h
>>=20
>> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/pl=
atform/x86/lenovo/thinkpad_acpi.c
>> index 7dd4abf47f61..0eb33b4c99cf 100644
>> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> @@ -67,6 +67,7 @@
>>  #include <linux/string.h>
>>  #include <linux/string_helpers.h>
>>  #include <linux/sysfs.h>
>> +#include <linux/thinkpad_acpi.h>
>>  #include <linux/types.h>
>>  #include <linux/uaccess.h>
>>  #include <linux/units.h>
>> @@ -606,6 +607,23 @@ TPACPI_HANDLE(hkey, ec, "\\_SB.HKEY",	/* 600e/x,=
 770e, 770x */
>>   * ACPI helpers
>>   */
>> =20
>> +int tp_acpi_get_handle(enum tp_acpi_handle_id handle_id, acpi_handle=
 *handle)
>> +{
>> +	switch (handle_id) {
>> +	case TP_ROOT_HANDLE:
>> +		*handle =3D root_handle;
>> +		return 0;
>> +	case TP_EC_HANDLE:
>> +		*handle =3D ec_handle;
>> +		return 0;
>> +	case TP_HKEY_HANDLE:
>> +		*handle =3D hkey_handle;
>> +		return 0;
>> +	}
>> +	return -ENODEV;
>> +}
>> +EXPORT_SYMBOL_GPL(tp_acpi_get_handle);
>
> Please put these symbols into a namespace.

Sorry, not quite sure what you mean here. Could you point me at an examp=
le?

>
>> +
>>  static int acpi_evalf(acpi_handle handle,
>>  		      int *res, char *method, char *fmt, ...)
>>  {
>> diff --git a/include/linux/thinkpad_acpi.h b/include/linux/thinkpad_a=
cpi.h
>> new file mode 100644
>> index 000000000000..eb5273464658
>> --- /dev/null
>> +++ b/include/linux/thinkpad_acpi.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Thinkpad ACPI driver API
>> + */
>> +
>> +#ifndef _TP_ACPI_H_
>> +#define _TP_ACPI_H_
>> +
>> +enum tp_acpi_handle_id {
>> +	TP_ROOT_HANDLE,
>> +	TP_EC_HANDLE,
>> +	TP_HKEY_HANDLE,
>> +};
>> +
>> +int tp_acpi_get_handle(enum tp_acpi_handle_id handle_id, acpi_handle=
 *handle);
>> +
>> +#endif /* _TP_ACPI_H */
>>=20
>
> I suggest you send this in the series that introduces an user for this=20
> interface.

OK - will do.=20
Side note - I do have one planned (new battery ACPI interface that gives=
 some extra battery related information).

Thanks for the review
Mark
