Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7184618C011;
	Sat, 21 Jun 2025 09:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750498646; cv=none; b=H/+n5BUQOpTXRzADkYez3eFZe9TffHaTJNGNrc/SXuzATrIlfaELjc52dYy75QLLmZkcvaqqIUV0H7aH5970k1Ivb0CjcOnLhNiNKxeUrtB3AmkuiXMMYGr3wSThwW7x2C3oyF+m/TgZlt6By8lOvrhih8ztspL8XPcp0kAr/HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750498646; c=relaxed/simple;
	bh=cGxAxes4njLCiDZ+mGM0VW8aiIqQFwFZgTNwQxFVNAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jig9iKE1pknOFsLD4mpY0Gq5xxCsxFjs9WQQPiJVEXSdMZeSENHThNl6uHgVtdV4/7WQ9Jtaoqv+q2eMfylGnkNDoPJ7Jo1VH1m6J3eIClrJUccqTH9pBsn+S43iKpMvA7MO2sM8Fuw3ubmAxpJznSR8oOSfvjiN8nuK8wDsJ00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bpe4C7/f; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpe4C7/f"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32ae3e94e57so17901871fa.1;
        Sat, 21 Jun 2025 02:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750498641; x=1751103441; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CoYyqqTP2xVhg0wQHtq2WI9vv9bMAstF24skHnlh3Pg=;
        b=bpe4C7/fX5d1v7vvJ6nA2ERDWDA7/R/5oKdRKx+bF8jdNbwGFIE7+6Jztzdex25n/T
         mTm8Hc+u4CRoJaSJ9dbg4KRkaiD03ODIQVqVr9gIS77Wm3OTnix9yg6KMGbU6MF6pto3
         TqLvDw9mqpf5COB37SjJ5XG1ALQ/XQEXKW0zMeHzvTRO1786Y3k2hDXr33te/2I93dcV
         e48p3nVPiOmLPJfCI8NBkCRgroQAzuqfwZNvSiocuVxhI4aY/w1nM0xce4er97rU6gof
         lop6cbpMcmKK+4Ed8gisuBr8WCl3/glJE0i+BKY2yZP5yQ693GDF1OOcQ8SyKPDkqbhl
         6Twg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750498641; x=1751103441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CoYyqqTP2xVhg0wQHtq2WI9vv9bMAstF24skHnlh3Pg=;
        b=n6dDbJgabcZipAl9vbk1fgsAIMne8L/xNwi1V2OoSHCzigCI+nXS+l+/YLTp8/0NMH
         jnhFPxsKM78rpZ0I+n9362S9JU0ZsecxdX4hHeryHIHjnUiYSL2ezlXXe4hFjRent7Zx
         nmujJjxWnGVxL+BAo1WUSPJlQ0JACv1KFYIP+52xd2zx4lKSjhSqo0JnEqjEbixBwUnC
         gsSm6fLU9ehVXJQyQBHoBmHwOXPDsOf+n9MoOzLzQMyA8ZKOvpGBVjDRigVHV13tJTGM
         4+1OcprnkciJp7JDbOe9QDQH5u2X8un1WTag6gCxopY39LzpA32p5fKGTO939lFpY0LP
         CaKg==
X-Forwarded-Encrypted: i=1; AJvYcCVzWj1hCiIyXukDId4MB9Si6+mrBnd2JriiG5iU7Nw9dWX8MUIRSR92EobP7o4r+bYHD0mRgxwEy9Jm@vger.kernel.org, AJvYcCWK/7cA1bRsp9XJHuJTdz/JQtVHSaZjQ/Ck+qPfLrU+Gy1NodYzCjoNt2Mvj/zb9QA5V2Nfb+SZXaBYcps=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaiB/i66Au5NP48nOQ1RC0epv20nUhOy5vr9MK9Ntq1mEZTM6a
	TB6DJ8LAxRqbmtO6w7rt33gNi3VoHstlbSc0L2zj0PCMq8lDrtaW4qw/8puwLsC0ZJuDp/JyLgj
	4MXQMZlSPpEYYHQ2r9vlvWBKGjzZQXEo=
X-Gm-Gg: ASbGncvvxRPSTzBNESQo91Fe5v6B9LbfKDr4PlvRX1IX3/Q/tUs88DbOTzcqunKlTmv
	IrStN6OKFVcZjWOL+3m+rRqU1GJDm6Y/JdLYumsGdrK55JhdzfUc5hF89SreUtA3s512ZnbI8XH
	tN700BS5/wIfxgC6kCOvZAJR55M70U+DkCKpi/d8Q7Dg==
X-Google-Smtp-Source: AGHT+IEFDxqtC8su40FQBIclEa0rSpKoe2/NgjluesH6FV71Q/pAvmDNq12suhzEe/NhoWrW+npwys75i19Fjp7bfd8=
X-Received: by 2002:a2e:a4ac:0:b0:32b:2ea9:1dcd with SMTP id
 38308e7fff4ca-32b98f979dbmr15973431fa.32.1750498640973; Sat, 21 Jun 2025
 02:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620-usb_authentication-v1-0-0d92261a5779@ssi.gouv.fr> <20250620-usb_authentication-v1-1-0d92261a5779@ssi.gouv.fr>
