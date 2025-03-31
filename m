Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619692144A2
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743435591; cv=none; b=pkQP9PRmT2OsqOFkcSdxbWFhFlNCtx02+MxvdfDTU6jNMxntIx0f2e8f/6SeogEHu0sotBXNADqktnBJHBL5Pl4HCvI1VQY6c8CRqFgcW+3FM5ScVjhKQ93uZ3ctGwY+0rYr4QCy7K85UHX9izMj6faOAqUoo+FejBFGKl4GmAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743435591; c=relaxed/simple;
	bh=BZHR9fwBUr9R6ixWKgn1n8QQcRUqJhgpg4Wrsfh3w2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YFP6qdngVva9bOB7EYf0gd6szF6RCIjJ47e4FNo+ItJ5Whhd6nr4Q/2PGxPqeQZ+AJiN4zJ9D5tXOWi9UbepI5xZxE+Ymam+kLZMo7r9/Q8IYSd0xCEdZF0++DJenejaA1u6Yy4lc3LSrV00TFnra7p7k3+0vfjiNs93BcawfLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QVGvXaB2; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QVGvXaB2"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43948021a45so46829655e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743435587; x=1744040387; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1sNg10NoCtirreV3RmWGt7kQXy82wXq+5oOziEES3k4=;
        b=QVGvXaB2G1y5CaHnn7Dl2zyOb6yE+UjC8mrDOZlFvNUVKruWOVaTtviKbgUJOrl+wh
         5aurhcNWSJmyyyQgFypeqejY2adtQx/woN7IyQX1geniONmy2LlCm/Yk63CWCMPm5fRN
         PQTPKnNMFAhVBey/mqrbpAxBojG9la1Btxyk602P7sQ5FGqp5/0UbnqyFT/sXAI+/d4I
         e19HiHeO2uRtUQwc75goVyV6X8jL/Mi2zOuiibm8/7RRl1LfmoQqcM1M3yzE3zM+w441
         KGzod9RAJKnH1IgVo6BIQQ9oeeQeIuM21zzL+Pq5j6abOuS9xunUMo+UAhnrv9bRHFDj
         mfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743435587; x=1744040387;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1sNg10NoCtirreV3RmWGt7kQXy82wXq+5oOziEES3k4=;
        b=JZKN7ERQs6LVIldbhbY7hhDgUKSvsmyXPQt7h5RtXPcag5VGjiZDbJsq2dXA2+ggSg
         GATW+bE+sx0Ac63BpseRZje9qxXRKnTPkq6YY4ICe3C3/aCS7wkzXqoivPGq8KyyzUSY
         Jca/CvM4nD8A/mkzriPyvK9YlYFhMKbgR+RbFej52ftuYwqn68ZHtD7FVptE15U5gvyL
         ZqjhIdeZzjxa4ZemLxwwDk6b73vqJCh8pVT5cvDRpxjOv8Iibeqp6WLVfCMMaZL5Kad+
         Sdy4ZJc43GekSmeZIpe0H69o2AKz36HDtaPQWKw4Fyb5GzlCx1ccxjnG1SqugkFTiQT/
         BSiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyyLHhS8fbzhSSAZYml7tztzmlfxVBdOgm6Hhhw7QHmNo1nmADtLPRyQNzoEgLyNZ7S0GWTX1PZQotOxM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl0rNtIWMIcx5fnR2q+TmWXbrozOUZLBGTfAvDuLlSgMaXNeRH
	lZmR1X0oX3TqjtvPH2Jy4bn7JPaIh7m9LNVicudvOpd4XtS6JkuY4GPwlufD/EWXlRXRjFaw0iv
	wi5wXAc4o9qYi1gPfHyFTevIBFfAqZG9v73HKvA==
X-Gm-Gg: ASbGncseZhzfInumKkul9iVwoxu8+C4Zq/002T0aNOfHIP0cFa6haNqEVJU5cNT+LTN
	o+wRuF5LJWHxFkKLJUnnsKRNq0/B/Zma7noh+VoH3eQYvvzUPEIJPDtqq9tYevZp7RsKC6vFLQ8
	/ofNbpddngtL9AlFAEdqb8HzXgpNlF
