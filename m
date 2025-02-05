Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777C91DDC0D;
	Wed,  5 Feb 2025 16:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738772982; cv=none; b=Wh3Ths9VL5ZkwQS3dW6G//XtdmUP95odrxRDtBHCmYclVr3mELuDTiutMSKch/5iRceCo527YHTQ5Rb+QWTEKQwY4NFu2nqTLHvY1CTRUCcE71l3ktgpPuiipjOs5w+oXvsC95U1wIvF/vf8VFN3l5/JscIvdp4PXlwhOgAAUyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738772982; c=relaxed/simple;
	bh=C/96F3WyXfQnox7QEbJU3yT+cqpavW5YFVk9YhIl/Qo=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=iBYKLkQED/fX2Bz7btfSBhZDx5wXsanpP/TICv1ri+jBWfKp4vGQ2nnWwtjXoUNb46Yx43XfR0kvm1cPWogvIeVD3Ptf/SxIKMruBy2XGZ/1SFpgj5i5FHRVM+OQp7J8gGELt7r7AWpLGwy9rd4tldxBC/d+6mhOLQ/KElsPjxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=lVi3iUJi; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="lVi3iUJi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1738772977; x=1739377777; i=markus.elfring@web.de;
	bh=77uy2s9GS4L1rOWI0ZFpp+8lDhVNd43z9Dx6rLxFDGw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lVi3iUJijh1czxl20ZC6cZyWsfvTQoCJUFR26QPMN3TOQbWuOPFHScdigxCeNtQ1
	 FrPldXyZVE/TylQrVeVMDhQlk6oDwqBcK+DSLzL/zbfamBK55zTqJAUhHg7AgIKXl
	 iilcIVlzv/NluRbb1F6rccUQ09nWIakTxLx3K9XZ5+Iax5u0z689oMR1QBdybJwaA
	 yrk5M9Q8vpC2Z1K7YXL6HJi4/05ZtG7Vz+2AxTbjI4/rCtSPiuusx4JBQfn9qsGx/
	 sLtTZwklZjjIcK+MvEr+ejdL5PljKhaxPuMF4qGDnCHuF8K2ndfMmILYXKUhJIL2Q
	 SPj1Kh5I2jxKNYoa6A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.30]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MWQud-1tuNrl0B9X-00NGSj; Wed, 05
 Feb 2025 17:23:38 +0100
Message-ID: <ffd401b5-9b0d-4339-befd-19b704479ade@web.de>
Date: Wed, 5 Feb 2025 17:23:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: LKML <linux-kernel@vger.kernel.org>, amitrkcian2002@gmail.com,
 Bernhard Frauendienst <kernel@nospam.obeliks.de>, git@amd.com
