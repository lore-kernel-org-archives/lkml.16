Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5766B288C89
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470036; cv=none; b=rHNTG2WH04kPjQeBTDZUnXD6cCUt1tKEMUSTGk51MREzxW5GBdGKdBOQMLqI3NSDXSwf4DOKjNIVPxLyKZXboNSmOFfqRtrukuCVj/xEkbIlYtXRXCdSPPBtsZ4e3SBmL/5uYWlkp9g+z2Xsjsn5YIrPFjKFO46PynWzqygFYLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470036; c=relaxed/simple;
	bh=LJVxQf7NdIcUrlOkMpBxQHCXouOiNXQbPohW3ECQIQk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FIvrCzlPsNd9HyKFRh8oVKMJmbtSh+r+QDlJWV9TWiHZV+TJ2Kgr3bcWLxey0WbmU7mmMDSy9CE+DbHCKivpib5rgRL1OBsypNndhgo6cYAwokzJuNOL9OdDel0e2duRk6J11qR5takIUaXRKkWlUewnYMUQlqB8flaei18Sp+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Sj5lrHbl; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Sj5lrHbl"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4f379662cso3897756f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470033; x=1752074833; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mZEXD2+i9jrIQND3h3J1ExPn/hJoUIEOFDjyNRmi8MA=;
        b=Sj5lrHblMIfQ9wMMSxtj6jIvfESWaVoILlDEqW2+t/jq1SIFWFooJbhjdJQmqiiyE7
         h1nTutbkkxzq+RhPsprELq09EPcqQlbavNU0SOTikpJaXDelsSutui+j9jvVePoPtClu
         6TsB7E4nlBha7PRA+SyM6AtzeOegrBogJ2VCWGHE9mL0ZaQ7u8NHQcLe59x7exjcJnYU
         hhCgwcFdu5s3Yema9T2BBkWlirCpnA8k7BqNYvPHzILlpisaFZDqhGe+DxrMd+1oXrRH
         uU7TBNi8GLou4q/yhDt2PVUkG53448uvzCTnkJMJzGTJM1f0IP6KODfe88txz0psYhVX
         GtTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470033; x=1752074833;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mZEXD2+i9jrIQND3h3J1ExPn/hJoUIEOFDjyNRmi8MA=;
        b=gqQMWLqFZZ0iVXOdScmf88JTPs2jui/nNyFMGCYIpV82ChHIrLKHYe5zdXWLaNY3xQ
         TqvCY3tYRMhM4sm6zlwjHOkm29igpI7D7GdMEnKr3nfcU/WQ22WFs5TunPHNIMu8zBi1
         ZaG38Yjb4lMASTgjmzJFSfx5rykFoRAzE9eL9XxxNQgs1iOlmWuc5v1c8qmrCrG2yoXx
         ykX5p5e7MGdFEcj6hDJGF3Y9M3Xstp138aDizf9KtWOFkVvRcBkqQdPKo9Bj5YWo3eZX
         X0wHtOJ+js572m9RzcTO4W/SonD6OrXAKUqalTvtuj5AkndV4bjWFLTQRkk4PF/iHQi/
         ppMQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+nLXuKdScYc0MgPTzjMHub6kiNkbAxUQUehbItlD3KhGviWsEYHTsUbkWpNLpKBKh3LDsaEWJzm84Ef0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww0CEvOMAF2SmGdf66DKvMeB85DMSacZpBMpVJAWaHKbqH7Sat
	6d9xfmJMJypE55sNxtI8L2wGsLsF2V1+peO4ZWoinAEScEEhGuG5/8KLxGta9dd5PwE=
X-Gm-Gg: ASbGncv6FItEEsltbajBKxEStSUDpGrwstNjQZj5+j9BhT5lLnC2hFw4NSneEjUrMNa
	/sXagzlPLjZocs7Y/Mg9Rh23cWDnYhwcTVVAEvWkmCNWONVdvGlRSXZl7KPg9BzvT3+jzsgA5MG
	c3Evx3jayYVV/Qk3UsIBPlvANpeurxLx6I6wnI3o/mVOq0foLJ0KRklmJJr8Hz3HhPHv1Mh4HHx
	k81N2pHcLcdPT9dN0eZ0ptUFul7mybgElblL18fK0n+XPJqhMpVeX4vSb5ilVCpAs0bBGRA67nA
	kMXFgxskSI9CZoBJX9dR69GLFWx4iSxC75+8cVv2diI4htBzZMzAkOgEhiVn6rxyKVriTWJAv5o
	X
