Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB052641DB;
	Tue,  8 Apr 2025 08:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744101684; cv=none; b=KN2CwfWZ7z697iLwOW0BjGxZDAPchTLmA3faevt/pcl9MFdxWzG3wGfcnZbVeJqnsfOgWfsvvyqpf3NfS39lLIP+5mYbQnCwo1xfbeGmdgGlB/UO55dJABC6F1rmvhsAbzVXOV8Y5tY9/pt3vAQCM4SIuyAX9/AAWhzXodFLQaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744101684; c=relaxed/simple;
	bh=Iqee5RrWEeGxdk7646RRwu+1jLljC0WdgOXwKzC+Dqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3hONeo3G5niQyeIi0t/K8vfTvmutqnWnfYhsH3fquMYNtggZyWaDTIZ70BtTArFiijtBdOpdXG4vxNMS0SnVpDlA0dslcd0u27sSSGnPphvd5kE8pjSg5kOCbl9ha0dITk5TJhYhiw9Ba7nWvMU9B75H1qRnCRlop82w7ka/wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egXKRSzI; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egXKRSzI"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5499614d3d2so6094835e87.3;
        Tue, 08 Apr 2025 01:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744101681; x=1744706481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ACIOIbm0p+1PTv9P9JIta3dAyYPe2LdYdKxjKYYTx9Y=;
        b=egXKRSzIn7DrQCDrhuW2GfGrNKVQWDRZLaVRui5PyJm1wUZYMCtnua2vBg65aFC+hb
         OrTS8KFBWpJeUNuLe8lq1CZX9yNVEtvF09WlhnhR+KHNbb7kqTUFpBdyammxrsXSWWcd
         EmybE/tgYzX1AFVEMaAZfxrnw70Z5lxbQGIoV9M/paTG3zJe6bRIKr2u89BErR1hJQq/
         73B69UCRiGRJg03QwBVvCtC8Cj948QnJz/T8MZk0XlyeLj5Fv9LYEMfGYglK1V8k6JuK
         WxeLDsLH1Qp9wxSyxweeTHGISJtJPOZLUybjVwW866AK3mOQgdyxvxDi3770ES6Pvir3
         +Zjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744101681; x=1744706481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ACIOIbm0p+1PTv9P9JIta3dAyYPe2LdYdKxjKYYTx9Y=;
        b=bYNKrsUgykKNU7mbyAzFSwUt6o0VshY6POnwzWrAiVCC5xmN+0KfQiRhApIyEFKS+i
         vPkZMKFnig1BEux/zh5FhaWfWoGaGriXPY2/vj3uX6DPRJYO+ueXDSy0JX9Hdp/8Ns8s
         mxMsVrcXaEuHXftsyGuMmFEfWnRtGYU319Qdr6Ej6v/oA1PbJQlkEveILm0nvmctOtSl
         NZSSOiU2P6MHWXDrryOSqQQkqnOD2cUGerg4s5kv/xrKdv5Co8JoE5SEhtPfr9z8siEZ
         fhskv7HzBX09zw6pKIhHxRL/BXAwg0Mnt1rrwD10bUz5oMzdzQoMmogq2sUS4JOQT0bx
         h82A==
X-Forwarded-Encrypted: i=1; AJvYcCVfjk2k9lADtRoTo5J/GqVEf5w66nt8qs4UDZUBoK0QEe1jwEklRCBDO101B+PkXW52suZwmEd2kINxM6hf@vger.kernel.org, AJvYcCVkBSTBfMNkvuyadC4np93tS2piqvzudqAHbYAQ3L21Shl33jaoehef1xHMw5Xh014TQh5Y5fWj7Sbr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9U5pnsVZ2vywad+Y6rs6XDx2kUsVQg4uK8wcANvonJDU2NZT6
	3FXCnXqtuG5Ig9D+QyJMupUAl1EoA/5qxYMxV85QGf+qOZ3G/iTQ/bxukw==