X-Google-Smtp-Source: AGHT+IFq8kefn/iwjp3s9ms0HQTK+BhHSf0ZsbQcmKw5Vm41+dOdUlPBBEt/0fVmInccDrEv7cwRoXPu9DZcYcXNgvM=
X-Received: by 2002:a05:600c:3485:b0:43d:2230:300f with SMTP id
 5b1f17b1804b1-43dabe237f8mr100927755e9.0.1743435586577; Mon, 31 Mar 2025
 08:39:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-0-45d5f2747398@linaro.org>
 <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-1-45d5f2747398@linaro.org> <Z-pJP4PMwPo3L3Og@hovoldconsulting.com>
In-Reply-To: <Z-pJP4PMwPo3L3Og@hovoldconsulting.com>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Mon, 31 Mar 2025 17:39:35 +0200
X-Gm-Features: AQ5f1JoEit7j_TzMlyZa7QbfN6E0NDm9GuAOKbUqEfVJoM1pbPZfw3UrD5vfGmY
Message-ID: <CACr-zFA_oSySRnA2VaSQk2ND_AHeyt3v=RuPTbABPM7SYown6g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to
 eDP panel
To: Johan Hovold <johan@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Johan,

On Mon, 31 Mar 2025 at 09:50, Johan Hovold <johan@kernel.org> wrote:
>
> On Thu, Mar 27, 2025 at 04:56:53PM +0000, Christopher Obbard wrote:
> > The eDP panel has an HPD GPIO. Describe it in the device tree
> > for the generic T14s model, as the HPD GPIO property is used in
> > both the OLED and LCD models which inherit this device tree.
>
> AFAICT, this patch is not correct as the hotplug detect signal is
> connected directly to the display controller on (these) Qualcomm SoCs
> and is already handled by its driver.
>
> Describing it as you do here leads to less accurate delays, see commits:
>
>         2327b13d6c47 ("drm/panel-edp: Take advantage of wait_hpd_asserted() in struct drm_dp_aux").
>         3b5765df375c ("drm/panel: atna33xc20: Take advantage of wait_hpd_asserted() in struct drm_dp_aux")
>
> Perhaps you lose some other functionality too.
>
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> > index 962fb050c55c4fd33f480a21a8c47a484d0c82b8..46c73f5c039ed982b553636cf8c4237a20ba7687 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> > @@ -980,8 +980,12 @@ &mdss_dp3 {
> >       aux-bus {
> >               panel: panel {
> >                       compatible = "edp-panel";
> > +                     hpd-gpios = <&tlmm 119 GPIO_ACTIVE_HIGH>;
> >                       power-supply = <&vreg_edp_3p3>;
> >
> > +                     pinctrl-0 = <&edp_hpd_n_default>;
> > +                     pinctrl-names = "default";
> > +
> >                       port {
> >                               edp_panel_in: endpoint {
> >                                       remote-endpoint = <&mdss_dp3_out>;
> > @@ -1286,6 +1290,13 @@ hall_int_n_default: hall-int-n-state {
> >               bias-disable;
> >       };
> >
> > +     edp_hpd_n_default: edp-hpd-n-state {
> > +             pins = "gpio119";
> > +             function = "gpio";
> > +             drive-strength = <2>;
> > +             bias-pull-up;
> > +     };
>
> I checked the firmware configuration for this pin on my T14s, which
> does not match what you have here. Instead the function is set to
> "edp0_hot" which forwards the signal to the display controller which
> already handles the signal on panel power on. (And there is also no
> internal pull up enabled).
>
> We may want to describe this pin configuration somewhere, but that's a
> separate issue.

Thanks for your review, I will send another version in coming days and
drop this first patch (adding hpd to the T14s DTSI).

As a consequence I will need to add no-hpd property to the panel node.
I will add a short comment about how the hpd signal is handled by the
driver already.

Thanks!

Chris
