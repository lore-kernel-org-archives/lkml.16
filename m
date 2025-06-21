Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BBF194A44;
	Sat, 21 Jun 2025 10:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750501342; cv=none; b=qVQ7/CokznUpslgNz8O9DNZQX4DWtk1ssMaz0KNdN7xymW1jys4D12RvScutzZOEBMxe6fxKzJ60BcPW8StEhsfOxJwRW8TxEZuWUVcRILGRJHdULbYHs8cK/GY5mukigpRD1hp8l+UQ2BGrLPblf3ssnOGQcbH8hTIADYl7/g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750501342; c=relaxed/simple;
	bh=kQz4MAWfzVaYntU+/Kn4fIB2bFphxZ1MOOgkoMRY4UE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K4QgPBq3U/poBVIlu3LvcANoUEUqAJdiekt6RXO3+aNlYVNg+j1Fut59ptMggxjc+sTQoiKdRprSO019mINckrerdJJi4vIqIxje5NB8WlWmE3SP8IWWNZO1npDsZtqRsFAmlf/4wou0JXlVXl8ptaMrBvCLjuHzIeiGypQa4V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zs0jI8zZ; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zs0jI8zZ"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-32addf54a01so20692161fa.3;
        Sat, 21 Jun 2025 03:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750501337; x=1751106137; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRqpmjuh5ll6Lblh/823YdVSUx1tpYNI9JJMSW/iSMQ=;
        b=Zs0jI8zZoGRgCZ9LaroaFxoP5bIzV4tlRs/ECqpToDQW6ji4mNY6vsVfnF+U3uboaK
         tOGEREOtzihm2UDZWkye2HzpRxO7MZGcfmMFeQfRizPAcLsAYbqStxX1GuSbcSm7WGno
         Up59jK/a/0nNxuUZiiJt9uqzG8OvfX5+lMpXEScqpgzfxdDzf9yx14GLTifdc4xoH5Yf
         BcrdjMpoAELy4hL49dl3rlfNYfni82OROvWmSMnEEJdhwBrK05qEG9P249EMntwmLho/
         AP0tj2v0JWzaIMGja8dwQGoKTSEgzlFAmQIrL92fKpWz+6hUXc2pkPkwgHegR3NVGpXn
         5+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750501337; x=1751106137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rRqpmjuh5ll6Lblh/823YdVSUx1tpYNI9JJMSW/iSMQ=;
        b=tl3XHc9tEDaWw+4sXLj8GWxzjdbqoeMH4wi1JpJ1iZdCIrIkYS1DWTtE9JD1rm7lFv
         qq4aD6WSoLFekzodjqUNgXM2bIPFfWLXE3mqjwx4+fzhrSv53bvIAi7rApzUfgZ2v7/U
         mF6NpvETALQuTflPEycTlD5aqOWhVb5hsffcCMjy1pekkxUKpdutfIXzWD+ALltEePJQ
         bHxfZPr3sFq6/HPP5z5Wn04wl7lr1DkqWDqX39efmLN737ehFZDEdRAHCA4Euvsoc7BM
         +6lfbr/JycroxnUJUfxmopzspC/phQ5e4v8Q5tSYmAOna+vAnIBbXYQ8OtoiPiqSjTer
         FkIg==
X-Forwarded-Encrypted: i=1; AJvYcCU+rYeIVN0GQazc09AxHRM+jLTy1NerVqIszpNnM+67t0sYZoyz0NoNO+oNA9XlbWa353IcKmj6p6jwJDw=@vger.kernel.org, AJvYcCUIgcjqRM36XvFEPeoqy+TVAcCoSBjpQ9/J6LR6Y9s+Nx3dBkioiIEXHzyCtp+HTc0MR0ZwrxDu26AK@vger.kernel.org
X-Gm-Message-State: AOJu0YxbweSO4hf1SzyhJxKJk3JKQK79B8GbZ8tjPpCrJ3GxmvFmyY/S
	VYVBx6HCe76VIqcAC5cooyLrDoFYfLBAVn/h/glYGNqpBXTBnv/SHj4S9z0l2Euhhkbjyh1jxuN
	U5E2zI9oEiMAKeXjz7AdsSASkDjWVMGY=
X-Gm-Gg: ASbGncuaYGX0qUgouKkLjoUZvKFBNZpgDwvT1Bpx8HGjx8WI1QzlCyPVEZ5XMW4IPwK
	IskyHE/FejtRLlWmtVSS6A7oZktRwz6tgBbvayeQpuGkWL9saMscec6EnDl+oYmyR03FLSbw7pV
	IDOMiICRJzGkNPY/UtgNrOdp8DQq9TORLG1EB7OgTQDA==
X-Google-Smtp-Source: AGHT+IHVAbiULaOs+uH16KUv232TefGnn48RuzNlx+BsH0Li/v4yWH677v9VZZ77vw/D6mZpyaIBpJEYfJ8WnQdS5Qw=
X-Received: by 2002:a05:651c:40dc:b0:32b:4653:2f62 with SMTP id
 38308e7fff4ca-32b991c50a4mr10336511fa.7.1750501337017; Sat, 21 Jun 2025
 03:22:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620-usb_authentication-v1-0-0d92261a5779@ssi.gouv.fr> <20250620-usb_authentication-v1-2-0d92261a5779@ssi.gouv.fr>