X-Gm-Gg: ASbGncva/uGR/3evh0p72YnaVNk+Tn5g5yEJ18i2BwZHmjUMHPOhMaOxYCZRMazZJ/v
	/gRmrSasB7vCGIkTP0biEoCigyIi6J+Y+BaecjteD1rKuJrUPH1cild15zMhIBg3F0mVLrYZVY8
	erouIhDWSVcDNZiUCu1Z+zSAs/WXtxorFJuVEdZiNf0m/gKIqHHkkqfRTdmRVquT6e+rE/i96BO
	pxw/p5GiUqYisJNODzndPFweX1i4MAYuaWvCfkI/joQt2vqXlFSiyTdkg5jcW+x5P4PF1s8peDH
	ADGgLSKq9WkZL2WxpWbTRZ+WCB1h49GSetG0yDUvv26q++Rx9m51TLBQEg==
X-Google-Smtp-Source: AGHT+IEm21EBbYmNkyzRDOFs9TzsbgYse65RwBYM1gdJbCrrwjvMVZPVowKwrXwUH3ajBMGduDYe1Q==
X-Received: by 2002:a05:6512:3b98:b0:549:7145:5d28 with SMTP id 2adb3069b0e04-54c232f7744mr3502276e87.25.1744101680828;
        Tue, 08 Apr 2025 01:41:20 -0700 (PDT)
Received: from mva-rohm ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e635bd6sm1475351e87.157.2025.04.08.01.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:41:19 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:41:16 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/14] dt-bindings: mfd: bd96801: Add ROHM BD96805
Message-ID: <f49addee698b683a071c12808f06a56509152f5c.1744090658.git.mazziesaccount@gmail.com>
References: <cover.1744090658.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5+V+aybW6NeMgsZb"
Content-Disposition: inline
In-Reply-To: <cover.1744090658.git.mazziesaccount@gmail.com>


--5+V+aybW6NeMgsZb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The ROHM BD96805 is very similar to the BD96801. The differences visible
to the drivers is different tune voltage ranges.

Add compatible for the ROHM BD96805 PMIC.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

---
Revision history:
 v1 =3D> :
  - No changes
---
 .../devicetree/bindings/mfd/rohm,bd96801-pmic.yaml     | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd96801-pmic.yaml b=
/Documentation/devicetree/bindings/mfd/rohm,bd96801-pmic.yaml
index efee3de0d9ad..0e06570483ae 100644
--- a/Documentation/devicetree/bindings/mfd/rohm,bd96801-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/rohm,bd96801-pmic.yaml
@@ -4,19 +4,21 @@
 $id: http://devicetree.org/schemas/mfd/rohm,bd96801-pmic.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
=20
-title: ROHM BD96801 Scalable Power Management Integrated Circuit
+title: ROHM BD96801/BD96805 Scalable Power Management Integrated Circuit
=20
 maintainers:
   - Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
=20
 description:
-  BD96801 is an automotive grade single-chip power management IC.
-  It integrates 4 buck converters and 3 LDOs with safety features like
+  BD96801 and BD96805 are automotive grade, single-chip power management I=
Cs.
+  They both integrate 4 buck converters and 3 LDOs with safety features li=
ke
   over-/under voltage and over current detection and a watchdog.
=20
 properties:
   compatible:
-    const: rohm,bd96801
+    enum:
+      - rohm,bd96801
+      - rohm,bd96805
=20
   reg:
     maxItems: 1
--=20
2.49.0


--5+V+aybW6NeMgsZb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmf04SwACgkQeFA3/03a
ocX2xwgAgBu1xyqzQgr2AzTACxbU95p5svkRVMluMGTMKIYZUN19lxZ+sJN3dHV8
Yru7ncEpOv7GQzCyADm1BfatTu4sANYRVfvU9TzyihEEZCLXsWyt1a+q4kIAO8Ga
3N8ysIgZgU7X2HO5rta3yM+wYgExwol+4br2emQhZO9Ebf26hJWp1SbA5uirnOoD
bbfhYlCA8EMOyYAgapzxAMBDtNg+mnrdDuveKMoOoT+SPjMc1JwBtj5CsS8ZTzJd
mQNgqLTgtYTbuIfP9A9LQc4MYv6UyR4R3HDapMr1Fn8iaTbt4boTN9v5TPy0mHO+
DK7tGrB3hqOuA/jPIocv/z2eJbv4EA==
=uCOW
-----END PGP SIGNATURE-----

--5+V+aybW6NeMgsZb--
