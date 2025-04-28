Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B231A072A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 23:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745884079; cv=none; b=JhmP/6gqLBF93x/7fyBjkf1vjYNCaNzNnQlMdN6JEPMhS+9IZ9ilP1IiJZZgfqCd9HYplZBV2XWEg6XKx/prHNrOcKElT1g0nx15yJ64HdSo3MPnTPxLZWC9q8/vrNs5UWcWOtLPIJKB1jd8iGXc4Cd1IYVm4FHNDizRWRspCuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745884079; c=relaxed/simple;
	bh=WZj44QHQBnk6/jl3xb6TT+AiJGLpd1Hrwoo45YNQDy0=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FCVMrQrOblfpbauH3R9JRuRD/HJ+9+BYwWg8kwsmg480jLw83bnSGYz0MUaRjRMdYjnNsd876JX8FZ8gmaWa4FGDT2sEmZNglXOBeSlo9+1IgVjKATSny6XHYx52ho7+1aCdGkwCzORrRN+u+R6Cy5Nb9+/qalyS+3T8up4i4tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=a7H/flpV; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a7H/flpV"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c07cd527e4so586658985a.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745884077; x=1746488877; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ak6BhAJ6X0RHy54tG0/xdLDkXO0ZMwVkyD18C7XTCJw=;
        b=a7H/flpVap2HExlt3SXbVZznTZrAdeg9AAZDlh5Eo9+KPK8HjYtwsO5DHT5+2iFX2i
         Lw8Qm+Uoh6rcJMvWpzQ50ZOIN+M33MTOkFLWygCAEhUgLS3T4+6DWA8t/SLCu2b91nD1
         Moy4Y2yHBO0RHgGBCmzFWc+aQMomHOFH1kSeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745884077; x=1746488877;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ak6BhAJ6X0RHy54tG0/xdLDkXO0ZMwVkyD18C7XTCJw=;
        b=DSlb3FvtaI+lOW5atMe7XMxOVnxPEgLxspalNcQ15bFPPV9cvF0EuS/ZeX4p9VCq1q
         JnKk9l1cGcagYkVphWOxCDkVujD4xrPtb+R5XPGDrhUwjmcFf6r9AEgJotaVov8V7lkx
         uym8pAs5nvTs9jmhYn/jbicTsN3bChDbcFr2D24A46Pnf792R/XEPG8pYP/zj8Feu9l9
         WhZMrkeKEJBS5O4gzsaMBJ/1g2j0/utp8leP0791yUm8JjVT/oUBLSn4/KzDth2E1TpA
         P4sa/ZBj/cn+MwNXiU/Bo3xO0Ijd62ESHACG9tIrofvQGA0HqrMlJItYJsq+1aNXsh3Z
         rzRw==
X-Forwarded-Encrypted: i=1; AJvYcCUhY7wqqKsCpYd6Jauk0Jx2D4ohYoXWpredCSR1MwM5qnlCtV+P7bVh/6YCSrsd+ToRx972+MunDekVrgI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBRcIyqyz9Two0BVw+is9PBS8h3gjhsHH+L5IVjyCp+NEfjNXf
	AGI8y92E0iGugD8RHfXc0dgwuNOKD8ZmOQC7DCjOqCrPEB8rsnsiS9+EOf42oQwuoU2KaN6b8st
	XnGLu94BTDkaimkddMVvb/VIsM6/6PfYbGSYbNs4RS+IU8e8=
X-Gm-Gg: ASbGncsAffhxjZD6oCGZ9RvbDqHlHaborRf8s2f/S++bBbYP9xoKRzRvWyThdyr6pGD
	6jWib636hYaYA6NvX17PpvOa9I6FUQALS43fMI+/H5oXX+e1FbWKhBICAfM+r5/Tu0kIlXrYFsd
	ZBBR9BAL2/21SPDhdNEbaSnSOmm0wCOdDO9xm5NiCZHm1uDF+ST5Sqmq0ijpxn
X-Google-Smtp-Source: AGHT+IEOwwLCnV38tgYzdwBpHh/iuQ/Dg5WIoTl/PdYaLVHLxP22Y6T/XnZs7REl2/ug1JMK2C7MjZvEkwHCSYTEpTA=
X-Received: by 2002:a05:620a:d95:b0:7c7:b4de:12f0 with SMTP id
 af79cd13be357-7cabe6042dbmr154141985a.32.1745884076974; Mon, 28 Apr 2025
 16:47:56 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Apr 2025 16:47:56 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Apr 2025 16:47:56 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250422082957.2058229-2-treapking@chromium.org>
References: <20250422082957.2058229-1-treapking@chromium.org> <20250422082957.2058229-2-treapking@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev8+g17a99a841c4b
Date: Mon, 28 Apr 2025 16:47:56 -0700
X-Gm-Features: ATxdqUGt6hXcRm7OLJk9Kd93IRb1IeGk61Kri8RoIXMe8x8uCjahMbyGOUSl8Co
Message-ID: <CAE-0n52fsf37Xg+Qpj-VwAiUO-kOWFRXKtqLL4VmxtCzAck2dA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: usb: Introduce usb-hub.yaml
To: Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
	Pin-yen Lin <treapking@chromium.org>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Pin-yen Lin (2025-04-22 01:28:27)
> diff --git a/Documentation/devicetree/bindings/usb/usb-hub.yaml b/Documentation/devicetree/bindings/usb/usb-hub.yaml
> new file mode 100644
> index 00000000000000..5238ab10576308
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/usb-hub.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/usb-hub.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic USB Hub
> +
> +maintainers:
> +  - Pin-yen Lin <treapking@chromium.org>
> +
> +allOf:
> +  - $ref: usb-device.yaml#
> +
> +properties:
> +  '#address-cells':
> +    const: 1
> +
> +  peer-hub:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to the peer hub on the controller.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description:
> +      The downstream facing USB ports
> +
> +    patternProperties:
> +      "^port@[1-9a-f][0-9a-f]*$":
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +patternProperties:
> +  '^.*@[1-9a-f][0-9a-f]*$':
> +    description: The hard wired USB devices
> +    type: object
> +    $ref: /schemas/usb/usb-device.yaml
> +    additionalProperties: true
> +
> +required:
> +  - compatible
> +  - reg

Can 'reg' be dropped because usb-device.yaml requires it?