X-Google-Smtp-Source: AGHT+IECpWxeElBoSmJlvb93CQNlef939HEeihtXTY2qzYHwnEYlCFa1/geWXCnGm0yUCufzbNrdFg==
X-Received: by 2002:a05:6000:4028:b0:3a5:287b:da02 with SMTP id ffacd0b85a97d-3b200b4657bmr2630366f8f.40.1751470032604;
        Wed, 02 Jul 2025 08:27:12 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 00/26] clk: amlogic: clock controllers clean-up and
 factorisation
Date: Wed, 02 Jul 2025 17:25:58 +0200
Message-Id: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIZPZWgC/x2MMQqAMAwAvyKZDZhQBP2KOGiNGtRWWhSh+HeLw
 w033CWIElQitEWCILdG9S4LlQXYdXCLoE7ZgSs2xER4SPQO7b5lZHDXiWzQkB2FGjY1NZDTM8i
 sz7/t+vf9AECO6ihmAAAA
X-Change-ID: 20241211-meson-clk-cleanup-24-41cbe1924619
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5210; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=LJVxQf7NdIcUrlOkMpBxQHCXouOiNXQbPohW3ECQIQk=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU+yeQ57OOFVKwuT0WWvU3Gndq1dETWjEaNQW
 UlN7cL+DN+JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPsgAKCRDm/A8cN/La
 hYKJD/9+M0TmYQdd3/rSQbthQJaQj5IMrKfVvlmGpsIup6XF2eDdZesRI9d0dx3qbUusH/ZkSBv
 dFZ360Mkrh3KmVvSMhQ27HhAnCl+4ikVzKiOFWsW40pJ1Njyi+OPi83jqPuQM0VRxmK8wsX+Je+
 3WnON3E8oX0i8v+AKXZFoygZwe4eoDSEdvA0Ecy1yZCZzRB6ZBO16GElQmdAU60A6/6A1F8YJv0
 ixMR1YspvPjr2R2fXeM6RCgfhQ48u9Q98Tdmqv9jxuWIviHOF6TC12EinFxTXb+au6aOmHl97EN
 6lb9D4kh+xZ9hxHHEnaSvdEWG2i2SbFHo4vpe5fODA56uGN8f5uDAfzQATLlS98PxlaHqfOBxJp
 3rTkjnghRfIK42Pxpyeygsl/VHWjEHiF89WCvEPBuuXvfGp43PBK0HtI6s1y1GrLHph444DO84F
 RnBQNrTWcHKJCPhERyUUB/0C7yTD/ndbZgmZzqnhIPA/B1ZrOxOcIdCRwd788VxIHo0YklB1Rr3
 vLfVn0J1WNWl8JH5TY9UB2Q7jxZCN3U0mGZ5I3rVDjuhEO3S4O/57FXFIz8QewKGLhNXTAROkDl
 d6t3WjrO19YZUDhgJGUOLsjPoKld6FZhT1/qRCLM/rA/1Luto/JmY34J2zJhIJDZ7YQTmI8EqJZ
 lnruOJj7adMCW/w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The work on this patchset started with the submission of the Amlogic t7
peripheral clock controller [1]. This controller is fairly similar to
existing controllers. Once again, it redefines the peripheral clock macro,
the probe function and composite clock helpers, even if it is almost the
same as in other controllers. This code duplication trend has been going on
for too long and now is the time to properly address the problem.

There is clearly 4 parts in this patchset. These are sent together for v1
to show why what the ugly first part is useful. If more versions are
needed, the patchset will be split in 4.

While all controllers are doing more or less the same things, tiny and
often pointless differences have emerged between the controllers. This
makes it harder to exploit SoC commonalities.

The first part of this series deals with that problem and realign things
up. There is nothing complicated going on there beside renaming. It is the
ugly stuff, yet necessary, we have to go through to get to the interesting
stuff afterwards. There is one change per controller for the review, with
the intent to squash this into a single change on application.

Second is the factorisation of the probe functions so those stop being
copy/pasted in each clock controller drivers.