In-Reply-To: <20250620-usb_authentication-v1-1-0d92261a5779@ssi.gouv.fr>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Sat, 21 Jun 2025 14:37:07 +0500
X-Gm-Features: AX0GCFu5apYLrR6iRnTco4BNNCLt9o9ymPsyYJSlNxkejh6Z-_O9toM-0-xPQgM
Message-ID: <CACzwLxiLUW46uS6cCOHPix_kYUd_coAEHcSf2hOMtc32zCF_Fw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] usb: core: Introduce netlink usb authentication
 policy engine
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
> The usb authentication feature needs a policy engine in order to
> authorize or deny usb devices based on a user defined policy.
>
> In order to reduce the attack surface and in-kernel complexity, policy
> management, crypto operations and complex parsing have been implemented
> in userspace using the generic netlink API. The full authentication
> protocol is kernel driven.
>
> The following unicast netlink commands have been defined in order to
> fulfill device authentication :
>
> - USBAUTH_CMD_REGISTER
>
> This is the beginning of any authentication. The kernel first wait for
> the userspace service to connect to the socket using the
> `USBAUTH_CMD_REGISTER` netlink command.
> Upon connection, the kernel check that the userspace service has the
> `CAP_SYS_ADMIN` capability beforing enrolling the service. Only one
> userspace service can be registered.
>
> - USBAUTH_CMD_CHECK_DIGEST
>
> The kernel then sends a `USBAUTH_CMD_CHECK_DIGEST` netlink command to
> the policy engine to be verified. The policy engine checks if the device
> ceritificates has already been encountered.
>
> - USBAUTH_CMD_RESP_DIGEST
>
> After the policy engine has received an usb device certificate digest
> list from kernel, it needs to reply if it knows one of them using the
> `USBAUTH_CMD_RESP_DIGEST` netlink command.
>
> - USBAUTH_CMD_CHECK_CERTIFICATE
>
> The kernel then sends a `USBAUTH_CMD_CHECK_CERTIFICATE` netlink command
> to the policy engine. Each command contains one certificate chain. The
> policy engine verifies if the device certificate chain is trusted.
>
> - USBAUTH_CMD_RESP_CERTIFICATE
>
> After checking the certificate chain, the policy engine sends a
> `USBAUTH_CMD_RESP_CERTIFICATE` response. It tells the kernel if the
> device certificate chain is trusted and thus if the device
> authentication should continue.
>
> Once device has been validated either through the digest or certificate
> chain validation, an authentication session is started and a device ID
> is associated for this session. The ID will then be used in all the
> following commands.
>
> - USBAUTH_CMD_GEN_NONCE
>
> Kernel then asks for a nonce generation in order to challenge the device
> using the `USBAUTH_GEN_NONCE` netlink command.
>
> - USBAUTH_CMD_RESP_GEN_NONCE
>
> When the nonce has been generated by the policy engine it is sent back
> to the kernel using the `USBAUTH_CMD_RESP_GEN_NONCE` netlink command.
>
> - USBAUTH_CMD_CHECK_CHALL
>
> Once the kernel has received a device challenge response, it forwards
> the response to the policy engine for validation using the
> `USBAUTH_CMD_CHECK_CHALL` netlink command.
>
> - USBAUTH_CMD_RESP_CHECK_CHALL
>
> The policy engine then verifies the challenge and replies its decision
> to the kernel using the `USBAUTH_CMD_RESP_CHECK_CHALL` netlink command.
>
> - USBAUTH_CMD_REMOVE_DEV
> - USBAUTH_CMD_RESP_REMOVE_DEV
>
> Those two commands have been provionned but have not been implemented yet=
.
> If at any time, the policy engine wants to remove the trust in a device,
> then the `USBAUTH_CMD_REMOVE_DEV` would to be sent, the kernel replies
> with an error status through the `USBAUTH_CMD_RESP_REMOVE_DEV` command.
>
> Co-developed-by: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
> Signed-off-by: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
> Signed-off-by: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
> ---
>  drivers/usb/core/authent_netlink.c        | 1080 +++++++++++++++++++++++=
++++++
>  drivers/usb/core/authent_netlink.h        |  157 +++++
>  include/uapi/linux/usb/usb_auth_netlink.h |   67 ++
>  3 files changed, 1304 insertions(+)
>
> diff --git a/drivers/usb/core/authent_netlink.c b/drivers/usb/core/authen=
t_netlink.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..d53a220c762ffc1bd9aeb95bf=
90dc0dd79c43f09
> --- /dev/null
> +++ b/drivers/usb/core/authent_netlink.c
> @@ -0,0 +1,1080 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * SPDX-FileCopyrightText: (C) 2025 ANSSI
> + *
> + * USB Authentication netlink interface
> + *
> + * Author: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
> + * Author: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
> + *
> + */
> +
> +#include <linux/sched.h>
> +#include <linux/time.h>
> +#include <linux/delay.h>
> +#include <linux/slab.h>
> +#include <linux/mutex.h>
> +#include <linux/err.h>
> +#include <linux/capability.h>
> +
> +#include <net/genetlink.h>
> +
> +#include <uapi/linux/usb/usb_auth_netlink.h>
> +
> +#include "authent_netlink.h"
> +
> +#define WAIT_USERSPACE_TIMEOUT 30
> +#define WAIT_RESPONSE_TIMEOUT 300
> +#define USB_AUTH_MAX_RESP_SIZE 128
> +
> +/**
> + * Define an outstanding request between the kernel and userspace
> + */
> +struct usb_auth_req {
> +       uint8_t used; /**< 1 if the slot is currently used, access must b=
e protected */
> +       uint8_t done; /**< 1 if the response has been received, used as w=
ait condition */
> +       uint8_t error; /**< userspace response error code */
> +       uint8_t resp[USB_AUTH_MAX_RESP_SIZE]; /**< arbitrary response buf=
fer */
> +};
> +
> +static struct genl_family usbauth_genl_fam;
> +
> +// TODO: add mutex for PID access
> +static u32 pol_eng_pid;
> +static struct net *pol_eng_net;
> +
> +static wait_queue_head_t usb_req_wq;
> +
> +#define USB_AUTH_MAX_OUTSTANDING_REQS 10
> +// Mutex is used to protect access to the `used` field
> +DEFINE_MUTEX(usb_auth_reqs_mutex);
> +static struct usb_auth_req usb_auth_outstanding_reqs[USB_AUTH_MAX_OUTSTA=
NDING_REQS];

Wonder, if hot-plugged low-speed hubs may exhaust the table and block every
other device for 5 min (according to the timeouts in this patch).

With the array hard-capped at 10, the 11-th concurrent device gets -EXFULL
and stalls enumeration. The capacity must become dynamic (e.g. xarray/idr)
or requests must be queued instead of rejected (?). IDR is deprecated,
though is used in drivers/usb.