In-Reply-To: <20250620-usb_authentication-v1-2-0d92261a5779@ssi.gouv.fr>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Sat, 21 Jun 2025 15:21:59 +0500
X-Gm-Features: AX0GCFvAQqm9Fjv7iVDtfHUrzFjvFrT5Z0YviDyy119RNquzH0WRbvNW9S2CpDc
Message-ID: <CACzwLxjJ3hx+PFVh2uWdVD1Pqw6HmUWtQiN+Q618ib2w+X3gww@mail.gmail.com>
Subject: Re: [RFC PATCH 2/4] usb: core: Introduce usb authentication feature
To: nicolas.bouchinet@oss.cyber.gouv.fr
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Kannappan R <r.kannappan@intel.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Stefan Eichenberger <stefan.eichenberger@toradex.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Pawel Laszczak <pawell@cadence.com>, Ma Ke <make_ruc2021@163.com>, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>, 
	Luc Bonnafoux <luc.bonnafoux@oss.cyber.gouv.fr>, 
	Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 7:27=E2=80=AFPM <nicolas.bouchinet@oss.cyber.gouv.f=
r> wrote:
>
> From: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
>
> This includes the usb authentication protocol implementation bulk
> exposed by the public usb_authenticate_device function.
>
> The protocol exchange is driven by the host and can be decomposed into
> three, mostly independent, phases:
>
> - The Host can request a digest of each certificate own by the
>   peripheral.
> - If the Host does not recognize the peripheral from one of its digests,
>   it can read one or more certificates from the device until a valid one
>   is found.
> - The Host can issue an authentication challenge to the peripheral.
>
> The usb_authenticate_device function implements the usb authentication
> protocol.
>
> It implements the three phases of the protocol :
>
> First, it needs to communicate with the usb device in order to fetch its
> certificate digests (usb_authent_req_digest).
> Then if the device is unknown, the host fetches the device certificate
> chains (usb_authent_read_cert_part, usb_authent_read_certificate).
> Once at least a digest has been recognized or a certificate chain has
> been validated the host challenges the device in order to authenticate
> it (usb_authent_challenge_dev).
>
> It also needs to communicate with a policy engine using the following
> functions :
>
> usb_policy_engine_check_digest
> usb_policy_engine_check_cert_chain
> usb_policy_engine_generate_challenge
> usb_policy_engine_check_challenge
>
> Co-developed-by: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
> Signed-off-by: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
> Signed-off-by: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
> ---
>  drivers/usb/core/authent.c | 631 +++++++++++++++++++++++++++++++++++++++=
++++++
>  drivers/usb/core/authent.h | 166 ++++++++++++
>  2 files changed, 797 insertions(+)
>
> diff --git a/drivers/usb/core/authent.c b/drivers/usb/core/authent.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..46f048d45a909e0fef504d710=
72eb7854320d271
> --- /dev/null
> +++ b/drivers/usb/core/authent.c
> @@ -0,0 +1,631 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * SPDX-FileCopyrightText: (C) 2025 ANSSI
> + *
> + * USB Authentication protocol implementation
> + *
> + * Author: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
> + * Author: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
> + *
> + */
> +
> +#include <linux/types.h>
> +#include <linux/usb.h>
> +#include <linux/usb/ch9.h>
> +#include <linux/usb/hcd.h>
> +#include <linux/usb/quirks.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/device.h>
> +#include <linux/delay.h>
> +#include <asm/byteorder.h>
> +
> +#include "authent_netlink.h"
> +
> +#include "authent.h"
> +
> +/**
> + * usb_authent_req_digest - Check if device is known via its digest
> + * @dev:               [in]  pointer to the usb device to query
> + * @buffer:     [inout] buffer to hold request data
> + * @digest:     [out] device digest
> + *
> + * Context: task context, might sleep.
> + *
> + * This function sends a digest request to the usb device.
> + *
> + * Possible errors:
> + *  - ECOMM : failed to send or received a message to the device
> + *  - EINVAL : if buffer or mask is NULL
> + *
> + * Return: If successful, zero. Otherwise, a negative  error number.
> + */
> +static int usb_authent_req_digest(struct usb_device *dev, uint8_t *const=
 buffer,
> +                                 uint8_t digest[256], uint8_t *mask)
> +{
> +       int ret =3D 0;
> +       struct usb_authent_digest_resp *digest_resp =3D NULL;
> +
> +       if (unlikely((buffer =3D=3D NULL || mask =3D=3D NULL))) {
> +               pr_err("invalid arguments\n");
> +               return -EINVAL;
> +       }
> +       ret =3D usb_control_msg(dev, usb_rcvctrlpipe(dev, 0), AUTH_IN, US=
B_DIR_IN,
> +                             (USB_SECURITY_PROTOCOL_VERSION << 8) +
> +                                     USB_AUTHENT_DIGEST_REQ_TYPE,
> +                             0, buffer, 260, USB_CTRL_GET_TIMEOUT);
> +       if (ret < 0) {
> +               pr_err("Failed to get digest: %d\n", ret);
> +               ret =3D -ECOMM;
> +               goto exit;
> +       }
> +
> +       // Parse received digest response
> +       digest_resp =3D (struct usb_authent_digest_resp *)buffer;
> +       pr_notice("received digest response:\n");
> +       pr_notice("     protocolVersion: %x\n", digest_resp->protocolVers=
ion);
> +       pr_notice("     messageType: %x\n", digest_resp->messageType);
> +       pr_notice("     capability: %x\n", digest_resp->capability);
> +       pr_notice("     slotMask: %x\n", digest_resp->slotMask);
> +
> +       *mask =3D digest_resp->slotMask;

Wonder, if we might have a bug for BE hosts here.
Spec says the slot bitmap is LE, for devices that set bit 7
it will be mis-interpreted on BE.

    int usb_authenticate_device(struct usb_device *dev)
    {
        ...
        for (i =3D 0; i < 8; i++) {
            if (1 =3D=3D ((slot_mask >> i) & 1)) { /* bit-test */
                /* use digest at digests[i * 32] */
                ...
            }
        }
    }

That loop treats bit 0 as the LSB, so it does match the spec on both
little- and big-endian hosts. There is no endian bug in the mask
handling itself, AFAIU.

What can bite us, however, is positional coupling between the mask and
the digest array:

The spec guarantees that digest k appears only if bit k is set and
that digests are =E2=80=9Creturned in order of increasing slot number.=E2=
=80=9D

So if a device leaves gap(s) (e.g. slots 0 and 2 populated, slot 1
empty) the firmware is allowed to pack the digests for 0 and 2
contiguously. Our code assumes digest[k] is always at offset k*32,
which fails in
that sparse case.

> +       memcpy(digest, digest_resp->digests, 256);
> +
> +       ret =3D 0;
> +
> +exit:
> +
> +       return ret;
> +}
> +
> +struct usb_auth_cert_req {
> +       uint16_t offset;
> +       uint16_t length;
> +} __packed;
> +
> +/**
> + * @brief Request a specific part of a certificate chain from the device
> + *
> + * Context: task context, might sleep
> + *
> + * Possible errors:
> + *  - ECOMM : failed to send or receive a message to the device
> + *  - EINVAL : if buffer or cert_part is NULL
> + *
> + * @param [in]     dev       : handle to the USB device
> + * @param [in,out] buffer    : buffer used for communication, caller all=
ocated
> + * @param [in]     slot      : slot in which to read the certificate
> + * @param [in]     offset    : at which the certificate fragment must be=
 read
> + * @param [in]     length    : of the certificate fragment to read
> + * @param [out]    cert_part : buffer to hold the fragment, caller alloc=
ated
> + *
> + * @return 0 on SUCCESS else an error code
> + */
> +static int usb_auth_read_cert_part(struct usb_device *dev, uint8_t *cons=
t buffer,
> +                                  const uint8_t slot, const uint16_t off=
set,
> +                                  const uint16_t length, uint8_t *cert_p=
art)
> +{
> +       struct usb_auth_cert_req cert_req =3D { 0 };
> +       int ret =3D -1;
> +
> +       if (unlikely(buffer =3D=3D NULL || cert_part =3D=3D NULL)) {
> +               pr_err("invalid argument\n");
> +               return -EINVAL;
> +       }
> +
> +       cert_req.offset =3D offset;
> +       cert_req.length =3D length;
> +
> +       // AUTH OUT request transfer
> +       memcpy(buffer, &cert_req, sizeof(struct usb_auth_cert_req));
> +       ret =3D usb_control_msg(dev, usb_sndctrlpipe(dev, 0), AUTH_OUT,
> +                             USB_DIR_OUT,
> +                             (USB_SECURITY_PROTOCOL_VERSION << 8) +
> +                                     USB_AUTHENT_CERTIFICATE_REQ_TYPE,
> +                             (slot << 8), buffer,
> +                             sizeof(struct usb_auth_cert_req),
> +                             USB_CTRL_GET_TIMEOUT);
> +       if (ret < 0) {
> +               pr_err("Failed to send certificate request: %d\n", ret);
> +               ret =3D -ECOMM;
> +               goto cleanup;
> +       }
> +
> +       // AUTH IN certificate read
> +       ret =3D usb_control_msg(dev, usb_rcvctrlpipe(dev, 0), AUTH_IN, US=
B_DIR_IN,
> +                             (USB_SECURITY_PROTOCOL_VERSION << 8) +
> +                                     USB_AUTHENT_CERTIFICATE_RESP_TYPE,
> +                             (slot << 8), buffer, length + 4,
> +                             USB_CTRL_GET_TIMEOUT);
> +       if (ret < 0) {
> +               pr_notice("Failed to get certificate from peripheral: %d\=
n", ret);
> +               ret =3D -ECOMM;
> +               goto cleanup;
> +       }
> +
> +       // TODO: parse received header
> +       memcpy(cert_part, buffer + 4, length);
> +
> +       ret =3D 0;
> +
> +cleanup:
> +
> +       return ret;
> +}
> +
> +/**
> + * usb_authent_read_certificate - Read a device certificate
> + * @dev:               [in] pointer to the usb device to query
> + * @buffer:            [inout] buffer to hold request data, caller alloc=
ated
> + * @slot:              [in] certificate chain to be read
> + * @cert_der:   [out] buffer to hold received certificate chain
> + * @cert_len:   [out] length of received certificate
> + *
> + * Context: task context, might sleep.
> + *
> + * Possible errors:
> + *  - EINVAL : NULL pointer or invalid slot value
> + *  - ECOMM  : failed to send request to device
> + *  - ENOMEM : failed to allocate memory for certificate
> + *
> + * Return: If successful, zero. Otherwise, a negative  error number.
> + */
> +static int usb_authent_read_certificate(struct usb_device *dev, uint8_t =
*const buffer,
> +                                       uint8_t slot, uint8_t **cert_der,=
 size_t *cert_len)
> +{
> +       uint16_t read_offset =3D 0;
> +       uint16_t read_length =3D 0;
> +       uint8_t chain_part[64] =3D { 0 };
> +
> +       if (unlikely(slot >=3D 8 || buffer =3D=3D NULL || cert_der =3D=3D=
 NULL || cert_len =3D=3D NULL)) {
> +               pr_err("invalid arguments\n");
> +               return -EINVAL;
> +       }
> +
> +       // First request to get certificate chain length
> +       if (usb_auth_read_cert_part(dev, buffer, slot, 0,
> +                                   USB_AUTH_CHAIN_HEADER_SIZE,
> +                                   chain_part) !=3D 0) {
> +               pr_err("Failed to get first certificate part\n");
> +               return -ECOMM;
> +       }
> +
> +       // Extract total length
> +       *cert_len =3D ((uint16_t *)chain_part)[0];
> +       pr_notice("Received header of chain with length: %ld\n",
> +              (*cert_len) + USB_AUTH_CHAIN_HEADER_SIZE);
> +
> +       // Allocate certificate DER buffer
> +       *cert_der =3D kzalloc(*cert_len, GFP_KERNEL);
> +       if (!(*cert_der))
> +               return -ENOMEM;
> +
> +       // Write the chain header at the beginning of the chain.
> +       memcpy(*cert_der, chain_part, USB_AUTH_CHAIN_HEADER_SIZE);
> +       // Read the certificate chain starting after the header.
> +       read_offset =3D USB_AUTH_CHAIN_HEADER_SIZE;
> +
> +       while (read_offset < *cert_len) {
> +               read_length =3D (*cert_len - read_offset) >=3D 64 ? 64 : =
(*cert_len - read_offset);
> +
> +               if (usb_auth_read_cert_part(dev, buffer, slot, read_offse=
t,
> +                                           read_length, chain_part) !=3D=
 0) {
> +                       pr_err("USB AUTH: Failed to get certificate part\=
n");
> +                       return -ECOMM;
> +               }
> +
> +               memcpy(*cert_der + read_offset, chain_part, read_length);
> +
> +               read_offset +=3D read_length;
> +       }
> +
> +       return 0;
> +}
> +
> +/**
> + * usb_authent_challenge_dev - Challenge a device
> + * @dev:                               [in] pointer to the usb device to=
 query
> + * @buffer:                    [in] pointer to the buffer allocated for =
USB query
> + * @slot:                              [in] certificate chain to be used
> + * @slot_mask: [in] slot mask of the device
> + * @nonce:                     [in] nonce to use for the challenge, 32 b=
ytes long
> + * @chall:                     [out] buffer for chall response, 204 byte=
s long, caller allocated
> + *
> + * Context: task context, might sleep.
> + *
> + * Possible errors:
> + *  - EINVAL : NULL input pointer or invalid slot value
> + *  - ECOMM  : failed to send or receive message from the device
> + *
> + * Return: If successful, zero. Otherwise, a negative  error number.
> + */
> +static int usb_authent_challenge_dev(struct usb_device *dev, uint8_t *bu=
ffer,
> +       const uint8_t slot, const uint8_t slot_mask, const uint8_t *const=
 nonce,
> +       uint8_t *const chall)
> +{
> +       int ret =3D -1;
> +
> +       if (unlikely(buffer =3D=3D NULL || slot >=3D 8 || nonce =3D=3D NU=
LL)) {
> +               pr_err("invalid arguments\n");
> +               return -EINVAL;
> +       }
> +
> +       // AUTH OUT challenge request transfer
> +       memcpy(buffer, nonce, 32);
> +       ret =3D usb_control_msg(dev, usb_sndctrlpipe(dev, 0), AUTH_OUT,
> +                             USB_DIR_OUT,
> +                             (USB_SECURITY_PROTOCOL_VERSION << 8) +
> +                                     USB_AUTHENT_CHALLENGE_REQ_TYPE,
> +                             (slot << 8), buffer, 32, USB_CTRL_GET_TIMEO=
UT);
> +       if (ret < 0) {
> +               pr_err("Failed to send challenge request: %d\n", ret);
> +               ret =3D -ECOMM;
> +               goto cleanup;
> +       }
> +
> +       // Complete the challenge with the request
> +       chall[1] =3D USB_SECURITY_PROTOCOL_VERSION;
> +       chall[0] =3D USB_AUTHENT_CHALLENGE_REQ_TYPE;
> +       chall[2] =3D slot;
> +       chall[3] =3D 0x00;
> +       memcpy(chall+4, nonce, 32);
> +
> +       // AUTH IN challenge response transfer
> +       ret =3D usb_control_msg(dev, usb_rcvctrlpipe(dev, 0), AUTH_IN, US=
B_DIR_IN,
> +                             (USB_SECURITY_PROTOCOL_VERSION << 8) +
> +                                     USB_AUTHENT_CHALLENGE_RESP_TYPE,
> +                             (slot << 8) + slot_mask, buffer, 168,
> +                             USB_CTRL_GET_TIMEOUT);
> +       if (ret < 0) {
> +               pr_err("Failed to get challenge response: %d\n", ret);
> +               ret =3D -ECOMM;
> +               goto cleanup;
> +       }
> +
> +       pr_notice("received challenge response\n");
> +
> +       // Complete last part of the challenge with what is returned by t=
he device
> +       memcpy(chall+USB_AUTH_CHAIN_HEADER_SIZE, buffer, 168);
> +
> +       ret =3D 0;
> +
> +cleanup:
> +
> +       return ret;
> +}
> +
> +/**
> + * @brief Create a device context according to USB Type-C Authentication=
 Specification, chapter 5.5
> + *     1. Device Descriptor
> + *     2. Complete BOS Descriptor (if present)
> + *     3. Complete Configuration 1 Descriptor
> + *     4. Complete Configuration 2 Descriptor (if present)
> + *     5. ...
> + *     6. Complete Configuration n Descriptor (if present)
> + *
> + * Possible error codes:
> + *  - EINVAL : invalid dev, ctx or size
> + *
> + * @param [in] dev       : handle to the USB device
> + * @param [in, out] ctx  : buffer to hold the device context, caller all=
ocated
> + * @param [in] buf_size  : available size in the context buffer
> + * @param [out] ctx_size : total size of the context if return equals 0
> + *
> + * @return 0 or error code
> + */
> +static int usb_auth_create_dev_ctx(struct usb_device *dev, uint8_t *ctx,
> +                                                       const size_t buf_=
size, size_t *ctx_size)
> +{
> +       int desc_size =3D 0;
> +
> +       if (unlikely(dev =3D=3D NULL || ctx =3D=3D NULL)) {
> +               pr_err("invalid inputs\n");
> +               return -EINVAL;
> +       }
> +
> +       *ctx_size =3D 0;
> +
> +       // Device descriptor
> +       if (buf_size < (size_t)dev->descriptor.bLength) {
> +               pr_err("buffer too small\n");
> +               return -EINVAL;
> +       }
> +
> +       memcpy(ctx, (void *) &dev->descriptor, (size_t) dev->descriptor.b=
Length);
> +
> +       *ctx_size +=3D (size_t) dev->descriptor.bLength;
> +
> +       // Device BOS and capabilities
> +       if (unlikely(dev->bos =3D=3D NULL || dev->bos->desc =3D=3D NULL))=
 {
> +               pr_err("invalid BOS\n");
> +               return -EINVAL;
> +       }
> +
> +       desc_size =3D le16_to_cpu(dev->bos->desc->wTotalLength);
> +
> +       if (buf_size < (*ctx_size + desc_size)) {
> +               pr_err("buffer too small\n");
> +               return -EINVAL;
> +       }
> +
> +       memcpy(ctx + (*ctx_size), (void *) dev->bos->desc, desc_size);
> +
> +       *ctx_size +=3D desc_size;
> +
> +       // Device configuration descriptor
> +       if (unlikely(dev->config =3D=3D NULL)) {
> +               pr_err("invalid configuration\n");
> +               return -EINVAL;
> +       }
> +
> +       desc_size =3D le16_to_cpu(dev->config->desc.wTotalLength);
> +
> +       if (buf_size < (*ctx_size + desc_size)) {
> +               pr_err("buffer too small\n");
> +               return -EINVAL;
> +       }
> +
> +       memcpy(ctx + (*ctx_size), (void *) &dev->config->desc, 9);

What is 9 byte size for? Can not find 9 in spec "chapter 5.5 Context Hash".
Do we want to copy the entire config descriptor(s) instead?
If yes, then we might use dev->rawdescriptors[] which has wTotalLength.
If no, the comment of 9 explanation will be useful here.

> +
> +       *ctx_size +=3D 9;
> +
> +       return 0;
> +}
> +
> +/**
> + * @brief Check that the authentication can resume after a sleep
> + *
> + * @param [in] dev : the usb device
> + * @param [in] hub : the parent hub
> + *
> + * Possible error codes:
> + *  - ENODEV : hub has been disconnected
> + *
> + * @return 0 if possible to resume, else an error code
> + */
> +static int usb_auth_try_resume(struct usb_device *dev, struct usb_device=
 *hub)
> +{
> +       // Test if the hub or the device has been disconnected
> +       if (unlikely(hub =3D=3D NULL || dev =3D=3D NULL ||
> +                    dev->port_is_suspended =3D=3D 1 ||
> +                    dev->reset_in_progress =3D=3D 1)) {
> +               return -ENODEV;
> +       }
> +
> +       // TODO: test if the device has not been disconnected
> +       // TODO: test if the device has not been disconnected then replac=
ed with another one
> +
> +       return 0;
> +}
> +
> +/**
> + * usb_authenticate_device - Challenge a device
> + * @dev:               [inout] pointer to device
> + *
> + * Context: task context, might sleep.
> + *
> + * Authentication is done in the following steps:
> + *  1. Get device certificates digest to determine if it is already know=
n
> + *       if yes, go to 3.
> + *  2. Get device certificates
> + *  3. Challenge device
> + *  4. Based on previous result, determine if device is allowed under lo=
cal
> + *     security policy.
> + *
> + * Possible error code:
> + *  - ENOMEM : failed to allocate memory for exchange
> + *  - TODO: complete all possible error case
> + *
> + * Return: If successful, zero. Otherwise, a negative  error number.
> + */
> +int usb_authenticate_device(struct usb_device *dev)
> +{
> +       int ret =3D 0;
> +
> +       uint8_t is_valid =3D 0;
> +       uint8_t is_known =3D 0;
> +       uint8_t is_blocked =3D 0;
> +       uint8_t chain_nb =3D 0;
> +       uint8_t slot_mask =3D 0;
> +       uint8_t slot =3D 0;
> +       uint8_t digests[256] =3D { 0 };
> +       uint8_t nonce[32] =3D {0};
> +       uint8_t chall[204] =3D {0};
> +       uint32_t dev_id =3D 0;
> +       size_t ctx_size =3D 0;
> +       int i =3D 0;
> +
> +       uint8_t *cert_der =3D NULL;
> +       size_t cert_len =3D 0;
> +
> +       if (unlikely(dev =3D=3D NULL || dev->parent =3D=3D NULL))
> +               return -ENODEV;
> +
> +       struct usb_device *hub =3D dev->parent;
> +
> +       // By default set authorization status at false
> +       dev->authorized =3D 0;
> +       dev->authenticated =3D 0;
> +
> +       uint8_t *buffer =3D NULL;
> +       // Buffer to hold responses
> +       buffer =3D kzalloc(512, GFP_KERNEL);
> +       if (!buffer)
> +               return -ENOMEM;
> +
> +       pr_notice("start of device authentication\n");
> +
> +       /*
> +        * Send DIGEST request to determine if it is a known device
> +        */
> +       ret =3D usb_authent_req_digest(dev, buffer, digests, &slot_mask);
> +       if (ret !=3D 0) {
> +               pr_err("failed to get digest: %d\n", ret);
> +               goto cleanup;
> +       }
> +       pr_notice("received digest\n");
> +
> +       usb_unlock_device(hub);
> +       ret =3D usb_policy_engine_check_digest(dev->route, digests, slot_=
mask,
> +                                            &is_known, &is_blocked, &dev=
_id);
> +       if (ret !=3D 0) {
> +               pr_err("failed to check digest: %d\n", ret);
> +               usb_lock_device(hub);
> +               goto cleanup;
> +       }
> +       pr_info("waking up\n");
> +       usb_lock_device(hub);
> +       ret =3D usb_auth_try_resume(dev, hub);
> +       if (unlikely(ret !=3D 0)) {
> +               pr_err("failed to resume: %d\n", ret);
> +               goto cleanup;
> +       }
> +
> +       pr_info("resuming\n");
> +
> +       /*
> +        * If the device is already known and blocked, reject it
> +        */
> +       if (is_known && is_blocked) {
> +               ret =3D 0;
> +               goto cleanup;
> +       }
> +
> +       /*
> +        * If device is not already known try to obtain a valid certifica=
te
> +        * Iterate over every device certificate slots, it gets them one =
by one
> +        * in order to avoid spamming the device.
> +        */
> +       if (!is_known) {
> +               // Iterate over slot containing a certificate until a val=
id one is found
> +               for (i =3D 0; i < 8; i++) {
> +                       // Test if slot contains a certificate chain
> +                       if (1 =3D=3D ((slot_mask >> i) & 1)) {
> +                               ret =3D usb_authent_read_certificate(dev,=
 buffer,
> +                                                                  chain_=
nb,
> +                                                                  &cert_=
der,
> +                                                                  &cert_=
len);
> +                               if (ret !=3D 0) {
> +                                       // Failed to read device certific=
ate, abort authentication
> +                                       // Apply security policy on faile=
d device
> +                                       goto cleanup;
> +                               }
> +                               pr_notice("received certificate\n");
> +
> +                               // validate the certificate
> +                               usb_unlock_device(hub);
> +                               ret =3D usb_policy_engine_check_cert_chai=
n(
> +                                       dev->route, digests + i * 32, cer=
t_der,
> +                                       cert_len, &is_valid, &is_blocked,
> +                                       &dev_id);
> +                               if (ret !=3D 0) {
> +                                       pr_err("failed to validate certif=
icate: %d\n", ret);
> +                                       usb_lock_device(hub);
> +                                       goto cleanup;
> +                               }
> +                               pr_notice("validated certificate\n");
> +                               usb_lock_device(hub);
> +
> +                               ret =3D usb_auth_try_resume(dev, hub);
> +                               if (unlikely(ret !=3D 0)) {
> +                                       pr_err("failed to resume: %d\n", =
ret);
> +                                       goto cleanup;
> +                               }
> +
> +                               pr_info("resuming\n");
> +
> +                               if (is_valid && !is_blocked) {
> +                                       // Found a valid and authorized c=
ertificate,
> +                                       // continue with challenge
> +                                       slot =3D i;
> +                                       break;
> +                               } else if (is_valid && is_blocked) {
> +                                       // Found a valid and unauthorized=
 certificate,
> +                                       // reject device
> +                                       ret =3D 0;
> +                                       goto cleanup;
> +                               }
> +                       }
> +               }
> +       } else {
> +               // Pick a slot among the valid ones, take first one
> +               for (i =3D 0; i < 8; i++) {
> +                       if (1 =3D=3D ((is_known >> i) & 1)) {
> +                               slot =3D i;
> +                               break;
> +                       }
> +               }
> +       }
> +
> +       /*
> +        * Authenticate the device with a challenge request
> +        */
> +       // Obtain a nonce for the challenge
> +       usb_unlock_device(hub);
> +       ret =3D usb_policy_engine_generate_challenge(dev_id, nonce);
> +       if (ret !=3D 0) {
> +               pr_err("failed to generate challenge: %d\n", ret);
> +               usb_lock_device(hub);
> +               goto cleanup;
> +       }
> +       pr_notice("generated challenge\n");
> +       usb_lock_device(hub);
> +
> +       ret =3D usb_auth_try_resume(dev, hub);
> +       if (unlikely(ret !=3D 0)) {
> +               pr_err("failed to resume: %d\n", ret);
> +               goto cleanup;
> +       }
> +
> +       pr_info("resuming\n");
> +
> +       // Send a challenge request
> +       ret =3D usb_authent_challenge_dev(dev, buffer, slot, slot_mask, n=
once,
> +                                       chall);
> +       if (ret !=3D 0) {
> +               pr_err("failed to challenge device: %d\n", ret);
> +               goto cleanup;
> +       }
> +       pr_notice("validated challenge\n");
> +
> +       // Create device context
> +       ret =3D usb_auth_create_dev_ctx(dev, buffer, 512, &ctx_size);
> +       if (ret !=3D 0) {
> +               pr_err("failed to create context: %d\n", ret);
> +               goto cleanup;
> +       }
> +
> +       // Validate the challenge
> +       usb_unlock_device(hub);
> +       ret =3D usb_policy_engine_check_challenge(dev_id, chall, buffer, =
ctx_size,
> +                                               &is_valid);
> +       if (ret !=3D 0) {
> +               pr_err("failed to check challenge: %d\n", ret);
> +               usb_lock_device(hub);
> +               goto cleanup;
> +       }
> +       pr_notice("checked challenge\n");
> +       usb_lock_device(hub);
> +
> +       ret =3D usb_auth_try_resume(dev, hub);
> +       if (unlikely(ret !=3D 0)) {
> +               pr_err("failed to resume: %d\n", ret);
> +               goto cleanup;
> +       }
> +
> +       pr_info("resuming\n");
> +
> +       // Apply authorization decision
> +       if (is_valid) {
> +               dev->authorized =3D 1;
> +               dev->authenticated =3D 1;
> +       }
> +
> +       ret =3D 0;
> +
> +cleanup:
> +       kfree(buffer);
> +       kfree(cert_der);
> +
> +       return 0;

In every early-error path `ret` is set but thrown away here.
Enumeration thus always continues and hub believes the device is authentica=
ted.
Please return `ret`.

> +}
> diff --git a/drivers/usb/core/authent.h b/drivers/usb/core/authent.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..c3852636dbcea9150ed166376=
9e2a7b6348f528c
> --- /dev/null
> +++ b/drivers/usb/core/authent.h
> @@ -0,0 +1,166 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * SPDX-FileCopyrightText: (C) 2025 ANSSI
> + *
> + * USB Authentication protocol definition
> + *
> + * Author: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
> + * Author: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
> + *
> + */
> +
> +#ifndef __USB_CORE_AUTHENT_H_
> +#define __USB_CORE_AUTHENT_H_
> +
> +#include <linux/types.h>
> +#include <linux/usb.h>
> +#include <linux/usb/ch11.h>
> +#include <linux/usb/hcd.h>
> +
> +/* From USB Type-C Authentication spec, Table 5-2 */
> +#define USB_AUTHENT_CAP_TYPE 0x0e
> +
> +/* From USB Security Foundation spec, Table 5-2 */
> +#define USB_SECURITY_PROTOCOL_VERSION 0x10
> +
> +#define AUTH_IN 0x18
> +#define AUTH_OUT 0x19
> +
> +/* USB_DT_AUTHENTICATION_CAP */
> +struct usb_authent_cap_descriptor {
> +       __u8  bLength;
> +       __u8  bDescriptorType;
> +       __u8  bDevCapabilityType; /* Shall be set to USB_AUTHENT_CAP_TYPE=
 */
> +       /*
> +        * bit 0: set to 1 if firmware can be updated
> +        * bit 1: set to 1 to indicate the Device changes interface when =
updated
> +        * bits 2-7: reserved, set to 0
> +        */
> +       __u8  bmAttributes;
> +       __u8  bcdProtocolVersion; /* Shall be set to USB_SECURITY_PROTOCO=
L_VERSION */
> +       __u8  bcdCapability; /* Set to 0x01 */
> +
> +} __packed;
> +
> +/* Certificate chain header, Table 3-1 */
> +struct usb_cert_chain_hd {
> +       __u16 length; /* Chain total length including header, little endi=
an */
> +       __u16 reserved; /* Shall be set to zero */
> +       __u8 rootHash[32]; /* Hash of root certificate, big endian */
> +} __packed;
> +
> +/* From USB Security Foundation spec, Table 5-3 and Table 5-9 */
> +#define USB_AUTHENT_DIGEST_RESP_TYPE 0x01
> +#define USB_AUTHENT_CERTIFICATE_RESP_TYPE 0x02
> +#define USB_AUTHENT_CHALLENGE_RESP_TYPE 0x03
> +#define USB_AUTHENT_ERROR_TYPE 0x7f
> +#define USB_AUTHENT_DIGEST_REQ_TYPE 0x81
> +#define USB_AUTHENT_CERTIFICATE_REQ_TYPE 0x82
> +#define USB_AUTHENT_CHALLENGE_REQ_TYPE 0x83
> +
> +#define USB_AUTH_DIGEST_SIZE 32
> +#define USB_AUTH_CHALL_SIZE 32
> +
> +#define USB_AUTH_CHAIN_HEADER_SIZE 36
> +
> +/* USB Authentication GET_DIGEST Request Header */
> +struct usb_authent_digest_req_hd {
> +       __u8 protocolVersion; /* Shall be set to USB_SECURITY_PROTOCOL_VE=
RSION */

nit: shall we follow camelcase as in spec or keep Linux underscore style?

> +       __u8 messageType; /* Shall be set to USB_AUTHENT_DIGEST_REQ_TYPE =
*/
> +       __u8 param1; /* Reserved */
> +       __u8 param2; /* Reserved */
> +} __packed;
> +
> +/* USB Authentication GET_CERTIFICATE Request Header */
> +struct usb_authent_certificate_req_hd {
> +       __u8 protocolVersion; /* Shall be set to USB_SECURITY_PROTOCOL_VE=
RSION */
> +       __u8 messageType; /* Shall be set to USB_AUTHENT_CERTIFICATE_REQ_=
TYPE */
> +       __u8 certChainSlotNumber; /* Must be between 0 and 7 inclusive */
> +       __u8 param2; /* Reserved */
> +} __packed;
> +
> +/* USB Authentication GET_CERTIFICATE Request */
> +struct usb_authent_certificate_req {
> +       __u8 protocolVersion; /* Shall be set to USB_SECURITY_PROTOCOL_VE=
RSION */
> +       __u8 messageType; /* Shall be set to USB_AUTHENT_CERTIFICATE_REQ_=
TYPE */
> +       __u8 certChainSlotNumber; /* Must be between 0 and 7 inclusive */
> +       __u8 param2; /* Reserved */
> +       __u16 offset; /* Read index of Certificate Chain in bytes and lit=
tle endian*/
> +       __u16 length; /* Length of read request, little endian */
> +} __packed;
> +
> +/* USB Authentication CHALLENGE Request Header */
> +struct usb_authent_challenge_req_hd {
> +       __u8 protocolVersion; /* Shall be set to USB_SECURITY_PROTOCOL_VE=
RSION */
> +       __u8 messageType; /* Shall be set to USB_AUTHENT_CHALLENGE_REQ_TY=
PE */
> +       __u8 certChainSlotNumber; /* Must be between 0 and 7 inclusive */
> +       __u8 param2; /* Reserved */
> +} __packed;
> +
> +/* USB Authentication CHALLENGE Request Header */
> +struct usb_authent_challenge_req {
> +       __u8 protocolVersion; /* Shall be set to USB_SECURITY_PROTOCOL_VE=
RSION */
> +       __u8 messageType; /* Shall be set to USB_AUTHENT_CHALLENGE_REQ_TY=
PE */
> +       __u8 certChainSlotNumber; /* Must be between 0 and 7 inclusive */
> +       __u8 param2; /* Reserved */
> +       __u32 nonce; /* Random Nonce chosen for the challenge */
> +} __packed;
> +
> +/* USB Authentication DIGEST response Header */
> +struct usb_authent_digest_resp {
> +       __u8 protocolVersion; /* Shall be set to USB_SECURITY_PROTOCOL_VE=
RSION */
> +       __u8 messageType; /* Shall be set to USB_AUTHENT_DIGEST_RESP_TYPE=
 */
> +       __u8 capability; /* Shall be set to 0x01 */
> +       __u8 slotMask; /* Bit set to 1 if slot is set, indicates number o=
f digests */
> +       __u8 digests[8][32]; /* List of digests */
> +} __packed;
> +
> +/* USB Authentication CERTIFICATE response Header */
> +struct usb_authent_certificate_resp_hd {
> +       __u8 protocolVersion; /* Shall be set to USB_SECURITY_PROTOCOL_VE=
RSION */
> +       __u8 messageType; /* Shall be set to USB_AUTHENT_CERTIFICATE_RESP=
_TYPE */
> +       __u8 slotNumber; /* Slot number of certificate chain returned */
> +       __u8 param2; /* Reserved */
> +} __packed;
> +
> +/* USB Authentication CHALLENGE response Header */
> +struct usb_authent_challenge_resp_hd {
> +       __u8 protocolVersion; /* Shall be set to USB_SECURITY_PROTOCOL_VE=
RSION */
> +       __u8 messageType; /* Shall be set to USB_AUTHENT_CHALLENGE_RESP_T=
YPE */
> +       __u8 slotNumber; /* Slot number of certificate chain returned */
> +       __u8 slotMask; /* Bit set to 1 if slot is set */
> +} __packed;
> +
> +/* USB Authentication CHALLENGE response */
> +struct usb_authent_challenge_resp {
> +       __u8 protocolVersion; /* Shall be set to USB_SECURITY_PROTOCOL_VE=
RSION */
> +       __u8 messageType; /* Shall be set to USB_AUTHENT_CHALLENGE_RESP_T=
YPE */
> +       __u8 slotNumber; /* Slot number of certificate chain returned */
> +       __u8 slotMask; /* Bit set to 1 if slot is set */
> +       __u8 minProtocolVersion;
> +       __u8 maxProtocolVersion;
> +       __u8 capabilities; /* Shall be set to 0x01 */
> +       __u8 orgName; /* Organisation Name, USB-IF: 0 */
> +       __u32 certChainHash; /* SHA256 digest of certificate chain, big e=
ndian */
> +       __u32 salt; /* Chosen by responder */
> +       __u32 contextHash; /* SHA256 digest of product information, big e=
ndian */
> +       __u64 signature; /* ECDSA signature of request and response */
> +} __packed;
> +
> +/* USB Authentication error codes, Foundation Table 5-18 */
> +#define USB_AUTHENT_INVALID_REQUEST_ERROR 0x01
> +#define USB_AUTHENT_UNSUPPORTED_PROTOCOL_ERROR 0x02
> +#define USB_AUTHENT_BUSY_ERROR 0x03
> +#define USB_AUTHENT_UNSPECIFIED_ERROR 0x04
> +
> +/* USB Authentication response header */
> +struct usb_authent_error_resp_hd {
> +       __u8 protocolVersion; /* Shall be set to USB_SECURITY_PROTOCOL_VE=
RSION */
> +       __u8 messageType; /* Shall be set to USB_AUTHENT_ERROR_TYPE */
> +       __u8 errorCode;
> +       __u8 errorData;
> +} __packed;
> +
> +int usb_authenticate_device(struct usb_device *dev);
> +
> +#endif /* __USB_CORE_AUTHENT_H_ */
>
> --
> 2.50.0
>