Then the clean-up and factorisation for the PCLK macros, again to stop
copy/paste but also the silent use CLK_IGNORE_UNUSED.

Finally the introduction of macros for composite clock definitions. The
same pattern as the for the PCLKs started to appear on s4, c3 and t7. Done
properly, this could also help reduce the verbosity of the older
controllers.

With this, the c3-peripherals controller may be used as an example of what
future similar controllers should look like.

After this, there is still some house keeping to be done in the amlogic
clock drivers:
- Moving remaining reset drivers to the reset subsystem
- Proper decoupling of clk-regmap from the clock controllers
- Reduce verbosity of older controllers with the composite macros, where it
  makes sense.

[1]: https://lore.kernel.org/linux-clk/20250108094025.2664201-6-jian.hu@amlogic.com/

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (26):
      clk: amlogic: a1-peripherals: naming consistency alignment
      clk: amlogic: a1-pll: naming consistency alignment
      clk: amlogic: axg-ao: naming consistency alignment
      clk: amlogic: axg: naming consistency alignment
      clk: amlogic: c3-peripherals: naming consistency alignment
      clk: amlogic: c3-pll: naming consistency alignment
      clk: amlogic: g12a-ao: naming consistency alignment
      clk: amlogic: g12a: naming consistency alignment
      clk: amlogic: gxbb-ao: naming consistency alignment
      clk: amlogic: gxbb: naming consistency alignment
      clk: amlogic: meson8b: naming consistency alignment
      clk: amlogic: s4-peripherals: naming consistency alignment
      clk: amlogic: s4-pll: naming consistency alignment
      clk: amlogic: meson8-ddr: naming consistency alignment
      clk: amlogic: drop meson-clkcee
      clk: amlogic: add probe helper for mmio based controllers
      clk: amlogic: use probe helper in mmio based controllers
      clk: amlogic: aoclk: use clkc-utils syscon probe
      clk: amlogic: move PCLK definition to clkc-utils
      clk: amlogic: drop CLK_SET_RATE_PARENT from peripheral clocks
      clk: amlogic: pclk explicitly use CLK_IGNORE_UNUSED
      clk: amlogic: introduce a common pclk definition
      clk: amlogic: use the common pclk definition
      clk: amlogic: add composite clock helpers
      clk: amlogic: align s4 and c3 pwm clock descriptions
      clk: amlogic: c3-peripherals: use helper for basic composite clocks

 drivers/clk/meson/Kconfig            |   13 +-
 drivers/clk/meson/Makefile           |    1 -
 drivers/clk/meson/a1-peripherals.c   |  995 +++++-----
 drivers/clk/meson/a1-pll.c           |  124 +-
 drivers/clk/meson/axg-aoclk.c        |  153 +-
 drivers/clk/meson/axg.c              |  237 +--
 drivers/clk/meson/c3-peripherals.c   | 2055 ++++++---------------
 drivers/clk/meson/c3-pll.c           |  245 ++-
 drivers/clk/meson/clk-regmap.h       |   20 -
 drivers/clk/meson/g12a-aoclk.c       |  238 +--
 drivers/clk/meson/g12a.c             | 3316 +++++++++++++++++-----------------
 drivers/clk/meson/gxbb-aoclk.c       |  123 +-
 drivers/clk/meson/gxbb.c             |  611 ++++---
 drivers/clk/meson/meson-aoclk.c      |   32 +-
 drivers/clk/meson/meson-aoclk.h      |    2 +-
 drivers/clk/meson/meson-clkc-utils.c |   89 +-
 drivers/clk/meson/meson-clkc-utils.h |   89 +
 drivers/clk/meson/meson-eeclk.c      |   60 -
 drivers/clk/meson/meson-eeclk.h      |   24 -
 drivers/clk/meson/meson8-ddr.c       |   62 +-
 drivers/clk/meson/meson8b.c          |  746 ++++----
 drivers/clk/meson/s4-peripherals.c   | 1160 ++++--------
 drivers/clk/meson/s4-pll.c           |   82 +-
 23 files changed, 4437 insertions(+), 6040 deletions(-)
---
base-commit: 2c37e1c671428002519e7615d786b9b692261052
change-id: 20241211-meson-clk-cleanup-24-41cbe1924619

Best regards,
-- 
Jerome