> +
> +////////////////////////////////////////////////////////////////////////=
////////
> +// USB request utilities
> +////////////////////////////////////////////////////////////////////////=
////////
> +
> +/**
> + * @brief Find the first available slot in the outstanding requests arra=
y and
> + *  reserve it.
> + *
> + * CAUTION: this function will block on the request list mutex
> + *
> + * Possible error codes:
> + *  - EXFULL : too many outstanding requests already
> + *
> + * @param [out] index : reserved slot index, valid if return equals 0
> + *
> + * @return 0 on SUCCESS or error code
> + */
> +static int usb_auth_get_reqs_slot(uint32_t *index)
> +{
> +       int ret =3D -EXFULL;
> +       uint32_t i =3D 0;
> +
> +       mutex_lock(&usb_auth_reqs_mutex);
> +
> +       // Take the first available slot
> +       for (i =3D 0; i < USB_AUTH_MAX_OUTSTANDING_REQS; i++) {
> +               if (usb_auth_outstanding_reqs[i].used =3D=3D 0) {
> +                       usb_auth_outstanding_reqs[i].used =3D 1;
> +                       usb_auth_outstanding_reqs[i].done =3D 0;
> +                       usb_auth_outstanding_reqs[i].error =3D USBAUTH_OK=
;
> +                       memset(usb_auth_outstanding_reqs[i].resp, 0,
> +                              USB_AUTH_MAX_RESP_SIZE);
> +                       *index =3D i;
> +                       ret =3D 0;
> +                       break;
> +               }
> +       }
> +
> +       mutex_unlock(&usb_auth_reqs_mutex);
> +
> +       return ret;
> +}
> +
> +/**
> + * @brief release a request slot
> + *
> + * CAUTION: this function will block on the request list mutex
> + *
> + * @param [in] index : slot index to be released
> + */
> +static void usb_auth_release_reqs_slot(const uint32_t index)
> +{
> +       mutex_lock(&usb_auth_reqs_mutex);
> +
> +       usb_auth_outstanding_reqs[index].used =3D 0;
> +
> +       mutex_unlock(&usb_auth_reqs_mutex);
> +}
> +
> +////////////////////////////////////////////////////////////////////////=
////////
> +// Generic netlink socket utilities
> +////////////////////////////////////////////////////////////////////////=
////////
> +
> +/**
> + * @brief Handle a registration request from userspace
> + *
> + * It will overwrite the current userspace registered PID with the one p=
rovided
> + *  in the request
> + */
> +static int usb_auth_register_req_doit(struct sk_buff *skb, struct genl_i=
nfo *info)
> +{
> +       int ret =3D 0;
> +       void *hdr =3D NULL;
> +       struct sk_buff *msg =3D NULL;
> +
> +       pr_info("message received\n");
> +
> +       if (!capable(CAP_SYS_ADMIN)) {
> +               pr_err("invalid permissions\n");
> +               return -EPERM;
> +       }
> +
> +       // Register Policy engine PID, overwrite value if already set
> +       pol_eng_pid =3D info->snd_portid;

info->snd_portid is the per-net-ns socket port ID of the sender.
Any later caller, inside the same or a different network namespace
simply replaces the old value. Can we reject the second registration?

capable(CAP_SYS_ADMIN) succeeds in any user-namespace where the task
has that bit set. A container root therefore passes the check and can
issue USBAUTH_CMD_REGISTER, hijacking the channel.

> +       pol_eng_net =3D genl_info_net(info);

Similarly, if that sender lives in a container=E2=80=99s net-namespace, pol=
_eng_net
now points there.

> +
> +       wake_up_all(&usb_req_wq);
> +
> +       msg =3D nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_KERNEL);
> +       if (msg =3D=3D NULL) {
> +               pr_err("failed to allocate message buffer\n");
> +               return -ENOMEM;
> +       }
> +
> +       hdr =3D genlmsg_put(msg, info->snd_portid, info->snd_seq,
> +                         &usbauth_genl_fam, 0, USBAUTH_CMD_REGISTER);
> +       if (hdr =3D=3D NULL) {
> +               pr_err("failed to create genetlink header\n");
> +               nlmsg_free(msg);
> +               return -EMSGSIZE;
> +       }
> +
> +       genlmsg_end(msg, hdr);
> +
> +       ret =3D genlmsg_reply(msg, info);
> +
> +       pr_info("reply sent\n");
> +
> +       return ret;
> +}
> +
> +/**
> + * @brief Handle a CHECK_DIGEST response from userspace
> + *
> + * The response must contain:
> + *  - USBAUTH_A_REQ_ID
> + *  - USBAUTH_A_ERROR_CODE
> + *  - USBAUTH_A_DEV_ID
> + *  - USBAUTH_A_KNOWN
> + *  - USBAUTH_A_BLOCKED
> + *
> + */
> +static int usb_auth_digest_resp_doit(struct sk_buff *skb, struct genl_in=
fo *info)
> +{
> +       uint32_t index =3D 0;
> +
> +       pr_info("message received\n");
> +
> +       if (!capable(CAP_SYS_ADMIN)) {
> +               pr_err("invalid permissions\n");
> +               return -EPERM;
> +       }
> +
> +       if (!info->attrs[USBAUTH_A_REQ_ID]) {
> +               pr_err("digest_resp_doit: invalid response: no req ID\n")=
;
> +               return -EINVAL;
> +       }
> +
> +       index =3D nla_get_u32(info->attrs[USBAUTH_A_REQ_ID]);
> +
> +       // Test for error
> +       if (!info->attrs[USBAUTH_A_ERROR_CODE]) {
> +               pr_err("digest_resp_doit: invalid response: missing attri=
butes\n");
> +               usb_auth_outstanding_reqs[index].error =3D USBAUTH_INVRES=
P;
> +               usb_auth_outstanding_reqs[index].done =3D 1;
> +               return -EINVAL;
> +       }
> +
> +       usb_auth_outstanding_reqs[index].error =3D
> +               nla_get_u8(info->attrs[USBAUTH_A_ERROR_CODE]);

AFAIK, `usb_auth_outstanding_reqs` fields `done/error/resp[]` are not prote=
cted
by the mutex that guards used. `usb_auth_reqs_mutex` is not held in
either place.
Potential race between any *_resp_doit() writer and the reader
in the matching usb_policy_engine_*() helper.

Perhaps, you can replace `error, resp[], done` by a single
`struct completion`, plus a private response struct that the reader accesse=
s
only after some `complete()`.

> +
> +       if (usb_auth_outstanding_reqs[index].error !=3D USBAUTH_OK) {
> +               pr_err("digest_resp_doit: response error\n");
> +               usb_auth_outstanding_reqs[index].done =3D 1;
> +               return -EINVAL;
> +       }
> +
> +       if (!info->attrs[USBAUTH_A_DEV_ID] || !info->attrs[USBAUTH_A_KNOW=
N] ||
> +           !info->attrs[USBAUTH_A_BLOCKED]) {
> +               pr_err("digest_resp_doit: invalid response: missing attri=
butes\n");
> +               usb_auth_outstanding_reqs[index].error =3D USBAUTH_INVRES=
P;
> +               usb_auth_outstanding_reqs[index].done =3D 1;
> +               return -EINVAL;
> +       }
> +
> +       usb_auth_outstanding_reqs[index].resp[0] =3D
> +               nla_get_u8(info->attrs[USBAUTH_A_KNOWN]);
> +       usb_auth_outstanding_reqs[index].resp[1] =3D
> +               nla_get_u8(info->attrs[USBAUTH_A_BLOCKED]);
> +       ((uint32_t *)usb_auth_outstanding_reqs[index].resp + 2)[0] =3D
> +               nla_get_u32(info->attrs[USBAUTH_A_DEV_ID]);
> +
> +       usb_auth_outstanding_reqs[index].done =3D 1;
> +
> +       wake_up_all(&usb_req_wq);
> +
> +       return 0;
> +}
> +
> +/**
> + * @brief Handle a CHECK_CERTIFICATE response from userspace
> + *
> + * The response must contain:
> + *  - USBAUTH_A_REQ_ID
> + *  - USBAUTH_A_ERROR_CODE
> + *  - USBAUTH_A_VALID
> + *  - USBAUTH_A_BLOCKED
> + *  - USBAUTH_A_DEV_ID
> + *
> + */
> +static int usb_auth_cert_resp_doit(struct sk_buff *skb, struct genl_info=
 *info)
> +{
> +       uint32_t index =3D 0;
> +
> +       pr_info("message received\n");
> +
> +       if (!capable(CAP_SYS_ADMIN)) {
> +               pr_err("invalid permissions\n");
> +               return -EPERM;
> +       }
> +
> +       if (!info->attrs[USBAUTH_A_REQ_ID]) {
> +               pr_err("invalid response: no req ID\n");
> +               return -EINVAL;
> +       }
> +
> +       index =3D nla_get_u32(info->attrs[USBAUTH_A_REQ_ID]);
> +
> +       // Test for error
> +       if (!info->attrs[USBAUTH_A_ERROR_CODE]) {
> +               pr_err("invalid response: missing attributes\n");
> +               usb_auth_outstanding_reqs[index].error =3D USBAUTH_INVRES=
P;
> +               usb_auth_outstanding_reqs[index].done =3D 1;
> +               return -EINVAL;
> +       }
> +
> +       usb_auth_outstanding_reqs[index].error =3D
> +               nla_get_u8(info->attrs[USBAUTH_A_ERROR_CODE]);
> +
> +       if (usb_auth_outstanding_reqs[index].error !=3D USBAUTH_OK) {
> +               pr_err("response error\n");
> +               usb_auth_outstanding_reqs[index].done =3D 1;
> +               return -EINVAL;
> +       }
> +
> +       if (!info->attrs[USBAUTH_A_DEV_ID] || !info->attrs[USBAUTH_A_VALI=
D] ||
> +           !info->attrs[USBAUTH_A_BLOCKED]) {
> +               pr_err("invalid response: missing attributes\n");
> +               usb_auth_outstanding_reqs[index].done =3D 1;
> +               usb_auth_outstanding_reqs[index].error =3D USBAUTH_INVRES=
P;
> +               return -EINVAL;
> +       }
> +
> +       usb_auth_outstanding_reqs[index].resp[0] =3D
> +               nla_get_u8(info->attrs[USBAUTH_A_VALID]);
> +       usb_auth_outstanding_reqs[index].resp[1] =3D
> +               nla_get_u8(info->attrs[USBAUTH_A_BLOCKED]);
> +       ((uint32_t *)usb_auth_outstanding_reqs[index].resp + 2)[0] =3D
> +               nla_get_u32(info->attrs[USBAUTH_A_DEV_ID]);
> +
> +       usb_auth_outstanding_reqs[index].done =3D 1;
> +
> +       wake_up_all(&usb_req_wq);
> +
> +       return 0;
> +}
> +
> +/**
> + * @brief Handle a REMOVE_DEV response from userspace
> + *
> + * The response must contain:
> + *  - USBAUTH_A_REQ_ID
> + *  - USBAUTH_A_ERROR_CODE
> + *  - USBAUTH_A_VALID
> + *
> + */
> +static int usb_auth_remove_dev_doit(struct sk_buff *skb, struct genl_inf=
o *info)
> +{
> +       uint32_t index =3D 0;
> +
> +       pr_info("message received\n");
> +
> +       if (!capable(CAP_SYS_ADMIN)) {
> +               pr_err("invalid permissions\n");
> +               return -EPERM;
> +       }
> +
> +       if (!info->attrs[USBAUTH_A_REQ_ID]) {
> +               pr_err("invalid response: no req ID\n");
> +               return -EINVAL;
> +       }
> +
> +       index =3D nla_get_u32(info->attrs[USBAUTH_A_REQ_ID]);
> +
> +       // Test for error
> +       if (!info->attrs[USBAUTH_A_ERROR_CODE]) {
> +               pr_err("invalid response: missing attributes\n");
> +               usb_auth_outstanding_reqs[index].error =3D USBAUTH_INVRES=
P;
> +               usb_auth_outstanding_reqs[index].done =3D 1;
> +               return -EINVAL;
> +       }
> +
> +       usb_auth_outstanding_reqs[index].error =3D
> +               nla_get_u8(info->attrs[USBAUTH_A_ERROR_CODE]);
> +
> +       if (usb_auth_outstanding_reqs[index].error !=3D USBAUTH_OK) {
> +               pr_err("response error\n");
> +               usb_auth_outstanding_reqs[index].done =3D 1;
> +               return -EINVAL;
> +       }
> +
> +       if (!info->attrs[USBAUTH_A_VALID]) {
> +               pr_err("invalid response: missing attributes\n");
> +               usb_auth_outstanding_reqs[index].error =3D USBAUTH_INVRES=
P;
> +               usb_auth_outstanding_reqs[index].done =3D 1;
> +               return -EINVAL;
> +       }
> +
> +       usb_auth_outstanding_reqs[index].resp[0] =3D
> +               nla_get_u8(info->attrs[USBAUTH_A_VALID]);
> +
> +       usb_auth_outstanding_reqs[index].done =3D 1;
> +
> +       wake_up_all(&usb_req_wq);
> +
> +       return 0;
> +}
> +
> +/**
> + * @brief Handle a GEN_NONCE response from userspace
> + *
> + * The response must contain:
> + *  - USBAUTH_A_REQ_ID
> + *  - USBAUTH_A_ERROR_CODE
> + *  - USBAUTH_A_NONCE
> + *
> + */
> +static int usb_auth_gen_nonce_doit(struct sk_buff *skb, struct genl_info=
 *info)
> +{
> +       uint32_t index =3D 0;
> +
> +       pr_info("message received\n");
> +
> +       if (!capable(CAP_SYS_ADMIN)) {
> +               pr_err("invalid permissions\n");
> +               return -EPERM;
> +       }
> +
> +       if (!info->attrs[USBAUTH_A_REQ_ID]) {
> +               pr_err("invalid response: no req ID\n");
> +               return -EINVAL;
> +       }
> +
> +       index =3D nla_get_u32(info->attrs[USBAUTH_A_REQ_ID]);
> +
> +       // Test for error
> +       if (!info->attrs[USBAUTH_A_ERROR_CODE]) {
> +               pr_err("invalid response: missing attributes\n");
> +               usb_auth_outstanding_reqs[index].error =3D USBAUTH_INVRES=
P;
> +               usb_auth_outstanding_reqs[index].done =3D 1;
> +               return -EINVAL;
> +       }
> +
> +       usb_auth_outstanding_reqs[index].error =3D
> +               nla_get_u8(info->attrs[USBAUTH_A_ERROR_CODE]);
> +
> +       if (usb_auth_outstanding_reqs[index].error !=3D USBAUTH_OK) {
> +               pr_err("response error\n");
> +               usb_auth_outstanding_reqs[index].done =3D 1;
> +               return -EINVAL;
> +       }
> +
> +       if (!info->attrs[USBAUTH_A_NONCE]) {
> +               pr_err("invalid response: missing attributes\n");
> +               usb_auth_outstanding_reqs[index].error =3D USBAUTH_INVRES=
P;
> +               usb_auth_outstanding_reqs[index].done =3D 1;
> +               return -EINVAL;
> +       }
> +
> +       nla_memcpy(usb_auth_outstanding_reqs[index].resp, info->attrs[USB=
AUTH_A_NONCE], 32);
> +
> +       usb_auth_outstanding_reqs[index].done =3D 1;
> +
> +       wake_up_all(&usb_req_wq);
> +
> +       return 0;
> +}
> +
> +/**
> + * @brief Handle a CHECK_CHALL response from userspace
> + *
> + * The response must contain:
> + *  - USBAUTH_A_REQ_ID
> + *  - USBAUTH_A_ERROR_CODE
> + *  - USBAUTH_A_VALID
> + *
> + */
> +static int usb_auth_check_chall_doit(struct sk_buff *skb, struct genl_in=
fo *info)
> +{
> +       uint32_t index =3D 0;
> +
> +       pr_info("message received\n");
> +
> +       if (!capable(CAP_SYS_ADMIN)) {
> +               pr_err("invalid permissions\n");
> +               return -EPERM;
> +       }
> +
> +       if (!info->attrs[USBAUTH_A_REQ_ID]) {
> +               pr_err("invalid response: no req ID\n");
> +               return -EINVAL;
> +       }
> +
> +       index =3D nla_get_u32(info->attrs[USBAUTH_A_REQ_ID]);
> +
> +       // Test for error
> +       if (!info->attrs[USBAUTH_A_ERROR_CODE]) {
> +               pr_err("invalid response: missing attributes\n");
> +               usb_auth_outstanding_reqs[index].error =3D USBAUTH_INVRES=
P;
> +               usb_auth_outstanding_reqs[index].done =3D 1;
> +               return -EINVAL;
> +       }
> +
> +       usb_auth_outstanding_reqs[index].error =3D
> +               nla_get_u8(info->attrs[USBAUTH_A_ERROR_CODE]);
> +
> +       if (usb_auth_outstanding_reqs[index].error !=3D USBAUTH_OK) {
> +               pr_err("response error\n");
> +               usb_auth_outstanding_reqs[index].done =3D 1;
> +               return -EINVAL;
> +       }
> +
> +       if (!info->attrs[USBAUTH_A_VALID]) {
> +               pr_err("invalid response: missing attributes\n");
> +               usb_auth_outstanding_reqs[index].error =3D USBAUTH_INVRES=
P;
> +               usb_auth_outstanding_reqs[index].done =3D 1;
> +               return -EINVAL;
> +       }
> +
> +       usb_auth_outstanding_reqs[index].resp[0] =3D
> +               nla_get_u8(info->attrs[USBAUTH_A_VALID]);
> +
> +       usb_auth_outstanding_reqs[index].done =3D 1;
> +
> +       wake_up_all(&usb_req_wq);
> +
> +       return 0;
> +}
> +
> +/* Attribute validation policy */
> +static struct nla_policy usbauth_attr_pol[USBAUTH_A_MAX + 1] =3D {
> +       [USBAUTH_A_REQ_ID]  =3D {.type =3D NLA_U32,},
> +       [USBAUTH_A_DEV_ID]  =3D {.type =3D NLA_U32,},
> +       [USBAUTH_A_DIGEST] =3D {.type =3D NLA_UNSPEC, .len =3D 32,},
> +       [USBAUTH_A_DIGESTS] =3D {.type =3D NLA_UNSPEC, .len =3D 256,},
> +       [USBAUTH_A_SLOT_MASK]  =3D {.type =3D NLA_U8,},
> +       [USBAUTH_A_KNOWN]  =3D {.type =3D NLA_U8,},
> +       [USBAUTH_A_BLOCKED]  =3D {.type =3D NLA_U8,},
> +       [USBAUTH_A_VALID]  =3D {.type =3D NLA_U8,},
> +       [USBAUTH_A_CERTIFICATE] =3D {.type =3D NLA_UNSPEC, .max =3D 4096,=
},
> +       [USBAUTH_A_CERT_LEN] =3D {.type =3D NLA_U32},
> +       [USBAUTH_A_ROUTE] =3D {.type =3D NLA_U32},
> +       [USBAUTH_A_NONCE] =3D {.type =3D NLA_BINARY, .len =3D 32,},
> +       [USBAUTH_A_CHALL] =3D {.type =3D NLA_UNSPEC, .len =3D 204,},
> +       [USBAUTH_A_DESCRIPTOR] =3D {.type =3D NLA_UNSPEC, .len =3D USBAUT=
H_MAX_DESC_SIZE},
> +       [USBAUTH_A_BOS] =3D {.type =3D NLA_UNSPEC, .len =3D USBAUTH_MAX_B=
OS_SIZE},
> +       [USBAUTH_A_ERROR_CODE] =3D {.type =3D NLA_U8},
> +};
> +
> +/* Operations */
> +static struct genl_ops usbauth_genl_ops[] =3D {
> +       {
> +               .cmd =3D USBAUTH_CMD_REGISTER,
> +               .policy =3D usbauth_attr_pol,
> +               .doit =3D usb_auth_register_req_doit,
> +       },
> +       {
> +               .cmd =3D USBAUTH_CMD_RESP_DIGEST,
> +               .policy =3D usbauth_attr_pol,
> +               .doit =3D usb_auth_digest_resp_doit,
> +       },
> +       {
> +               .cmd =3D USBAUTH_CMD_RESP_CERTIFICATE,
> +               .policy =3D usbauth_attr_pol,
> +               .doit =3D usb_auth_cert_resp_doit,
> +       },
> +       {
> +               .cmd =3D USBAUTH_CMD_RESP_REMOVE_DEV,
> +               .policy =3D usbauth_attr_pol,
> +               .doit =3D usb_auth_remove_dev_doit,
> +       },
> +       {
> +               .cmd =3D USBAUTH_CMD_RESP_GEN_NONCE,
> +               .policy =3D usbauth_attr_pol,
> +               .doit =3D usb_auth_gen_nonce_doit,
> +       },
> +       {
> +               .cmd =3D USBAUTH_CMD_RESP_CHECK_CHALL,
> +               .policy =3D usbauth_attr_pol,
> +               .doit =3D usb_auth_check_chall_doit,
> +       }
> +};
> +
> +/* USB Authentication netlink family definition */
> +static struct genl_family usbauth_genl_fam =3D {
> +       .name =3D USBAUTH_GENL_NAME,
> +       .version =3D USBAUTH_GENL_VERSION,
> +       .maxattr =3D USBAUTH_A_MAX,
> +       .ops =3D usbauth_genl_ops,
> +       .n_ops =3D ARRAY_SIZE(usbauth_genl_ops),
> +       .mcgrps =3D NULL,
> +       .n_mcgrps =3D 0,
> +};
> +
> +int usb_auth_init_netlink(void)
> +{
> +       int ret =3D 0;
> +       uint8_t i =3D 0;
> +
> +       for (i =3D 0; i < USB_AUTH_MAX_OUTSTANDING_REQS; i++)
> +               usb_auth_outstanding_reqs[i].used =3D 0;
> +
> +       init_waitqueue_head(&usb_req_wq);
> +
> +       ret =3D genl_register_family(&usbauth_genl_fam);
> +       if (unlikely(ret)) {
> +               pr_err("failed to init netlink: %d\n",
> +                      ret);
> +               return ret;
> +       }
> +
> +       pr_info("initialized\n");
> +
> +       return ret;
> +}
> +
> +////////////////////////////////////////////////////////////////////////=
////////
> +// Policy engine API
> +////////////////////////////////////////////////////////////////////////=
////////
> +
> +int usb_policy_engine_check_digest(const uint32_t route, const uint8_t *=
const digests,
> +       const uint8_t mask, uint8_t *is_known, uint8_t *is_blocked, uint3=
2_t *id)
> +{
> +       int ret =3D -1;
> +       void *hdr =3D NULL;
> +       struct sk_buff *skb =3D NULL;
> +       uint32_t index =3D 0;
> +
> +       if (digests =3D=3D NULL) {
> +               pr_err("invalid inputs\n");
> +               return -EINVAL;
> +       }
> +
> +       // Arbitrary 30s wait before giving up
> +       if (!wait_event_timeout(usb_req_wq, pol_eng_pid !=3D 0, HZ * WAIT=
_USERSPACE_TIMEOUT)) {

WAIT_USERSPACE_TIMEOUT is 30 sec and WAIT_RESPONSE_TIMEOUT is 5 min.
Can we keep a modest deadline, e.g. 5 sec for daemon presence and
10 sec for its reply, or something similar that makes sense?

> +               pr_err("userspace not available\n");
> +               return -ECOMM;
> +       }
> +
> +       pr_info("got connection to userspace\n");
> +
> +       // Get a slot in the outstanding request list
> +       if (usb_auth_get_reqs_slot(&index)) {
> +               pr_err("failed to get request slot\n");
> +               return -ECOMM;
> +       }
> +       pr_info("got request slot\n");
> +
> +       // Create digests check request
> +       skb =3D genlmsg_new(NLMSG_DEFAULT_SIZE, GFP_KERNEL);
> +       if (skb =3D=3D NULL) {
> +               pr_err("failed to allocated buffer\n");
> +               return -ENOMEM;
> +       }
> +
> +       hdr =3D genlmsg_put(skb, 0, 0, &usbauth_genl_fam, 0,
> +                         USBAUTH_CMD_CHECK_DIGEST);
> +       if (unlikely(hdr =3D=3D NULL)) {
> +               pr_err("failed to place header\n");
> +               nlmsg_free(skb);
> +               return -ENOMEM;
> +       }
> +
> +       ret =3D nla_put_u32(skb, USBAUTH_A_REQ_ID, index);
> +       if (ret) {
> +               pr_err("failed to place req ID\n");
> +               genlmsg_cancel(skb, hdr);
> +               nlmsg_free(skb);
> +               return ret;
> +       }
> +
> +       ret =3D nla_put_u32(skb, USBAUTH_A_ROUTE, route);
> +       if (ret) {
> +               pr_err("failed to place route\n");
> +               genlmsg_cancel(skb, hdr);
> +               nlmsg_free(skb);
> +               return ret;
> +       }
> +
> +       ret =3D nla_put(skb, USBAUTH_A_DIGESTS, 260, digests);

Attribute is declared as 256 in the policy
        (usbauth_attr_pol[USBAUTH_A_DIGESTS].len =3D 256
but you emit 260 here. Is it wrong or where do 4 bytes come from?

> +       if (ret) {
> +               pr_err("failed to place digests\n");
> +               genlmsg_cancel(skb, hdr);
> +               nlmsg_free(skb);
> +               return ret;
> +       }
> +
> +       ret =3D nla_put_u8(skb, USBAUTH_A_SLOT_MASK, mask);
> +       if (ret) {
> +               pr_err("failed to place slot mask\n");
> +               genlmsg_cancel(skb, hdr);
> +               nlmsg_free(skb);
> +               return ret;
> +       }
> +
> +       genlmsg_end(skb, hdr);
> +
> +       // Send message to userspace
> +       ret =3D genlmsg_unicast(pol_eng_net, skb, pol_eng_pid);
> +       if (ret !=3D 0) {
> +               pr_err("failed to send message: %d\n",
> +                      ret);
> +               return -ECOMM;
> +       }
> +       pr_info("sent CHECK_DIGEST request\n");
> +
> +       // Wait for userspace response
> +       // Arbitrary 5 min wait before giving up
> +       if (!wait_event_timeout(usb_req_wq,
> +                               usb_auth_outstanding_reqs[index].done =3D=
=3D 1,
> +                               HZ * WAIT_RESPONSE_TIMEOUT)) {
> +               pr_err("userspace response not available\n");
> +               usb_auth_release_reqs_slot(index);

Here we have 5 min enumeration stall while holding usb_lock_device().
Can we replace the blocking helper with a work-queue item?
So we could have pushed to the work and continue enumeration.

        struct usb_auth_work {
                struct work_struct work;
                struct usb_device *udev;
                /* request-specific data */
        };

> +               return -ECOMM;
> +       }
> +
> +       pr_info("received CHECK_DIGEST response\n");
> +
> +       // Get response
> +       if (usb_auth_outstanding_reqs[index].error =3D=3D USBAUTH_INVRESP=
) {
> +               pr_err("userspace response error: %d\n",
> +                       usb_auth_outstanding_reqs[index].error);
> +               usb_auth_release_reqs_slot(index);
> +               return -ECOMM;
> +       }
> +
> +       *is_known =3D usb_auth_outstanding_reqs[index].resp[0];
> +       *is_blocked =3D usb_auth_outstanding_reqs[index].resp[1];
> +       *id =3D ((uint32_t *)usb_auth_outstanding_reqs[index].resp + 2)[0=
];
> +
> +       // Release request slot
> +       usb_auth_release_reqs_slot(index);
> +
> +       return 0;
> +}
> +
> +int usb_policy_engine_check_cert_chain(const uint32_t route,
> +       const uint8_t *const digest, const uint8_t *const chain,
> +       const size_t chain_len, uint8_t *is_valid, uint8_t *is_blocked, u=
int32_t *id)
> +{
> +       int ret =3D -1;
> +       void *hdr =3D NULL;
> +       struct sk_buff *skb =3D NULL;
> +       uint32_t index =3D 0;
> +
> +       if (chain =3D=3D NULL || chain_len > 4096 || digest =3D=3D NULL) =
{
> +               pr_err("invalid inputs\n");
> +               return -EINVAL;
> +       }
> +
> +       // Arbitrary 30s wait before giving up
> +       if (!wait_event_timeout(usb_req_wq, pol_eng_pid !=3D 0, HZ * WAIT=
_USERSPACE_TIMEOUT)) {
> +               pr_err("userspace not available\n");
> +               return -ECOMM;
> +       }
> +
> +       pr_info("got connection to userspace\n");
> +
> +       // Get a slot in the outstanding request list
> +       if (usb_auth_get_reqs_slot(&index)) {
> +               pr_err("failed to get request slot\n");
> +               return -ECOMM;
> +       }
> +       pr_info("got request slot\n");
> +
> +       // Create digest check request
> +       skb =3D genlmsg_new(NLMSG_DEFAULT_SIZE, GFP_KERNEL);
> +       if (skb =3D=3D NULL) {
> +               pr_err("failed to allocated buffer\n");
> +               return -ENOMEM;
> +       }
> +
> +       hdr =3D genlmsg_put(skb, 0, 0, &usbauth_genl_fam, 0,
> +               USBAUTH_CMD_CHECK_CERTIFICATE);
> +       if (unlikely(hdr =3D=3D NULL)) {
> +               pr_err("failed to place header\n");
> +               nlmsg_free(skb);
> +               return -ENOMEM;
> +       }
> +
> +       ret =3D nla_put_u32(skb, USBAUTH_A_REQ_ID, index);
> +       if (ret) {
> +               pr_err("failed to place req ID\n");
> +               genlmsg_cancel(skb, hdr);
> +               nlmsg_free(skb);
> +               return ret;
> +       }
> +
> +       ret =3D nla_put_u32(skb, USBAUTH_A_ROUTE, route);
> +       if (ret) {
> +               pr_err("failed to place route\n");
> +               genlmsg_cancel(skb, hdr);
> +               nlmsg_free(skb);
> +               return ret;
> +       }
> +
> +       ret =3D nla_put(skb, USBAUTH_A_DIGEST, 32, digest);
> +       if (ret) {
> +               pr_err("failed to place digest\n");
> +               genlmsg_cancel(skb, hdr);
> +               nlmsg_free(skb);
> +               return ret;
> +       }
> +
> +       ret =3D nla_put(skb, USBAUTH_A_CERTIFICATE, chain_len, chain);
> +       if (ret) {
> +               pr_err("failed to place certificate\n");
> +               genlmsg_cancel(skb, hdr);
> +               nlmsg_free(skb);
> +               return ret;
> +       }
> +
> +       ret =3D nla_put_u32(skb, USBAUTH_A_CERT_LEN, chain_len);
> +       if (ret) {
> +               pr_err("failed to place chain length\n");
> +               genlmsg_cancel(skb, hdr);
> +               nlmsg_free(skb);
> +               return ret;
> +       }
> +
> +       genlmsg_end(skb, hdr);
> +
> +       // Send message to userspace
> +       ret =3D genlmsg_unicast(pol_eng_net, skb, pol_eng_pid);
> +       if (ret !=3D 0) {
> +               pr_err("failed to send message: %d\n",
> +                      ret);
> +               return -ECOMM;
> +       }
> +       pr_info("sent CHECK_CERTIFICATE request\n");
> +
> +       // Wait for userspace response
> +       // Arbitrary 5 min wait before giving up
> +       if (!wait_event_timeout(usb_req_wq,
> +                               usb_auth_outstanding_reqs[index].done =3D=
=3D 1,
> +                               HZ * WAIT_RESPONSE_TIMEOUT)) {
> +               pr_err("userspace response not available\n");
> +               usb_auth_release_reqs_slot(index);
> +               return -ECOMM;
> +       }
> +
> +       pr_info("received CHECK_CERTIFICATE response\n");
> +
> +       // Get response
> +       *is_valid =3D usb_auth_outstanding_reqs[index].resp[0];
> +       *is_blocked =3D usb_auth_outstanding_reqs[index].resp[1];
> +       *id =3D ((uint32_t *)usb_auth_outstanding_reqs[index].resp + 2)[0=
];
> +
> +       // Release request slot
> +       usb_auth_release_reqs_slot(index);
> +
> +       return 0;
> +}
> +
> +int usb_policy_engine_remove_dev(const uint32_t id)
> +{
> +       int ret =3D -1;
> +       void *hdr =3D NULL;
> +       struct sk_buff *skb =3D NULL;
> +       uint32_t index =3D 0;
> +
> +       // Arbitrary 30s wait before giving up
> +       if (!wait_event_timeout(usb_req_wq, pol_eng_pid !=3D 0, HZ * WAIT=
_USERSPACE_TIMEOUT)) {
> +               pr_err("userspace not available\n");
> +               return -ECOMM;
> +       }
> +
> +       pr_info("got connection to userspace\n");
> +
> +       // Get a slot in the outstanding request list
> +       if (usb_auth_get_reqs_slot(&index)) {
> +               pr_err("failed to get request slot\n");
> +               return -ECOMM;
> +       }
> +       pr_info("got request slot\n");
> +
> +       // Create digest check request
> +       skb =3D genlmsg_new(NLMSG_DEFAULT_SIZE, GFP_KERNEL);
> +       if (skb =3D=3D NULL) {
> +               pr_err("failed to allocated buffer\n");
> +               return -ENOMEM;
> +       }
> +
> +       hdr =3D genlmsg_put(skb, 0, 0, &usbauth_genl_fam, 0,
> +               USBAUTH_CMD_REMOVE_DEV);
> +       if (unlikely(hdr =3D=3D NULL)) {
> +               pr_err("failed to place header\n");
> +               nlmsg_free(skb);
> +               return -ENOMEM;
> +       }
> +
> +       ret =3D nla_put_u32(skb, USBAUTH_A_REQ_ID, index);
> +       if (ret) {
> +               pr_err("failed to place req ID\n");
> +               genlmsg_cancel(skb, hdr);
> +               nlmsg_free(skb);
> +               return ret;
> +       }
> +
> +       ret =3D nla_put_u32(skb, USBAUTH_A_DEV_ID, id);
> +       if (ret) {
> +               pr_err("failed to place dev ID\n");
> +               genlmsg_cancel(skb, hdr);
> +               nlmsg_free(skb);
> +               return ret;
> +       }
> +
> +       genlmsg_end(skb, hdr);
> +
> +       // Send message to userspace
> +       ret =3D genlmsg_unicast(pol_eng_net, skb, pol_eng_pid);
> +       if (ret !=3D 0) {
> +               pr_err("failed to send message: %d\n",
> +                      ret);
> +               return -ECOMM;
> +       }
> +       pr_info("sent REMOVE_DEV request\n");
> +
> +       // Wait for userspace response
> +       // Arbitrary 5 min wait before giving up
> +       if (!wait_event_timeout(usb_req_wq,
> +                               usb_auth_outstanding_reqs[index].done =3D=
=3D 1,
> +                               HZ * WAIT_RESPONSE_TIMEOUT)) {
> +               pr_err("userspace response not available\n");
> +               usb_auth_release_reqs_slot(index);
> +               return -ECOMM;
> +       }
> +
> +       pr_info("received REMOVE_DEV response\n");
> +
> +       // Release request slot
> +       usb_auth_release_reqs_slot(index);
> +
> +       return 0;
> +}
> +
> +int usb_policy_engine_generate_challenge(const uint32_t id, uint8_t *non=
ce)
> +{
> +       int ret =3D -1;
> +       void *hdr =3D NULL;
> +       struct sk_buff *skb =3D NULL;
> +       uint32_t index =3D 0;
> +
> +       // Arbitrary 30s wait before giving up
> +       if (!wait_event_timeout(usb_req_wq, pol_eng_pid !=3D 0, HZ * WAIT=
_USERSPACE_TIMEOUT)) {
> +               pr_err("userspace not available\n");
> +               return -ECOMM;
> +       }
> +
> +       pr_info("got connection to userspace\n");
> +
> +       // Get a slot in the outstanding request list
> +       if (usb_auth_get_reqs_slot(&index)) {
> +               pr_err("failed to get request slot\n");
> +               return -ECOMM;
> +       }
> +       pr_info("got request slot\n");
> +
> +       // Create digest check request
> +       skb =3D genlmsg_new(NLMSG_DEFAULT_SIZE, GFP_KERNEL);
> +       if (skb =3D=3D NULL) {
> +               pr_err("failed to allocated buffer\n");
> +               return -ENOMEM;
> +       }
> +
> +       hdr =3D genlmsg_put(skb, 0, 0, &usbauth_genl_fam, 0,
> +               USBAUTH_CMD_GEN_NONCE);
> +       if (unlikely(hdr =3D=3D NULL)) {
> +               pr_err("failed to place header\n");
> +               nlmsg_free(skb);
> +               return -ENOMEM;
> +       }
> +
> +       ret =3D nla_put_u32(skb, USBAUTH_A_REQ_ID, index);
> +       if (ret) {
> +               pr_err("failed to place req ID\n");
> +               genlmsg_cancel(skb, hdr);
> +               nlmsg_free(skb);
> +               return ret;
> +       }
> +
> +       ret =3D nla_put_u32(skb, USBAUTH_A_DEV_ID, id);
> +       if (ret) {
> +               pr_err("failed to place dev ID\n");
> +               genlmsg_cancel(skb, hdr);
> +               nlmsg_free(skb);
> +               return ret;
> +       }
> +
> +       genlmsg_end(skb, hdr);
> +
> +       // Send message to userspace
> +       ret =3D genlmsg_unicast(pol_eng_net, skb, pol_eng_pid);
> +       if (ret !=3D 0) {
> +               pr_err("failed to send message: %d\n", ret);
> +               return -ECOMM;
> +       }
> +       pr_info("sent GEN_NONCE request\n");
> +
> +       // Wait for userspace response
> +       // Arbitrary 5 min wait before giving up
> +       if (!wait_event_timeout(usb_req_wq,
> +                               usb_auth_outstanding_reqs[index].done =3D=
=3D 1,
> +                               HZ * WAIT_RESPONSE_TIMEOUT)) {
> +               pr_err("userspace response not available\n");
> +               usb_auth_release_reqs_slot(index);
> +               return -ECOMM;
> +       }
> +
> +       pr_info("received GEN_NONCE response\n");
> +
> +       // Get response
> +       memcpy(nonce, usb_auth_outstanding_reqs[index].resp, 32);
> +
> +       // Release request slot
> +       usb_auth_release_reqs_slot(index);
> +
> +       return 0;
> +}
> +
> +int usb_policy_engine_check_challenge(const uint32_t id,
> +       const uint8_t *const challenge, const uint8_t *const context,
> +       const size_t context_size, uint8_t *is_valid)
> +{
> +       int ret =3D -1;
> +       void *hdr =3D NULL;
> +       struct sk_buff *skb =3D NULL;
> +       uint32_t index =3D 0;
> +
> +       if (unlikely(challenge =3D=3D NULL || context =3D=3D NULL ||
> +             context_size > USBAUTH_MAX_BOS_SIZE)) {
> +               pr_err("invalid inputs\n");
> +               return -EINVAL;
> +       }
> +
> +       // Arbitrary 30s wait before giving up
> +       if (!wait_event_timeout(usb_req_wq, pol_eng_pid !=3D 0, HZ * WAIT=
_USERSPACE_TIMEOUT)) {
> +               pr_err("userspace not available\n");
> +               return -ECOMM;
> +       }
> +
> +       pr_info("got connection to userspace\n");
> +
> +       // Get a slot in the outstanding request list
> +       if (usb_auth_get_reqs_slot(&index)) {
> +               pr_err("failed to get request slot\n");
> +               return -ECOMM;
> +       }
> +       pr_info("got request slot\n");
> +
> +       // Create digest check request
> +       skb =3D genlmsg_new(NLMSG_DEFAULT_SIZE, GFP_KERNEL);
> +       if (skb =3D=3D NULL) {
> +               pr_err("failed to allocated buffer\n");
> +               return -ENOMEM;
> +       }
> +
> +       hdr =3D genlmsg_put(skb, 0, 0, &usbauth_genl_fam, 0,
> +               USBAUTH_CMD_CHECK_CHALL);
> +       if (unlikely(hdr =3D=3D NULL)) {
> +               pr_err("failed to place header\n");
> +               nlmsg_free(skb);
> +               return -ENOMEM;
> +       }
> +
> +       ret =3D nla_put_u32(skb, USBAUTH_A_REQ_ID, index);
> +       if (ret) {
> +               pr_err("failed to place req ID\n");
> +               genlmsg_cancel(skb, hdr);
> +               nlmsg_free(skb);
> +               return ret;
> +       }
> +
> +       ret =3D nla_put(skb, USBAUTH_A_CHALL, 204, challenge);
> +       if (ret) {
> +               pr_err("failed to place challenge\n");
> +               genlmsg_cancel(skb, hdr);
> +               nlmsg_free(skb);
> +               return ret;
> +       }
> +
> +       ret =3D nla_put(skb, USBAUTH_A_DESCRIPTOR, context_size, context)=
;
> +       if (ret) {
> +               pr_err("failed to place descriptor\n");
> +               genlmsg_cancel(skb, hdr);
> +               nlmsg_free(skb);
> +               return ret;
> +       }
> +
> +       ret =3D nla_put_u32(skb, USBAUTH_A_DEV_ID, id);
> +       if (ret) {
> +               pr_err("failed to place dev ID\n");
> +               genlmsg_cancel(skb, hdr);
> +               nlmsg_free(skb);
> +               return ret;
> +       }
> +
> +       genlmsg_end(skb, hdr);
> +
> +       // Send message to userspace
> +       ret =3D genlmsg_unicast(pol_eng_net, skb, pol_eng_pid);
> +       if (ret !=3D 0) {
> +               pr_err("failed to send message: %d\n",
> +                      ret);
> +               return -ECOMM;
> +       }
> +       pr_info("sent CHECK_CHALL request\n");
> +
> +       // Wait for userspace response
> +       // Arbitrary 5 min wait before giving up
> +       if (!wait_event_timeout(usb_req_wq,
> +                               usb_auth_outstanding_reqs[index].done =3D=
=3D 1,
> +                               HZ * WAIT_RESPONSE_TIMEOUT)) {
> +               pr_err("userspace response not available\n");
> +               usb_auth_release_reqs_slot(index);
> +               return -ECOMM;
> +       }
> +
> +       pr_info("received CHECK_CHALL response\n");
> +
> +       // Get response
> +       *is_valid =3D usb_auth_outstanding_reqs[index].resp[0];
> +
> +       // Release request slot
> +       usb_auth_release_reqs_slot(index);
> +
> +       return 0;
> +}
> diff --git a/drivers/usb/core/authent_netlink.h b/drivers/usb/core/authen=
t_netlink.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..504da32547b75b85b4328f3ea=
7df43b0a565dd18
> --- /dev/null
> +++ b/drivers/usb/core/authent_netlink.h
> @@ -0,0 +1,157 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * SPDX-FileCopyrightText: (C) 2025 ANSSI
> + *
> + * USB Authentication netlink interface
> + *
> + * Author: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
> + * Author: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
> + *
> + */
> +
> +#ifndef __USB_CORE_AUTHENT_NETLINK_H_
> +#define __USB_CORE_AUTHENT_NETLINK_H_
> +
> +int usb_auth_init_netlink(void);
> +
> +/**
> + * @brief Check if a digest match a device
> + *
> + * This function blocks until a response has been received from userspac=
e or in
> + * case of timeout.
> + * The function blocks if no policy engine is registered with a timeout.
> + *
> + * Context: task context, might sleep.
> + *
> + * Possible errors:
> + *  - EINVAL   : if digest is NULL
> + *  - ECOMM    : if no userspace policy engine is available
> + *                  or already userspace is busy
> + *                  or message transmission failed
> + *  - ENOMEM   : if message creation failed
> + *  - EMSGSIZE : if message creation failed
> + *
> + * @param [in] digest      : USB Authentication digest, must be 256 B
> + * @param [in] mask        : USB Authentication slot mask
> + * @param [out] is_known   : 1 at each index with a known digest, 0 othe=
rwise
> + * @param [out] is_blocked : 1 if the device is known and banned, 0 othe=
rwise
> + * @param [out] id         : if is_known and !is_blocked then contains t=
he device handle
> + *
> + * @return 0 on SUCCESS else error code
> + */
> +int usb_policy_engine_check_digest(const uint32_t route,
> +                                  const uint8_t *const digests,
> +                                  const uint8_t mask, uint8_t *is_known,
> +                                  uint8_t *is_blocked, uint32_t *id);
> +
> +/**
> + * @brief Check if a certificate chain is valid and authorized
> + *
> + * A certificate chain is valid if it can be successfully verified with =
one of the
> + *  root CA in store.
> + * A certificate chain is blocked if one of the certificate of chain is =
blocked,
> + *  due to revocation, blacklist...
> + *
> + * Context: task context, might sleep.
> + *
> + * Possible errors:
> + *  - EINVAL   : if digest is NULL
> + *  - ECOMM    : if no userspace policy engine is available
> + *                  or already userspace is busy
> + *                  or message transmission failed
> + *  - ENOMEM   : if message creation failed
> + *  - EMSGSIZE : if message creation failed
> + *
> + * TODO: see if it is necessary to have a separate boolean for is_blocke=
d
> + *
> + * @param [in] route        : Information on the device to construct the=
 ID
> + * @param [in] digest       : Digest corresponding to the certificate ch=
ain
> + * @param [in] chain        : Certificate chain to check, at most 4096 b=
ytes
> + * @param [in] chain_length : Certificate chain length
> + * @param [out] is_valid    : 1 if the certificate chain can be validate=
d
> + * @param [out] is_blocked  : 1 if the chain is valid but one of the cer=
tificate is blocked
> + * @param [out] id          : if is_known and !is_blocked then contains =
the device handle
> + *
> + * @return 0 on SUCCESS else -1
> + */
> +int usb_policy_engine_check_cert_chain(const uint32_t route,
> +                                      const uint8_t *const digest,
> +                                      const uint8_t *const chain,
> +                                      const size_t chain_len,
> +                                      uint8_t *is_valid, uint8_t *is_blo=
cked,
> +                                      uint32_t *id);
> +
> +/**
> + * @brief Remove a device from the policy engine
> + *
> + * Context: task context, might sleep.
> + *
> + * Possible errors:
> + *  - EINVAL   : if digest is NULL
> + *  - ECOMM    : if no userspace policy engine is available
> + *                  or already userspace is busy
> + *                  or message transmission failed
> + *  - ENOMEM   : if message creation failed
> + *  - EMSGSIZE : if message creation failed
> + *
> + * @param [in] id : Device handle
> + *
> + * @return 0 on SUCCESS else -1
> + */
> +int usb_policy_engine_remove_dev(const uint32_t id);
> +
> +/**
> + * @brief Generate a nonce for the authentication challenge
> + *
> + * Context: task context, might sleep.
> + *
> + * Possible errors:
> + *  - EINVAL   : if digest is NULL
> + *  - ECOMM    : if no userspace policy engine is available
> + *                  or already userspace is busy
> + *                  or message transmission failed
> + *  - ENOMEM   : if message creation failed
> + *  - EMSGSIZE : if message creation failed
> + *
> + * @param [in] id     : device ID
> + * @param [out] nonce : 32 bytes nonce buffer, caller allocated
> + *
> + * @return 0 on SUCCESS else -1
> + */
> +int usb_policy_engine_generate_challenge(const uint32_t id, uint8_t *non=
ce);
> +
> +/**
> + * @brief Validate the authentication challenge
> + *
> + * Context: task context, might sleep.
> + *
> + * Possible errors:
> + *  - EINVAL   : if challenge, desc or bos is NULL or invalid parameter =
size
> + *  - ECOMM    : if no userspace policy engine is available
> + *                  or already userspace is busy
> + *                  or message transmission failed
> + *  - ENOMEM   : if message creation failed
> + *  - EMSGSIZE : if message creation failed
> + *
> + * Challenge is the concatenation of : message (140B) | signature (64B)
> + *
> + * Check that the response challenge contains the right nonce
> + * Check that the device signature is valid
> + *
> + * @param [in] id : device handle
> + * @param [in] challenge : challenge response, must be 204 bytes
> + * @param [in] desc      : device descriptor
> + * @param [in] desc_size : descriptor size in bytes
> + * @param [in] bos       : device BOS
> + * @param [in] bos_size  : BOS size in bytes
> + * @param [out] is_valid : 1 if the signature is valid, 0 otherwise
> + *
> + * @return 0 on SUCCESS else -1
> + */
> +int usb_policy_engine_check_challenge(const uint32_t id,
> +                                     const uint8_t *const challenge,
> +                                     const uint8_t *const context,
> +                                     const size_t context_size,
> +                                     uint8_t *is_valid);
> +
> +#endif /* __USB_CORE_AUTHENT_NETLINK_H_ */
> diff --git a/include/uapi/linux/usb/usb_auth_netlink.h b/include/uapi/lin=
ux/usb/usb_auth_netlink.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..e5b1e0e130a1ffb320aac4805=
161d579923a5b29
> --- /dev/null
> +++ b/include/uapi/linux/usb/usb_auth_netlink.h
> @@ -0,0 +1,67 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * SPDX-FileCopyrightText: (C) 2025 ANSSI
> + *
> + * USB Authentication netlink interface definitions shared with userspac=
e
> + *
> + * Author: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
> + * Author: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
> + *
> + */
> +
> +#ifndef __USB_AUTHENT_NETLINK_H_
> +#define __USB_AUTHENT_NETLINK_H_
> +
> +#define USBAUTH_GENL_NAME "usb_auth_genl"
> +#define USBAUTH_GENL_VERSION 1
> +
> +/* Attributes */
> +enum usbauth_genl_attrs {
> +       USBAUTH_A_REQ_ID =3D 1,
> +       USBAUTH_A_DEV_ID,
> +       USBAUTH_A_DIGEST,
> +       USBAUTH_A_DIGESTS,
> +       USBAUTH_A_SLOT_MASK,
> +       USBAUTH_A_KNOWN,
> +       USBAUTH_A_BLOCKED,
> +       USBAUTH_A_VALID,
> +       USBAUTH_A_CERTIFICATE,
> +       USBAUTH_A_CERT_LEN,
> +       USBAUTH_A_ROUTE,
> +       USBAUTH_A_NONCE,
> +       USBAUTH_A_CHALL,
> +       USBAUTH_A_DESCRIPTOR,
> +       USBAUTH_A_BOS,
> +       USBAUTH_A_ERROR_CODE,
> +       __USBAUTH_A_MAX,
> +};
> +
> +#define USBAUTH_MAX_DESC_SIZE 1024
> +#define USBAUTH_MAX_BOS_SIZE  1024
> +
> +#define USBAUTH_A_MAX (__USBAUTH_A_MAX - 1)
> +
> +/* Commands */
> +enum usbauth_genl_cmds {
> +       USBAUTH_CMD_REGISTER,
> +       USBAUTH_CMD_CHECK_DIGEST,
> +       USBAUTH_CMD_CHECK_CERTIFICATE,
> +       USBAUTH_CMD_REMOVE_DEV,
> +       USBAUTH_CMD_GEN_NONCE,
> +       USBAUTH_CMD_CHECK_CHALL,
> +       USBAUTH_CMD_RESP_DIGEST,
> +       USBAUTH_CMD_RESP_CERTIFICATE,
> +       USBAUTH_CMD_RESP_CREATE_DEV,
> +       USBAUTH_CMD_RESP_REMOVE_DEV,
> +       USBAUTH_CMD_RESP_GEN_NONCE,
> +       USBAUTH_CMD_RESP_CHECK_CHALL,
> +       __USBAUTH_CMD_MAX,
> +};
> +
> +#define USBAUTH_CMD_MAX (__USBAUTH_CMD_MAX - 1)
> +
> +/* Error codes */
> +#define USBAUTH_OK 0
> +#define USBAUTH_INVRESP 1
> +
> +#endif /* __USB_AUTHENT_NETLINK_H_ */
>
> --
> 2.50.0
>