References: <20250205133730.273985-4-amit.kumar-mahapatra@amd.com>
Subject: Re: [PATCH v12 3/3] mtd: Add driver for concatenating devices
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250205133730.273985-4-amit.kumar-mahapatra@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nb45Msh4es1jIjg2htR0yzCwxwqa+PQfNxb8WzJvDhi+A4tDdKk
 JlAjSuKVKmnScTYqJvlRsNtUb8O53nzSCSHI2Im7+tYYwcgd56SjcZyofaU59CjHZhlicUw
 4+t55KXYiLnbXMaKB/vD2+gli4iN6xrRt2zVb0tQaay2uAAmZR6rXsTPHAzVy0CKTx8EcDS
 yFAltVy4+8eratwOOqvwg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AKRkEUo5Jak=;YyzRWkmCftZrp2fyKdV9SbCUOmK
 Ey/snODZY101FlpoqNp+Ts7XgYdgUUeU3DmpFfThO0yQL9S1PTZ5ZMZuxqs24Xmma1DXSlQZG
 wgf5+I0vTZZ69fvKRVt5k7R9fA3GpilEWsCl0zmt+GX+2lzAQZ1wbVshZ3PdEfUA9PnTXsIqg
 w/2Xq8QKH181jSkR0kJE3mx88GE9VUUjyfJUDXeJXBmSrriccI7CUBt141mEBlO01hvewUTBi
 YL4dVdVBuPH+y+jcXSlN6o4Q9ZhDCH/KwUoVv3omMtQmlpR54yenRMRaVELSRfKThSQBTh7KU
 TD9ge/iaYp9kU+lgHE45942PeP5Bnj4iicATDU44dC0AdY4u70Pu/7ZA/sh9uOuesecdNZ43U
 N7z8eznha+FhiWQrw7hZEvcp8uJTJuwDXLNPx4/r6+40Ng8v8uiorcwRIALt2Hg5nkqXPd7ty
 RKBmaLOTW1qyv4Ijb4ewaA0+1jTOA0JPKW5OlV9JU8T6eVFWhiPsfTBpK2JvW/iJCgLrnJqRm
 dvx3TMrpB9BkPckh799/EN+7phLdtVyVehIDU50GlcJ8GitRsc/0RC+BIuODzs80iyZVf0WT8
 QVgtKI9qRhKiFzwWxXGY636IIHD3fN+fg0R/llGVLH+BMqLjKYa5XpM91K0zSm2KrKWxmMuUw
 NG7Zd6F1FIvC/KSTbAps2BAzQe0N2fe1jkhpdgjgpZDuNqrCuRNeQFZutpwgOi3iPgiWW/BrP
 8H97WqMJshtO4sKYKlfn6OjnGlVQCh/9Cl3OJvqb0BYFDpi01+sdJ/hpou7mOj088QJ1EouGT
 IQA+II8WuQeYzlzgfZXIouSqlkpVOivcPfg56KJmv19juyzA70SqfFAqItokzsxNnBK56rPUy
 cDabIk//0BUXgpS49zZCWVNSIbIs6fzoyGKS5lhLjSk9PHS51UYoEyBuQGdYwiOa6H4hz5+Ud
 9+TFmEoJZJT3zk8xG6rVvmNzWwgrEfDxTE9AB67IHP/7VI1syqx+HBWgSyQYti1jAOWhh2Qe6
 ktUpugCDCgkWP4B4TkUIG2ZDSonXo8An7U8nwYdCUn0tlGDch26XTz9xcNixkZZeTnCgzC6MN
 4ZMD9kZ9FUdA4IBNGbwGn54Oodnt4TnZcq4V18LceQSh5l25eTd2RkcN1/xqVteQ8t9xUe+mx
 C54pyCJSJ77ZulqAsVx8xojPVVVsLgTwGsJhYhfTa9XJjpQQnsbdOOkqd56R/TQ/neNd8GmpP
 gjNVoWKL7Mzx1LR0sJaray2kNqSV2/3DNxmB/4XHJIodGiMEPaQ6AFpXZpShruFE9ZZ79S+sy
 FBTG0G/ST3tTRBKIcRzFs5UDsYl8IHCAGuRumt+LPzDR+NQhvFrRDsOEG2G8CcH2jR1

I suggest to improve implementation details another bit at a few source co=
de places.

Examples:
=E2=80=A6
> +++ b/drivers/mtd/mtd_virt_concat.c
> @@ -0,0 +1,254 @@
=E2=80=A6
> +static int mtd_virt_concat_create_item(struct device_node *parts,
> +				       unsigned int count)
> +{

+	struct mtd_virt_concat_node *item __free(kfree) =3D kzalloc(sizeof(*item=
), GFP_KERNEL);


=E2=80=A6
> +int mtd_virt_concat_node_create(void)
> +{
=E2=80=A6

+e_nomem:
+	ret =3D -ENOMEM;
+put_parts:
+	of_node_put(parts);

> +destroy_items:
> +	mtd_virt_concat_destroy_items();
> +
> +	return ret;
> +}
=E2=80=A6


Regards,
Markus
